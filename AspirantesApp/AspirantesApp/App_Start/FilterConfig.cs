using AspirantesApp.Filters;
using System.Web;
using System.Web.Mvc;

namespace AspirantesApp
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
