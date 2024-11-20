using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;
using Core.Domain.Response.User;

namespace Core.Domain.Interfaces
{
    public interface IUserRepository
    {

        public Task<UserResponse> GetUser(string correo);

        public Task<UserResponse> GetUserxID(int id);
       
        //get todos por paginacion 10 por pagina
        // public Task<UserResponse> GetAllUsers(int pagina);

        public Task<UserResponse> NewUser(UserEntity userEntity);

        // public Task<UserResponse> UpdateUser(UserEntity userEntity);

        // public Task<UserResponse> DesactivateUser(string correo);

        //faltan los filtros

    }
}