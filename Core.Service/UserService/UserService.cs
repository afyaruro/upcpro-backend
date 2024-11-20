using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response.User;
using Core.Service.UserService.Dtos;
using Core.Service.UserService.Mapping;
using Core.Service.utils;

namespace Core.Service.UserService
{
    public class UserService
    {
        private readonly IUserRepository _repository;

        public UserService(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task<UserResponse> newAdministrador(UserDto userDto)
        {
            return await CreateUserService.newUsuario(userDto, _repository);
        }

        public async Task<UserResponse> loginWeb(string correo, string password)
        {
            return await Login.loginWeb(correo, password, _repository);
        }

        public async Task<UserResponse> loginMovil(string correo, string password)
        {
            return await Login.loginMovil(correo, password, _repository);
        }

        public async Task<UserResponse> GetUser(string correo)
        {
            return await _repository.GetUser(correo);
        }

        public async Task<UserResponse> GetUserxID(int id)
        {
            return await _repository.GetUserxID(id);
        }








    }
}