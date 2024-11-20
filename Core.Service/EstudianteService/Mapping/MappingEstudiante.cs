using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Service.EstudianteService.Dtos;
using Core.Service.UserService.Dtos;

namespace Core.Service.EstudianteService.Mapping
{
    public class MappingEstudiante
    {
        public static UserDto toUserDto(EstudianteDto estudianteDto)
        {

            UserDto userDto = new UserDto();
            userDto.estado = true;
            userDto.emailUser = estudianteDto.emailUser;
            userDto.passwordUser = estudianteDto.passwordUser;
            userDto.imagen = estudianteDto.imagen;

            return userDto;
        }

        public static EstudianteEntity toEstudianteEntity(EstudianteDto estudianteDto)
        {
            EstudianteEntity estudiante = new EstudianteEntity();
            estudiante.nombres = estudianteDto.nombres;
            estudiante.apellidos = estudianteDto.apellidos;
            estudiante.tipoIdentificacion = estudianteDto.tipoIdentificacion;
            estudiante.numeroIdentificacion = estudianteDto.numeroIdentificacion;
            estudiante.sexo = estudianteDto.sexo;
            estudiante.fechaNacimiento = estudianteDto.fechaNacimiento;
            estudiante.programa = estudianteDto.programa;

            return estudiante;
        }


        public static OutputEstudiante toOutputEstudiante(EstudianteEntity estudianteEntity)
        {
            OutputEstudiante estudiante = new OutputEstudiante();
            estudiante.nombres = estudianteEntity.nombres;
            estudiante.apellidos = estudianteEntity.apellidos;
            estudiante.tipoIdentificacion = estudianteEntity.tipoIdentificacion;
            estudiante.numeroIdentificacion = estudianteEntity.numeroIdentificacion;
            estudiante.sexo = estudianteEntity.sexo;
            estudiante.fechaNacimiento = estudianteEntity.fechaNacimiento;
            // estudiante.programa = estudianteEntity.programa;
            estudiante.userId = estudianteEntity.user.Id;
            estudiante.emailUser = estudianteEntity.user.emailUser;
            estudiante.estado = estudianteEntity.user.estado;
            estudiante.imagen = estudianteEntity.user.imagen;
            return estudiante;
        }


    }
}