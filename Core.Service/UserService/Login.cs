using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Interfaces;
using Core.Domain.Response.User;
using Core.Service.utils;

namespace Core.Service.UserService
{
    public static class Login
    {

        public static async Task<UserResponse> loginWeb(string correo, string password, IUserRepository _repository)
        {

            var resp = await _repository.GetUser(correo);


            if (resp.IsError == false)
            {

                if (resp.user!.tipoUser == "creador" || resp.user!.tipoUser == "administrador")
                {
                    string passwordEncriptada = PasswordHelper.HashPasswordSHA256(password);
                    if (passwordEncriptada == resp.user!.passwordUser)
                    {
                        return new UserResponse(resp.user, "Usuario logeado")
                        {
                            StatusCode = 200
                        }; ;
                    }
                    else
                    {
                        return new UserResponse("Contraseña Incorrecta")
                        {
                            StatusCode = 401
                        };
                    }
                }

                return new UserResponse("No tienes permisos para acceder")
                {
                    StatusCode = 403
                };

            }
            return new UserResponse("Usuario no encontrado")
            {
                StatusCode = 404
            };
        }

         public static async Task<UserResponse> loginMovil(string correo, string password, IUserRepository _repository)
        {

            var resp = await _repository.GetUser(correo);


            if (resp.IsError == false)
            {

                if (resp.user!.tipoUser == "estudiante" || resp.user!.tipoUser == "egresado")
                {
                    string passwordEncriptada = PasswordHelper.HashPasswordSHA256(password);
                    if (passwordEncriptada == resp.user!.passwordUser)
                    {
                        return new UserResponse(resp.user, "Usuario logeado")
                        {
                            StatusCode = 200
                        }; ;
                    }
                    else
                    {
                        return new UserResponse("Contraseña Incorrecta")
                        {
                            StatusCode = 401
                        };
                    }
                }

                return new UserResponse("No tienes permisos para acceder")
                {
                    StatusCode = 403
                };

            }
            return new UserResponse("Usuario no encontrado")
            {
                StatusCode = 404
            };
        }

    }
}