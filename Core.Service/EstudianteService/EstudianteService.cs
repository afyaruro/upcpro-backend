using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Service.EstudianteService.Dtos;
using Core.Service.EstudianteService.Mapping;
using Core.Service.UserService.Dtos;
using Core.Service.UserService.Mapping;
using Core.Service.utils;

namespace Core.Service.EstudianteService
{
    public class EstudianteService
    {
        private readonly IEstudianteRepository _repository;
        private readonly IUserRepository _repositoryUser;

        public EstudianteService(IEstudianteRepository repository, IUserRepository userRepository)
        {
            _repository = repository;
            _repositoryUser = userRepository;

        }

        public async Task<EstudianteResponse> GetEstudiantexUserID(int userID)
        {
            return await _repository.GetCuentaxUserId(userID);
        }


        public async Task<EstudianteResponse> newEstudiante(EstudianteDto estudianteDto)
        {
            try
            {

                ValidateResponse validateData = Validate.ValidateData(estudianteDto);


                if (validateData.IsError)
                {
                    return new EstudianteResponse(validateData.message)
                    {
                        StatusCode = validateData.StatusCode
                    };
                }


                UserDto userDto = MappingEstudiante.toUserDto(estudianteDto);

                ValidateResponse validateUser = Validate.ValidateUser(userDto);



                if (validateUser.IsError)
                {

                    return new EstudianteResponse(validateUser.message)
                    {
                        StatusCode = validateUser.StatusCode
                    };
                }

                if (estudianteDto.tipoUser != "estudiante" && estudianteDto.tipoUser != "egresado")
                {
                    return new EstudianteResponse("El tipo de usuario no es valido")
                    {
                        StatusCode = 409
                    };
                }

                UserEntity user = MappingUser.toUserEntity(userDto);
                user.tipoUser = estudianteDto.tipoUser;
                user.passwordUser = PasswordHelper.HashPasswordSHA256(user.passwordUser);



                    EstudianteEntity estudiante = MappingEstudiante.toEstudianteEntity(estudianteDto);
                    estudiante.user = user;

                    EstudianteResponse estudianteResponse = await _repository.NewCuenta(estudiante);

                    if (estudianteResponse.IsError == false)
                    {

                        return new EstudianteResponse(estudiante, estudianteResponse.message)
                        {
                            StatusCode = 200
                        };

                    }

                return new EstudianteResponse(estudianteResponse.message)
                {
                    StatusCode = 500
                };

            }
            catch (Exception e)
            {
                return new EstudianteResponse($"Error: {e.Message}")
                {
                    StatusCode = 500
                }; ;
            }

        }


    }
}