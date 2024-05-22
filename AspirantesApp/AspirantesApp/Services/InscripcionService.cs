using AspirantesApp.Enums;
using AspirantesApp.Models;
using AspirantesApp.Models.ViewModels;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace AspirantesApp.Services
{
    public interface IInscripcion
    {
        Task AgregarInscripcionPorUsuario(long idUsuario, InscripcionViewModel viewModel);
        Task<IEnumerable<Inscripcion>> ObtenerInscripcionesPorUsuario(long idUsuario);
        Task<Inscripcion> ObtenerPrimeraInscripcionPorUsuario(long idUsuario);
        Task<Inscripcion> ObtenerInscripcion(long  idInscripcion);
        Task<bool> ActualizarInscripcionDeUsuario(long idInscripcion, long idUsuario, InscripcionViewModel viewModel);
        Task<bool> CompletarInscripcion(long idInscripcion);
    }
    public class InscripcionService : IInscripcion
    {
        private readonly UAMDBEntities _context;

        public InscripcionService(UAMDBEntities context)
        {
            _context = context;
        }

        public async Task<bool> ActualizarInscripcionDeUsuario(long idInscripcion, long idUsuario, InscripcionViewModel viewModel)
        {
            var inscripcion = await ObtenerInscripcion(idInscripcion);
            if (inscripcion != null && idUsuario == inscripcion.Id_Usuario && !inscripcion.Completo)
            {
                inscripcion.Id_Periodo = inscripcion.Id_Periodo;
                inscripcion.Id_Modalidad = inscripcion.Id_Modalidad;
                inscripcion.Id_Tipo_Aspirante = inscripcion.Id_Tipo_Aspirante;
                inscripcion.Id_Programa = inscripcion.Id_Programa;
                inscripcion.Id_Sede = inscripcion.Id_Sede;
                _context.Entry(inscripcion).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }


        public async Task AgregarInscripcionPorUsuario(long idUsuario, InscripcionViewModel viewModel)
        {
            Inscripcion nuevaInscripcion = new Inscripcion
            {
                Completo = false,
                Id_Usuario = idUsuario,
                Id_Estado_Inscripcion = (int)EstadoInscripcion.Inscrito, 
                Id_Modalidad = viewModel.Id_Modalidad,
                Id_Tipo_Aspirante = viewModel.Id_Tipo_Aspirante,
                Id_Programa = viewModel.Id_Programa,
                Id_Sede = viewModel.Id_Sede,
                Id_Periodo = viewModel.Id_Periodo,
            };
            _context.Inscripcion.Add(nuevaInscripcion);
            await _context.SaveChangesAsync();
        }

        public async Task<bool> CompletarInscripcion(long idInscripcion)
        {
            var inscripcion = await ObtenerInscripcion(idInscripcion);
            if(inscripcion != null)
            {
                inscripcion.Completo = true;
                _context.Entry(inscripcion).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<Inscripcion> ObtenerInscripcion(long idInscripcion)
        {
            return await InscripcionesQuery()
                .FirstOrDefaultAsync(ins=>ins.Id == idInscripcion);
        }

        public async Task<IEnumerable<Inscripcion>> ObtenerInscripcionesPorUsuario(long idUsuario)
        {
            return await InscripcionesQuery()
                .Where(i => i.Id_Usuario == idUsuario)
                .ToListAsync();
        }

        public async Task<Inscripcion> ObtenerPrimeraInscripcionPorUsuario(long idUsuario)
        {
            return await InscripcionesQuery()
                .Where(i => i.Id_Usuario == idUsuario)
                .FirstOrDefaultAsync();
        }

        private IQueryable<Inscripcion> InscripcionesQuery()
        {
            return _context.Inscripcion
                .Include(i => i.Tipo_Aspirante)
                .Include(i => i.Estado_Inscripcion)
                .Include(i => i.Modalidad)
                .Include(i => i.Sede)
                .Include(i => i.Programa_Academico)
                .Include(i => i.Periodo_Academico);
        }
    }
}