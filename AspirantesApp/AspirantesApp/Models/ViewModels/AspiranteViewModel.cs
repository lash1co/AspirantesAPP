using AspirantesApp.Validators;
using System;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;

namespace AspirantesApp.Models.ViewModels
{
    public class AspiranteViewModel
    {
        [Required(ErrorMessage = "Coloca tu nombre.")]
        [RegularExpression(@"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]*$", ErrorMessage = "El nombre solo debe contener letras y espacios.")]
        public string PrimerNombre { get; set; }

        [RegularExpression(@"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]*$", ErrorMessage = "El apellido solo debe contener letras y espacios.")]
        public string SegundoNombre { get; set; }

        [Required(ErrorMessage = "Coloca tu primer apellido.")]
        [RegularExpression(@"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]*$", ErrorMessage = "El apellido solo debe contener letras y espacios.")]
        public string PrimerApellido { get; set; }

        [Required(ErrorMessage = "Coloca tu segundo apellido.")]
        [RegularExpression(@"^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]*$", ErrorMessage = "El apellido solo debe contener letras y espacios.")]
        public string SegundoApellido { get; set; }

        [Display(Name = "Fecha de nacimiento")]
        [Required(ErrorMessage ="Debes seleccionar una fecha.")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [FechaAnterior(ErrorMessage ="La fecha de nacimiento no puede ser en el futuro.")]
        [FechaMinima(ErrorMessage ="Debes ser mayor a 13 años para registrarte.")]
        public DateTime Fecha_Nacimiento { get; set; }

        [Required(ErrorMessage = "Selecciona la ciudad de nacimiento.")]
        public int Id_Ciudad_Nacimiento { get; set; }

        [Required(ErrorMessage = "Selecciona la ciudad de expedición.")]
        public int Id_Ciudad_Expedicion { get; set; }
        [Required(ErrorMessage = "Selecciona el pais de nacimiento.")]
        public int Id_Pais_Nacimiento { get; set; }
        [Required(ErrorMessage = "Selecciona el departamento de nacimiento.")]
        public int Id_Departamento_Nacimiento { get; set; }
        [Required(ErrorMessage = "Selecciona el pais de expedición.")]
        public int Id_Pais_Expedicion { get; set; }
        [Required(ErrorMessage = "Selecciona el departamento de expedición.")]
        public int Id_Departamento_Expedicion { get; set; }
        public SelectList Paises { get; set; }
        public SelectList Departamentos { get; set; }
        public SelectList Municipios { get; set; }

        [Required(ErrorMessage = "Selecciona un grupo sanguíneo.")]
        public int Id_Grupo_Sanguineo { get; set; }

        [Required(ErrorMessage ="Selecciona un tipo de documento.")]
        public int Id_Tipo_Documento { get; set; }

        [Required(ErrorMessage ="Coloca tu número de documento.")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "El número de documento solo debe contener números.")]
        public string Numero_Documento { get; set; }

        [Display(Name = "Fecha de expedición")]
        [Required(ErrorMessage = "Debes seleccionar una fecha.")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        [FechaAnterior(ErrorMessage = "La fecha de expedición no puede ser en el futuro.")]
        [ExpedicionMayorQueNacimiento(ErrorMessage = "La fecha de expedición debe ser mayor que la de nacimiento.")]
        public DateTime Fecha_Expedicion { get; set; }

        [Required(ErrorMessage ="Debes seleccionar un sexo.")]
        public int? Id_Genero { get; set; }

        [Required(ErrorMessage ="Debes seleccionar un estado civil.")]
        public int? Id_Estado_Civil { get; set; }

        [RegularExpression("^[0-9]*$", ErrorMessage = "El número telefónico solo debe contener números.")]
        public string Numero_Telefono { get; set; }

        [Required(ErrorMessage ="Coloca tu número de celular")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "El número de celular solo debe contener números.")]
        [MinLength(10,ErrorMessage ="Debes poner un número de celular de almenos 10 digitos.")]
        [MaxLength(12,ErrorMessage ="Debes poner un número de celular de máximo 12 digitos.")]
        public string Numero_Celular { get; set; }

        [Required(ErrorMessage = "Selecciona una foto.")]
        [FotoValidator(ErrorMessage ="Debes seleccionar una foto")]
        public HttpPostedFileBase Foto { get; set; }

    }
}