using AspirantesApp.Models;
using AspirantesApp.Services;
using Autofac;
using Autofac.Integration.Mvc;
using System.Reflection;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace AspirantesApp
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Configurar Autofac
            var builder = new ContainerBuilder();

            // Registrar los controladores en el ensamblado actual
            builder.RegisterControllers(Assembly.GetExecutingAssembly());

            // Registrar tus servicios aquí
            builder.RegisterType<UAMDBEntities>().InstancePerRequest();
            builder.RegisterType<SelectListService>().As<ISelectListService>().InstancePerRequest();
            builder.RegisterType<UsuarioService>().As<IUsuario>().InstancePerRequest();
            builder.RegisterType<AspiranteService>().As<IAspirante>().InstancePerRequest();
            builder.RegisterType<GeoreferenciaService>().As<IGeoreferencia>().InstancePerRequest();
            builder.RegisterType<InscripcionService>().As<IInscripcion>().InstancePerRequest();

            // Construir el contenedor
            var container = builder.Build();

            // Establecer el contenedor como Dependency Resolver
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));

            System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("es");
            System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("es");
        }
    }
}
