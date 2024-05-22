using AspirantesApp.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace AspirantesApp.Validators
{
    public class FechaAnterior : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            return value != null && (DateTime)value <= DateTime.Now;
        }
    }

    public class FechaMinima : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value == null)
                return false;

            DateTime fechaNacimiento = (DateTime)value;
            return fechaNacimiento.AddYears(14) <= DateTime.Today;
        }
    }

    public class ExpedicionMayorQueNacimiento : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var viewModel = (AspiranteViewModel)validationContext.ObjectInstance;

            if (value != null && viewModel.Fecha_Nacimiento != null)
            {
                DateTime fechaNacimiento = viewModel.Fecha_Nacimiento;
                DateTime fechaExpedicion = (DateTime)value;

                if (fechaExpedicion <= fechaNacimiento)
                {
                    return new ValidationResult(ErrorMessage);
                }
            }

            return ValidationResult.Success;
        }
    }
}