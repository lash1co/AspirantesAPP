using System.ComponentModel.DataAnnotations;

namespace AspirantesApp.Models.ViewModels
{
    public class InscripcionViewModel
    {
        [Required(ErrorMessage ="Debes seleccionar un tipo de aspirante")]
        public int Id_Tipo_Aspirante { get; set; }
        [Required(ErrorMessage = "Debes seleccionar una modalidad")]
        public int Id_Modalidad { get; set; }
        [Required(ErrorMessage = "Debes seleccionar una sede")]
        public int Id_Sede { get; set; }
        [Required(ErrorMessage = "Debes seleccionar un programa académico")]
        public int Id_Programa { get; set; }
        [Required(ErrorMessage = "Debes seleccionar un periodo académico")]
        public int Id_Periodo { get; set; }
    }
}