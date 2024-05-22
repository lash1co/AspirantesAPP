using DevExpress.Web;
using System.ComponentModel.DataAnnotations;

namespace AspirantesApp.Models.ViewModels
{
    public class DatosBasicosViewModel
    {
            public bool Completo { get; set; }
            public string Foto { get; set; }
            public string Nombres { get; set; }
            public string Apellidos { get; set; }
            [Display(Name ="Fecha de Nacimiento")]
            public string Fecha_Nacimiento { get; set; }
            [Display(Name ="Ciudad de Nacimiento")]
            public string Ciudad_Nacimiento { get; set; }
            [Display(Name ="Fecha de Expedición")]
            public string Fecha_Expedicion { get; set; }
            [Display(Name ="Ciudad de Expedición")]
            public string Ciudad_Expedicion { get; set; }
            [Display(Name ="Tipo de Documento")]
            public string Tipo_Documento { get; set; }
            [Display(Name="Tipo de Documento")]
            public string Numero_Documento { get; set; }
            [Display(Name ="Grupo Sanguíneo")]
            public string Grupo_Sanguineo { get; set; }
            [Display(Name = "Estado Civil")]
            public string Estado_Civil { get; set; }
            public string Sexo { get; set; }
            [Display(Name ="Número de Teléfono")]
            public string Numero_Telefono { get; set; }
            [Display(Name = "Número de Celular")]
            public string Numero_Celular { get; set; }
    }
}