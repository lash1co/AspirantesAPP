using AspirantesApp.Enums;
using AspirantesApp.Filters;
using AspirantesApp.Models;
using System.Web.Mvc;

namespace AspirantesApp.Controllers
{
    [AutorizarUsuario]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var usuario = Session["usuario"] as Usuario;
            if (usuario.Id_Rol == (int)Rol.Administrador)
            {
                return RedirectToAction("Index", "Admin");
            }
            else
            {
                return RedirectToAction("Index", "Inscripcion");
            }
        }
        
    }
}