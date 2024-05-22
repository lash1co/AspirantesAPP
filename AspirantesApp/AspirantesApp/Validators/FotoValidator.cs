using System.ComponentModel.DataAnnotations;
using System.Web;

namespace AspirantesApp.Validators
{
    public class FotoValidator: ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            // Verificar si el valor es nulo o no es de tipo HttpPostedFileBase
            if (value == null || !(value is HttpPostedFileBase))
            {
                return false;
            }

            // Verificar si se ha adjuntado un archivo
            var file = (HttpPostedFileBase)value;
            return file.ContentLength > 0; // Si el tamaño del archivo es mayor que cero, se considera válido
        }
    }

}
