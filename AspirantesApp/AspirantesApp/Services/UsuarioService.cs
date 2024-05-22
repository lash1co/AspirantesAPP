using AspirantesApp.Enums;
using AspirantesApp.Models;
using AspirantesApp.Models.ViewModels;
using System;
using System.Data.Entity;
using System.Threading.Tasks;

namespace AspirantesApp.Services
{
    public interface IUsuario
    {
        Task AgregarUsuario(RegistroViewModel registro);
        Task<Usuario> ObtenerUsuario(LoginViewModel login);
        Task<Usuario> ObtenerUsuarioPorEmail(string email);
    }

    public class UsuarioService : IUsuario
    {
        private readonly UAMDBEntities _context;

        public UsuarioService(UAMDBEntities context)
        {
            _context = context;
        }

        public async Task<Usuario> ObtenerUsuario(LoginViewModel login)
        {
            return await _context.Usuario
                .Include(u => u.Tipo_Usuario)
                .FirstOrDefaultAsync(u => u.Email == login.Correo && u.Password == login.Password);  
        }

        public async Task AgregarUsuario(RegistroViewModel registro)
        {
            var usuario = await _context.Usuario.FirstOrDefaultAsync(u=>u.Email == registro.Correo);
            if(usuario != null)
            {
                throw new Exception("El correo ya se encuentra registrado");
            }
            if(registro.Password != registro.ConfirmarPassword)
            {
                throw new Exception("Las contraseñas no coinciden");
            }
            var nuevoUsuario = new Usuario
            {
                Email = registro.Correo,
                Password = registro.Password,
                Id_Rol = (int)Rol.Aspirante
            };
            _context.Usuario.Add(nuevoUsuario);
            await _context.SaveChangesAsync();
        }

        public async Task<Usuario> ObtenerUsuarioPorEmail(string email)
        {
            return await _context.Usuario.FirstOrDefaultAsync(u=>u.Email == email);
        }
    }
}