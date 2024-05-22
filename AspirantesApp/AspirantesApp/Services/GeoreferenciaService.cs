using AspirantesApp.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace AspirantesApp.Services
{
    public interface IGeoreferencia
    {
        Task<IEnumerable<Departamento>> ObtenerDepartamentosPorPais(int idPais);
        Task<IEnumerable<Municipio>> ObtenerMunicipiosPorDepartamento(int idDepartamento);
    }

    public class GeoreferenciaService : IGeoreferencia
    {
        private readonly UAMDBEntities _context;

        public GeoreferenciaService(UAMDBEntities context)
        {
            _context = context;
        }

        public async Task<IEnumerable<Departamento>> ObtenerDepartamentosPorPais(int idPais)
        {
            return await _context.Departamento
            .Where(d => d.Id_Pais == idPais)
            .ToListAsync();
        }

        public async Task<IEnumerable<Municipio>> ObtenerMunicipiosPorDepartamento(int idDepartamento)
        {
            return await _context.Municipio
                .Where(m => m.Id_Departamento == idDepartamento)
                .ToListAsync();
        }
    }
}