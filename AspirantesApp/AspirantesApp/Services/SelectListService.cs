using AspirantesApp.Models;
using System.Data.Entity;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace AspirantesApp.Services
{
    public interface ISelectListService
    {
        Task<SelectList> ObtenerModalidadesAsync(object selectedValue = null);
        Task<SelectList> ObtenerPeriodosAsync(object selectedValue = null);
        Task<SelectList> ObtenerProgramasAsync(object selectedValue = null);
        Task<SelectList> ObtenerSedesAsync(object selectedValue = null);
        Task<SelectList> ObtenerTiposAspiranteAsync(object selectedValue = null);
        Task<SelectList> ObtenerPaisesAsync(object selectedValue = null);
        Task<SelectList> ObtenerEstadosCivilesAsync(object selectedValue = null);
        Task<SelectList> ObtenerGenerosAsync(object selectedValue = null);
        Task<SelectList> ObtenerGruposSanguineosAsync(object selectedValue = null);
        Task<SelectList> ObtenerTiposDocumentoAsync(object selectedValue = null);
        Task<SelectList> ObtenerDepartamentosAsync(object selectedValue = null);
        Task<SelectList> ObtenerMunicipiosAsync(object selectedValue = null);   
    }

    public class SelectListService : ISelectListService
    {
        private readonly UAMDBEntities _context;

        public SelectListService(UAMDBEntities context)
        {
            _context = context;
        }

        public async Task<SelectList> ObtenerDepartamentosAsync(object selectedValue = null)
        {
            var departamentos = await _context.Departamento.ToListAsync();
            return new SelectList(departamentos, "Id", "Nombre", selectedValue);
        }

        public async Task<SelectList> ObtenerEstadosCivilesAsync(object selectedValue = null)
        {
            var estadosCiviles = await _context.Estado_Civil.ToListAsync();
            return new SelectList(estadosCiviles, "Id", "Estado", selectedValue);
        }

        public async Task<SelectList> ObtenerGenerosAsync(object selectedValue = null)
        {
            var generos = await _context.Genero.ToListAsync();
            return new SelectList(generos, "Id", "Sexo", selectedValue);
        }

        public async Task<SelectList> ObtenerGruposSanguineosAsync(object selectedValue = null)
        {
            var gruposSanguineos = await _context.Grupo_Sanguineo.ToListAsync();
            return new SelectList(gruposSanguineos,"Id", "Grupo", selectedValue);
        }

        public async Task<SelectList> ObtenerModalidadesAsync(object selectedValue = null)
        {
            var modalidades = await _context.Modalidad.ToListAsync();
            return new SelectList(modalidades, "Id", "Tipo", selectedValue);
        }

        public async Task<SelectList> ObtenerMunicipiosAsync(object selectedValue = null)
        {
            var municipios = await _context.Municipio.ToListAsync();
            return new SelectList(municipios, "Id", "Nombre", selectedValue);
        }

        public async Task<SelectList> ObtenerPaisesAsync(object selectedValue = null)
        {
            var paises = await _context.Pais.ToListAsync();
            return new SelectList(paises, "Id", "Nombre", selectedValue);
        }

        public async Task<SelectList> ObtenerPeriodosAsync(object selectedValue = null)
        {
            var periodos = await _context.Periodo_Academico.ToListAsync();
            return new SelectList(periodos, "Id", "Periodo", selectedValue);
        }

        public async Task<SelectList> ObtenerProgramasAsync(object selectedValue = null)
        {
            var programas = await _context.Programa_Academico.ToListAsync();
            return new SelectList(programas, "Id", "Nombre", selectedValue);
        }

        public async Task<SelectList> ObtenerSedesAsync(object selectedValue = null)
        {
            var sedes = await _context.Sede.ToListAsync();
            return new SelectList(sedes, "Id", "Nombre", selectedValue);
        }

        public async Task<SelectList> ObtenerTiposAspiranteAsync(object selectedValue = null)
        {
            var tiposAspirante = await _context.Tipo_Aspirante.ToListAsync();
            return new SelectList(tiposAspirante, "Id", "Tipo", selectedValue);
        }

        public async Task<SelectList> ObtenerTiposDocumentoAsync(object selectedValue = null)
        {
            var tiposDocumento = await _context.Tipo_Documento.ToListAsync();
            return new SelectList(tiposDocumento, "Id", "Tipo", selectedValue);
        }
    }

}