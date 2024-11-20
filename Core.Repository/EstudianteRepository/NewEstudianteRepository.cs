using Core.Domain.Entities;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Repository.UserRepository;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.EstudianteRepository
{
    public static class NewEstudianteRepository
    {
         public static async Task<EstudianteResponse> NewCuenta(EstudianteEntity estudiante, MysqlContext _context)
        {
            try
            {
                UserResponse userResponse = await GetUserRepository.GetUser(estudiante.user.emailUser, _context);

                if (userResponse.IsError == true && userResponse.message == "no existe")
                {

                    UserResponse createUser = await NewUserRepository.NewUser(estudiante.user, _context);

                    if (createUser.IsError == false)
                    {

                        UserResponse userResponse2 = await GetUserRepository.GetUser(estudiante.user.emailUser, _context);

                        estudiante.user.Id = userResponse2.user!.Id;

                        var query = "INSERT INTO estudiantes (userId, nombres, apellidos, tipoIdentificacion, numeroIdentificacion, genero, fechaNacimiento, facultad, programa, nivelActual, puntaje) VALUES (@userId, @nombres, @apellidos, @tipoIdentificacion, @numeroIdentificacion, @genero, @fechaNacimiento, @facultad, @programa, @nivelActual, @puntaje)";

                        _context.OpenConnection();


                        using (var command = new MySqlCommand(query, _context.Connection))
                        {
                            command.Parameters.AddWithValue("@userId", estudiante.user.Id);
                            command.Parameters.AddWithValue("@nombres", estudiante.nombres);
                            command.Parameters.AddWithValue("@apellidos", estudiante.apellidos);
                            command.Parameters.AddWithValue("@tipoIdentificacion", estudiante.tipoIdentificacion);
                            command.Parameters.AddWithValue("@numeroIdentificacion", estudiante.numeroIdentificacion);
                            command.Parameters.AddWithValue("@genero", estudiante.sexo);
                            command.Parameters.AddWithValue("@fechaNacimiento", estudiante.fechaNacimiento);
                            command.Parameters.AddWithValue("@programa", estudiante.programa);

                            await command.ExecuteNonQueryAsync();
                        }

                        return new EstudianteResponse(estudiante, "Usuario creado exitosamente");
                    }
                    return new EstudianteResponse(createUser.message);
                }

                return new EstudianteResponse("El usuario ya existe");
            }
            catch (Exception e)
            {
                return new EstudianteResponse("Error: " + e.Message);
            }
            finally
            {
                _context.CloseConnection();
            }

        }
    }
}