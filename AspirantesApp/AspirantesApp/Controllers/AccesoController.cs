using AspirantesApp.Models.ViewModels;
using AspirantesApp.Services;
using System;
using System.Threading.Tasks;
using System.Web.Mvc;
using System.Web.Security;

namespace AspirantesApp.Controllers
{
    public class AccesoController : Controller
    {
        private readonly IUsuario _usuarioService;

        public AccesoController(IUsuario usuarioService)
        {
            _usuarioService = usuarioService;
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel login)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var usuario = await _usuarioService.ObtenerUsuario(login);
                    if (usuario != null)
                    {
                        Session["usuario"] = usuario;
                        Session["nombreUsuario"] = usuario.Email.Split('@')[0];
                        FormsAuthentication.SetAuthCookie(usuario.Email, false);
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Credenciales inválidas");
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex.Message);
                }
            }
            else
            {
                ModelState.AddModelError("", "campos incompletos");
            }
            
            return View();
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login", "Acceso");
        }

        public ActionResult Registrar()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Registrar(RegistroViewModel registro)
        {
            if (!ModelState.IsValid)
            {
                return View(registro);
            }
            var usuario = await _usuarioService.ObtenerUsuarioPorEmail(registro.Correo);
            if(usuario != null) 
            {
                ModelState.AddModelError(string.Empty, "El usuario ya existe");
                return View(registro);
            }
            try
            {
                await _usuarioService.AgregarUsuario(registro);
                TempData["SuccessMessage"] = "Registro exitoso. Ya puedes iniciar sesión.";
                return RedirectToAction("Login", "Acceso");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError(string.Empty, ex.Message);
                return View(registro);
            }
            
        }
    }
}