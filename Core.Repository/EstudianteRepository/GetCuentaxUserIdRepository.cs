using System.Data;
using Core.Domain.Entities;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Repository.UserRepository;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.EstudianteRepository
{
    public static class GetCuentaxUserIdRepository
    {
        public static async Task<EstudianteResponse> GetCuentaxUserId(int userId, MysqlContext _context)
        {
            try
            {
                EstudianteEntity estudiante;
                _context.OpenConnection();

                var queryEstudiante = "SELECT * FROM estudiantes WHERE userId = @userId";

                using (var command = new MySqlCommand(queryEstudiante, _context.Connection))
                {
                    command.Parameters.AddWithValue("@userId", userId);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            estudiante = new EstudianteEntity
                            {
                                Id = reader.GetInt32("ID"),
                                apellidos = reader.GetString("apellidos"),
                                nombres = reader.GetString("nombres"),
                                tipoIdentificacion = reader.GetString("tipoIdentificacion"),
                                numeroIdentificacion = reader.GetString("numeroIdentificacion"),
                                sexo = reader.GetString("genero"),
                                fechaNacimiento = reader.GetDateTime("fechaNacimiento"),
                                programa = reader.GetInt32("programa"),

                            };

                            UserResponse userResponse = await GetUserRepository.GetUserxID(userId, _context);

                            if (userResponse != null)
                            {
                                estudiante.user = userResponse.user!;
                                return new EstudianteResponse(estudiante, "existe");
                            }

                        }
                    }
                }

                return new EstudianteResponse("no existe");
            }
            catch (Exception ex)
            {
                return new EstudianteResponse("Error: " + ex.Message);
            }
            finally
            {
                _context.CloseConnection();
            }


        }
    }
}