using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response.User;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.UserRepository
{
    public static class GetUserRepository
    {
        public static async Task<UserResponse> GetUser(string correo, MysqlContext _context)
        {
            try
            {
                UserEntity user;
                _context.OpenConnection();

                var query = "SELECT * FROM users WHERE correo = @correo";

                using (var command = new MySqlCommand(query, _context.Connection))
                {
                    command.Parameters.AddWithValue("@correo", correo);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            user = new UserEntity
                            {
                                tipoUser = reader.GetString("tipoUsuario"),
                                Id = reader.GetInt32("ID"),
                                emailUser = reader.GetString("correo"),
                                passwordUser = reader.GetString("password"),
                                imagen = reader.GetString("imagen"),
                                estado = reader.GetBoolean("estado")
                            };

                            return new UserResponse(user, "existe");
                        }
                    }
                }

                return new UserResponse("no existe");
            }
            catch (Exception ex)
            {
                return new UserResponse("Error: " + ex.Message);
            }
            finally
            {
                _context.CloseConnection();
            }


        }


        public static async Task<UserResponse> GetUserxID(int id, MysqlContext _context)
        {
            try
            {
                UserEntity user;
                _context.OpenConnection();

                var query = "SELECT * FROM users WHERE ID = @id";

                using (var command = new MySqlCommand(query, _context.Connection))
                {
                    command.Parameters.AddWithValue("@id", id);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            user = new UserEntity
                            {
                                tipoUser = reader.GetString("tipoUsuario"),
                                Id = reader.GetInt32("ID"),
                                emailUser = reader.GetString("correo"),
                                passwordUser = reader.GetString("password"),
                                estado = reader.GetBoolean("estado"),
                                imagen = reader.GetString("imagen"),
                            };

                            return new UserResponse(user, "existe");
                        }
                    }
                }

                return new UserResponse("no existe");
            }
            catch (Exception ex)
            {
                return new UserResponse("Error: " + ex.Message);
            }
            finally
            {
                _context.CloseConnection();
            }


        }

    }



}