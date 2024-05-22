using DevExpress.Web.Mvc;
using AspirantesApp.Enums;
using AspirantesApp.Filters;
using AspirantesApp.Services;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace AspirantesApp.Controllers
{
    [AutorizarUsuario(role:(int)Rol.Administrador)]
    public class AdminController : Controller
    {
        private readonly IAspirante _aspiranteService;

        public AdminController(IAspirante aspiranteService)
        {
            _aspiranteService = aspiranteService;
        }

        // GET: Admin
        public async Task<ActionResult> Index()
        {
            var aspirantes = await _aspiranteService.ObtenerAspirantes();
            return View(aspirantes);
        }

        [ValidateInput(false)]
        public async Task<ActionResult> GridViewPartial()
        {
            var aspirantes = await _aspiranteService.ObtenerAspirantes();
            return PartialView("~/Views/Admin/_GridViewPartial.cshtml", aspirantes);
        }

    }
}