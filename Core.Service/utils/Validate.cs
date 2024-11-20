using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Service.EstudianteService.Dtos;
using Core.Service.UserService.Dtos;

namespace Core.Service.utils
{
    public static class Validate
    {
        public static ValidateResponse ValidateUser(UserDto userDto)
        {

            if (string.IsNullOrEmpty(userDto.emailUser))
            {
                return new ValidateResponse("El correo es requerido", 400);

            }


            if (!userDto.emailUser.EndsWith("@unicesar.edu.co"))
            {
                return new ValidateResponse("El correo debe ser de dominio @unicesar.edu.co", 400);

            }
            
            if (string.IsNullOrEmpty(userDto.passwordUser))
            {
                return new ValidateResponse("La contraseña es requerida", 400);

            }

            // Validar longitud mínima
            if (userDto.passwordUser.Length < 8)
            {

                return new ValidateResponse("La contraseña debe tener al menos 8 caracteres", 400);

            }

            // Validar que contenga al menos una letra mayúscula
            if (!userDto.passwordUser.Any(char.IsUpper))
            {

                return new ValidateResponse("La contraseña debe contener al menos una letra mayúscula", 400);

            }

            // Validar que contenga al menos una letra minúscula
            if (!userDto.passwordUser.Any(char.IsLower))
            {

                return new ValidateResponse("La contraseña debe contener al menos una letra minúscula", 400);

            }

            // Validar que contenga al menos un dígito
            if (!userDto.passwordUser.Any(char.IsDigit))
            {

                return new ValidateResponse("La contraseña debe contener al menos un número", 400);
            }



            if (string.IsNullOrEmpty(userDto.imagen))
            {
                return new ValidateResponse("La imagen es requerida", 400);

            }

            return new ValidateResponse();
        }

        public static ValidateResponse ValidateData(EstudianteDto estudianteDto)
        {

            if (string.IsNullOrEmpty(estudianteDto.nombres))
            {

                return new ValidateResponse("Los nombres son requeridos", 400);

            }

            if (string.IsNullOrEmpty(estudianteDto.apellidos))
            {

                return new ValidateResponse("Los apellidos son requeridos", 400);

            }

            if (string.IsNullOrEmpty(estudianteDto.tipoIdentificacion))
            {

                return new ValidateResponse("El tipo de identificacion es requerido", 400);

            }

            if (string.IsNullOrEmpty(estudianteDto.numeroIdentificacion))
            {

                return new ValidateResponse("El numero de identificacion es requerido", 400);

            }

            if (string.IsNullOrEmpty(estudianteDto.sexo))
            {

                return new ValidateResponse("El genero es requerido", 400);

            }

            if (estudianteDto.fechaNacimiento == DateTime.MinValue)
            {

                return new ValidateResponse("La fecha de nacimiento es requerida", 400);

            }

            return new ValidateResponse();
        }


    }


}
