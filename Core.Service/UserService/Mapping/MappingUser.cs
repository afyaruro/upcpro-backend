using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Service.UserService.Dtos;

namespace Core.Service.UserService.Mapping
{
    public static class MappingUser
    {

        public static UserEntity toUserEntity(UserDto userDto){
            
            UserEntity user = new UserEntity();
            user.Id = 0;
            user.estado = userDto.estado;
            user.emailUser = userDto.emailUser; 
            user.passwordUser = userDto.passwordUser;
            user.imagen = userDto.imagen;
            user.tipoUser = userDto.tipoUsuario;

            return user;
        }

        public static OutputUserDto toOutputUserDto(UserEntity userEntity){
            
            OutputUserDto user = new OutputUserDto();
            user.Id = userEntity.Id;
            user.estado = userEntity.estado;
            user.emailUser = userEntity.emailUser; 
            user.imagen = userEntity.imagen;
            user.tipoUsuario = userEntity.tipoUser;

            return user;
        }
        
    }
}