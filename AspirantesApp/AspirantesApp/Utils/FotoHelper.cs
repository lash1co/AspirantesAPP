using System;
using System.IO;
using System.Linq;
using System.Web;

namespace AspirantesApp.Utils
{
    public static class FotoHelper
    {
        private static readonly string[] TiposImagenValidos =
        {
        "image/gif",
        "image/jpeg",
        "image/pjpeg",
        "image/png"
        };

        public static bool GuardarFoto(string nombre, string ruta, HttpPostedFileBase foto, out string error)
        {
            error = string.Empty;
            if (!TiposImagenValidos.Contains(foto.ContentType))
            {
                error = "Por favor escoge entre una imágen GIF, JPG o PNG.";
                return false;
            }
            if (!Directory.Exists(ruta))
            {
                Directory.CreateDirectory(ruta);
            }

            try
            {
                foto.SaveAs(nombre);
                return true;
            }
            catch (Exception ex)
            {
                error = "Ocurrió un error al guardar la imagen: " + ex.Message;
                return false;
            }
        }
    }
}