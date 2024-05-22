using AspirantesApp.Models;
using AspirantesApp.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace AspirantesApp.Services
{
    public interface IAspirante
    {
        Task<IEnumerable<AspirantesDetalleViewModel>> ObtenerAspirantes();
        Task<Aspirante> ObtenerAspirantePorInscripcion(long idInscripcion);
        Task AgregarAspirante(long idInscripcion, string filePath, AspiranteViewModel viewModel);
        Task<Aspirante> ObtenerAspirantePorId(long idAspirante);
    }

    public class AspiranteService : IAspirante
    {
        private readonly UAMDBEntities _context;

        public AspiranteService(UAMDBEntities context)
        {
            _context = context;
        }

        public async Task AgregarAspirante(long idInscripcion, string filePath, AspiranteViewModel viewModel)
        {
            var aspirante = new Aspirante();
            aspirante.Completo = true;
            aspirante.Nombres = (viewModel.PrimerNombre.Trim() + " " + viewModel.SegundoNombre?.Trim()).Trim();
            aspirante.Apellidos = (viewModel.PrimerApellido.Trim() + " " + viewModel.SegundoApellido.Trim()).Trim();
            aspirante.Fecha_Nacimiento = (DateTime)viewModel?.Fecha_Nacimiento;
            aspirante.Id_Ciudad_Nacimiento = viewModel.Id_Ciudad_Nacimiento;
            aspirante.Id_Estado_Civil = (int)viewModel.Id_Estado_Civil;
            aspirante.Id_Genero = (int)viewModel.Id_Genero;
            aspirante.Id_Grupo_Sanguineo = viewModel.Id_Grupo_Sanguineo;
            aspirante.Fecha_Expedicion = (DateTime)viewModel?.Fecha_Expedicion;
            aspirante.Id_Ciudad_Expedicion = viewModel.Id_Ciudad_Expedicion;
            aspirante.Id_Tipo_Documento = viewModel.Id_Tipo_Documento;
            aspirante.Numero_Documento = viewModel.Numero_Documento;
            aspirante.Id_Inscripcion = idInscripcion;
            aspirante.Foto = filePath;
            aspirante.Numero_Telefono = viewModel?.Numero_Telefono;
            aspirante.Numero_Celular = viewModel.Numero_Celular;
            _context.Aspirante.Add(aspirante);
            await _context.SaveChangesAsync();
        }

        public async Task<Aspirante> ObtenerAspirantePorId(long idAspirante)
        {
            return await AspirantesQuery().FirstOrDefaultAsync(a=>a.Id == idAspirante);
        }

        public async Task<Aspirante> ObtenerAspirantePorInscripcion(long idInscripcion)
        {
            return await AspirantesQuery().FirstOrDefaultAsync(a => a.Id_Inscripcion == idInscripcion);
        }

        public async Task<IEnumerable<AspirantesDetalleViewModel>> ObtenerAspirantes()
        {
            var aspirantes = await AspirantesQuery().ToListAsync();

            var inscripcionesViewModel = aspirantes.Select(a => new AspirantesDetalleViewModel
            {
                Id = a.Id,
                DocumentosAdjuntos = "~/Images/documentos.png", 
                Estado = a.Inscripcion.Estado_Inscripcion.Estado,
                Sede = a.Inscripcion.Sede.Nombre,
                ProgramaAcademico = a.Inscripcion.Programa_Academico.Nombre,
                PeriodoAcademico = a.Inscripcion.Periodo_Academico.Periodo.ToString(),
                TipoDocumento = a.Tipo_Documento.Tipo,
                NumeroDocumento = a.Numero_Documento,
                Nombres = a.Nombres,
                Apellidos = a.Apellidos,
                NumeroTelefono = a.Numero_Telefono,
                NumeroCelular = a.Numero_Celular,
                Correo = a.Inscripcion.Usuario.Email.ToString(),
            }).ToList();

            return inscripcionesViewModel;
        }

        private IQueryable<Aspirante> AspirantesQuery()
        {
            return _context.Aspirante
                .Include(a => a.Inscripcion)
                .Include(a => a.Inscripcion.Usuario)
                .Include(a => a.Inscripcion.Estado_Inscripcion)
                .Include(a => a.Inscripcion.Sede)
                .Include(a => a.Inscripcion.Programa_Academico)
                .Include(a => a.Inscripcion.Periodo_Academico)
                .Include(a => a.Tipo_Documento);
        }
    }
}