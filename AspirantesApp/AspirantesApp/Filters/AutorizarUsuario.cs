using AspirantesApp.Models;
using System.Web;
using System.Web.Mvc;

namespace AspirantesApp.Filters
{
    public class AutorizarUsuario : AuthorizeAttribute
    {
        private int _role;

        public AutorizarUsuario(int role = 0)
        {
            _role = role;
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var usuario = httpContext.Session["usuario"] as Usuario;
            if (usuario == null)
            {
                // El usuario no está autenticado
                return false;
            }

            if (_role != 0 && usuario.Id_Rol != _role)
            {
                // El usuario no tiene el rol requerido
                return false;
            }

            return true;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            var usuario = HttpContext.Current.Session["usuario"] as Usuario;
            if (usuario == null)
            {
                // Redirige al controlador y acción de login si el usuario no está autenticado
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "Acceso", action = "Login" }));
            }
            else
            {
                // Redirige a la página de inicio si el usuario no tiene el rol requerido
                filterContext.Result = new RedirectResult("~/Home/Index");
            }
        }
    }
}