using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Repository.UserRepository;
using Infrastructure.context;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace Core.Repository.Repository
{
    public class UserRepository : IUserRepository
    {
        private readonly MysqlContext _context;

        public UserRepository(MysqlContext context)
        {
            _context = context;
        }

        public async Task<UserResponse> GetUser(string correo)
        {
            return await GetUserRepository.GetUser(correo, _context);
        }

        public async Task<UserResponse> GetUserxID(int id)
        {
            return await GetUserRepository.GetUserxID(id, _context);
        }

        public async Task<UserResponse> NewUser(UserEntity userEntity)
        {
            return await NewUserRepository.NewUser(userEntity, _context);
        }


    }
}
