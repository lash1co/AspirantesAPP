using DevExpress.Web.Mvc;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using AspirantesApp.Models;
using AspirantesApp.Enums;
using AspirantesApp.Models.ViewModels;
using AspirantesApp.Filters;
using AspirantesApp.Services;
using System.IO;
using System;
using AspirantesApp.Utils;

namespace AspirantesApp.Controllers
{
    [AutorizarUsuario(role: (int)Rol.Aspirante)]
    public class InscripcionController : Controller
    {
        private readonly IInscripcion _inscripcionService;
        private readonly IGeoreferencia _georeferenciaService;
        private readonly ISelectListService _selectListService;
        private readonly IAspirante _aspiranteService;

        public InscripcionController(IInscripcion inscripcionService, IGeoreferencia georeferenciaService, IAspirante aspiranteService, ISelectListService selectListService)
        {
            _inscripcionService = inscripcionService;
            _georeferenciaService = georeferenciaService;
            _aspiranteService = aspiranteService;
            _selectListService = selectListService;
        }

        public async Task<ActionResult> Index()
        {
            var oUsuario = Session["usuario"] as Usuario;
            var inscripciones = await _inscripcionService.ObtenerInscripcionesPorUsuario(oUsuario.Id);
            if (inscripciones != null && inscripciones.ToList().Count() > 0)
            { 
                return View(inscripciones); 
            }
            else
            {
                return RedirectToAction("CrearEditarInscripcion");
            }
        }

        public async Task<ActionResult> DatosBasicos(long? id)
        {
            var oUsuario = Session["usuario"] as Usuario;
            if (id == null || id <= 0)
            {
                return RedirectToAction("Index");
            }
            var inscripcion = await _inscripcionService.ObtenerPrimeraInscripcionPorUsuario(oUsuario.Id);
            if (inscripcion == null || inscripcion.Id_Usuario != oUsuario.Id || id != inscripcion.Id)
            {
                return RedirectToAction("Index");
            }
            else
            {
                var aspirante = await _aspiranteService.ObtenerAspirantePorInscripcion(inscripcion.Id);
                if (aspirante != null)
                {
                    var nombreFoto = Path.GetFileName(aspirante.Foto);
                    var model = new DatosBasicosViewModel();
                    model.Foto = nombreFoto;
                    model.Nombres = aspirante.Nombres;
                    model.Apellidos = aspirante.Apellidos;
                    model.Numero_Celular = aspirante.Numero_Celular;
                    model.Numero_Telefono = aspirante?.Numero_Telefono;
                    model.Tipo_Documento = aspirante.Tipo_Documento.Tipo;
                    model.Ciudad_Nacimiento = aspirante.Municipio.Nombre;
                    model.Ciudad_Expedicion = aspirante.Municipio1.Nombre;
                    model.Numero_Documento = aspirante.Numero_Documento;
                    model.Fecha_Nacimiento = aspirante.Fecha_Nacimiento.ToString("dd/MM/yyyyy");
                    model.Fecha_Expedicion = aspirante.Fecha_Expedicion.ToString("dd/MM/yyyyy");
                    model.Completo = aspirante.Completo;
                    model.Grupo_Sanguineo = aspirante.Grupo_Sanguineo.Grupo;
                    model.Estado_Civil = aspirante.Estado_Civil.Estado;
                    model.Sexo = aspirante.Genero.Sexo;
                    return View(model);
                }
                else
                {
                    return RedirectToAction("CrearDatosBasicos");
                }
            }
        }

        public async Task<ActionResult> CrearDatosBasicos()
        {
            await ConfigurarViewBagsDatosBasicos();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CrearDatosBasicos(AspiranteViewModel aspiranteViewModel)
        {
            var oUsuario = Session["usuario"] as Usuario;
            var inscripcion = await _inscripcionService.ObtenerPrimeraInscripcionPorUsuario(oUsuario.Id);
            if (inscripcion == null)
            {
                return RedirectToAction("Index");
            }
            if (ModelState.IsValid && aspiranteViewModel != null && aspiranteViewModel.Foto.ContentLength > 0)
            {
                var fileName = $"{Guid.NewGuid()}User{oUsuario.Id}{Path.GetExtension(aspiranteViewModel.Foto.FileName)}";
                var uploadDir = Server.MapPath("~/Imagenes");
                string errorMessage;
                var filePath = Path.Combine(uploadDir, fileName);
                var fotoGuardada = FotoHelper.GuardarFoto(filePath, uploadDir, aspiranteViewModel.Foto, out errorMessage);
                if (fotoGuardada)
                {
                    ViewBag.Message = "La foto se subio con exito!";
                    try
                    {
                        await _aspiranteService.AgregarAspirante(inscripcion.Id, filePath, aspiranteViewModel);
                        var inscripcionCompleta = await _inscripcionService.CompletarInscripcion(inscripcion.Id);
                        if (inscripcionCompleta)
                            return RedirectToAction("Index");
                    }
                    catch
                    {
                        ModelState.AddModelError("", "Algo ha ocurrido y no se pudo guardar la información. Por favor, intente nuevamente.");
                    }
                }
                else
                {
                    ModelState.AddModelError("", errorMessage);
                }
            }
            await ConfigurarViewBagsDatosBasicos(null,ocultarDepartamentos: (int)Info.Mostrar,
                ocultarMunicipios: (int)Info.Mostrar, aspiranteViewModel.Id_Estado_Civil, aspiranteViewModel.Id_Genero,
                aspiranteViewModel.Id_Grupo_Sanguineo,aspiranteViewModel.Id_Tipo_Documento
                );
            return View(aspiranteViewModel);
        }

        public async Task<ActionResult> CrearEditarInscripcion(long? id)
        {
            var oUsuario = Session["usuario"] as Usuario;
            if (id == null || id <= 0)
            {
                var inscripciones = await _inscripcionService.ObtenerInscripcionesPorUsuario(oUsuario.Id);
                if (inscripciones != null && inscripciones.Count()>0)
                {
                    return RedirectToAction("Index");
                }
                await ConfigurarViewBagsInscripcion();
                return View();
            }
            else
            {
                var inscripcion = await _inscripcionService.ObtenerInscripcion((long)id);
                if (inscripcion == null && inscripcion.Id_Usuario != oUsuario.Id)
                {
                    return RedirectToAction("Index");
                }
                if (inscripcion.Completo) // Si ya lleno todos los datos ya no permite modificar la inscripción
                {
                    return RedirectToAction("Index");
                }
                var viewModel = new InscripcionViewModel
                {
                    Id_Tipo_Aspirante = inscripcion.Id_Tipo_Aspirante,
                    Id_Modalidad = inscripcion.Id_Modalidad,
                    Id_Sede = inscripcion.Id_Sede,
                    Id_Programa = inscripcion.Id_Programa,
                    Id_Periodo = inscripcion.Id_Periodo
                };
                await ConfigurarViewBagsInscripcion(viewModel.Id_Modalidad, viewModel.Id_Periodo, viewModel.Id_Programa, viewModel.Id_Sede, viewModel.Id_Tipo_Aspirante);
                return View(viewModel);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CrearEditarInscripcion(long? id, InscripcionViewModel viewModel)
        {
            var oUsuario = Session["usuario"] as Usuario;
            if (id == null || id <= 0)
            {
                if (ModelState.IsValid)
                {
                    var existe_inscripcion = await _inscripcionService.ObtenerPrimeraInscripcionPorUsuario(oUsuario.Id);
                    if (existe_inscripcion != null)
                    {
                        return RedirectToAction("Index");
                    }
                    try
                    {
                        await _inscripcionService.AgregarInscripcionPorUsuario(oUsuario.Id, viewModel);
                        var nuevaInscripcion = await _inscripcionService.ObtenerPrimeraInscripcionPorUsuario(oUsuario.Id);
                        return RedirectToAction("DatosBasicos", new { id = nuevaInscripcion.Id });
                    }
                    catch
                    {
                        ModelState.AddModelError("", "Algo ha ocurrido y no se pudo guardar la información. Por favor, intente nuevamente.");
                    }
                }
                await ConfigurarViewBagsInscripcion(viewModel.Id_Modalidad, viewModel.Id_Periodo, viewModel.Id_Programa, viewModel.Id_Sede, viewModel.Id_Tipo_Aspirante);
                return View(viewModel);
            }
            else
            {
                if (ModelState.IsValid)
                {
                    try
                    {
                        var actualizado = await _inscripcionService.ActualizarInscripcionDeUsuario((long)id, oUsuario.Id, viewModel);
                        if (actualizado)
                            return RedirectToAction("Index");
                    }
                    catch
                    {
                        ModelState.AddModelError("", "Algo ha ocurrido y no se pudo guardar la información. Por favor, intente nuevamente.");
                    }
                }
                await ConfigurarViewBagsInscripcion(viewModel.Id_Modalidad, viewModel.Id_Periodo, viewModel.Id_Programa, viewModel.Id_Sede, viewModel.Id_Tipo_Aspirante);
                return View(viewModel);
            }
        }

        private async Task ConfigurarViewBagsInscripcion(int? idModalidad = null, int? idPeriodo = null, int? idPrograma = null, int? idSede = null, int? idTipoAspirante = null)
        {
            ViewBag.Id_Modalidad = await _selectListService.ObtenerModalidadesAsync(idModalidad);
            ViewBag.Id_Periodo = await _selectListService.ObtenerPeriodosAsync(idPeriodo);
            ViewBag.Id_Programa = await _selectListService.ObtenerProgramasAsync(idPrograma);
            ViewBag.Id_Sede = await _selectListService.ObtenerSedesAsync(idSede);
            ViewBag.Id_Tipo_Aspirante = await _selectListService.ObtenerTiposAspiranteAsync(idTipoAspirante);
        }

        private async Task ConfigurarViewBagsDatosBasicos(int? idPais = null, int ocultarDepartamentos = 1, int ocultarMunicipios = 1, int? idEstadoCivil = null, int? idGenero = null, int? idGrupoSanguineo = null, int? idTipoDocumento = null)
        {
            ViewBag.Paises = await _selectListService.ObtenerPaisesAsync(idPais);
            ViewBag.Departamentos = ocultarDepartamentos == (int)Info.Ocultar ? new SelectList(Enumerable.Empty<SelectListItem>()) : await _selectListService.ObtenerDepartamentosAsync();
            ViewBag.Municipios = ocultarMunicipios == (int)Info.Ocultar ? new SelectList(Enumerable.Empty<SelectListItem>()) : await _selectListService.ObtenerMunicipiosAsync();
            ViewBag.Id_Estado_Civil = await _selectListService.ObtenerEstadosCivilesAsync(idEstadoCivil);
            ViewBag.Id_Genero = await _selectListService.ObtenerGenerosAsync(idGenero);
            ViewBag.Id_Grupo_Sanguineo = await _selectListService.ObtenerGruposSanguineosAsync(idGrupoSanguineo);
            ViewBag.Id_Tipo_Documento = await _selectListService.ObtenerTiposDocumentoAsync(idTipoDocumento);
        }

        public async Task<JsonResult> GetDepartamentosByPais(int paisId)
        {
            var departamentos = await _georeferenciaService.ObtenerDepartamentosPorPais(paisId);
            var listaDepartamentos = departamentos.Select(d => new { d.Id, d.Nombre });
            return Json(listaDepartamentos, JsonRequestBehavior.AllowGet);
        }

        public async Task<JsonResult> GetMunicipiosByDepartamento(int departamentoId)
        {
            var municipios = await _georeferenciaService.ObtenerMunicipiosPorDepartamento(departamentoId);
            var listaMunicipios = municipios.Select(m => new {m.Id, m.Nombre });
            return Json(listaMunicipios, JsonRequestBehavior.AllowGet);
        }
    }
}
