using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Service.UserService.Dtos;
using Core.Service.UserService.Mapping;
using Core.Service.utils;

namespace Core.Service.UserService
{
    public static class CreateUserService
    {

        public static async Task<UserResponse> newUser(UserEntity user, IUserRepository _repository)
        {
            return await _repository.NewUser(user);
        }


        public static async Task<UserResponse> newUsuario(UserDto userDto, IUserRepository _repository)
        {
            try
            {

               ValidateResponse validate = Validate.ValidateUser(userDto);

               if (validate.IsError){
                return new UserResponse(validate.message){
                    StatusCode = validate.StatusCode
                };
               }


                var resp = await _repository.GetUser(userDto.emailUser);


                if (resp.message == "existe")
                {
                    UserResponse userResponse1 = new UserResponse("El usuario ya existe");
                    userResponse1.StatusCode = 409;
                    return userResponse1;
                }

                if (resp.message == "no existe")
                {
                    UserEntity user = MappingUser.toUserEntity(userDto);
                    // user.tipoUser = "administrador";
                    user.passwordUser = PasswordHelper.HashPasswordSHA256(user.passwordUser);

                    return await newUser(user, _repository);

                }

                UserResponse userResponse2 = new UserResponse(resp.message)
                {
                    StatusCode = 500
                };
                return userResponse2;

            }
            catch (Exception e)
            {
                return new UserResponse($"Error: {e.Message}")
                {
                    StatusCode = 500
                }; ;
            }

        }


    }
}

