using DevExpress.Web;
using System.ComponentModel.DataAnnotations;

namespace AspirantesApp.Models.ViewModels
{
    public class AspirantesDetalleViewModel
    {
        public long Id { get; set; }
        [Display(Name="Documentos")]
        public string DocumentosAdjuntos { get; set; }
        public string Estado { get; set; }
        public string Sede { get; set; }
        [Display(Name="Programa Académico")]
        public string ProgramaAcademico { get; set; }
        [Display(Name="Período Académico")]
        public string PeriodoAcademico { get; set; }
        [Display(Name ="Tipo de Documento")]
        public string TipoDocumento { get; set; }
        [Display(Name = "Número de Documento")]
        public string NumeroDocumento { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        [Display(Name = "Número de Teléfono")]
        public string NumeroTelefono { get; set; }
        [Display(Name = "Número de Celular")]
        public string NumeroCelular { get; set; }
        public string Correo { get; set; }

        public AspirantesDetalleViewModel() 
        { 
            DocumentosAdjuntos = "~/Images/documentos.png";
        }

    }
}