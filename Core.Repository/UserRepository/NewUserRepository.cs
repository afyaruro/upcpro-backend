using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response.User;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.UserRepository
{
    public static class NewUserRepository
    {
        public static async Task<UserResponse> NewUser(UserEntity user, MysqlContext context)
        {

            var query = "INSERT INTO users (tipoUsuario, correo, password, estado, imagen) VALUES (@tipoUsuario, @correo, @password, @estado, @imagen)";

            try
            {
                context.OpenConnection();

                using (var command = new MySqlCommand(query, context.Connection))
                {
                    command.Parameters.AddWithValue("@tipoUsuario", user.tipoUser);
                    command.Parameters.AddWithValue("@correo", user.emailUser);
                    command.Parameters.AddWithValue("@password", user.passwordUser);
                    command.Parameters.AddWithValue("@estado", user.estado);
                    command.Parameters.AddWithValue("@imagen", user.imagen);

                    await command.ExecuteNonQueryAsync();
                }

                return new UserResponse(user, "Usuario creado exitosamente");
            }
            catch (Exception e)
            {
                return new UserResponse("Error: " + e.Message);
            }
            finally
            {
                context.CloseConnection();
            }
        }
    }
}


// public static async Task<string> UpdateUser(UserEntity user, MysqlContext context)
// {
//     var query = "UPDATE users SET tipoUsuario = @tipoUsuario, correo = @correo, password = @password, estado = @estado WHERE id = @id";

//     try
//     {
//         // Abre la conexión
//         context.OpenConnection();

//         using (var command = new MySqlCommand(query, context.Connection))
//         {
//             // Agregar parámetros para evitar SQL Injection
//             command.Parameters.AddWithValue("@tipoUsuario", user.tipoUser);
//             command.Parameters.AddWithValue("@correo", user.emailUser);
//             command.Parameters.AddWithValue("@password", user.passwordUser);
//             command.Parameters.AddWithValue("@estado", user.estado);
//             command.Parameters.AddWithValue("@id", user.Id);

//             // Ejecuta el comando
//             await command.ExecuteNonQueryAsync();
//         }

//         return "Usuario actualizado con éxito";
//     }
//     catch (Exception ex)
//     {
//         return $"Error al actualizar usuario: {ex.Message}";
//     }
//     finally
//     {
//         // Cierra la conexión
//         context.CloseConnection();
//     }
// }


// public static async Task<string> DeleteUser(int userId, MysqlContext context)
// {
//     var query = "DELETE FROM users WHERE id = @id";

//     try
//     {
//         // Abre la conexión
//         context.OpenConnection();

//         using (var command = new MySqlCommand(query, context.Connection))
//         {
//             // Agrega el parámetro `id` para evitar SQL Injection
//             command.Parameters.AddWithValue("@id", userId);

//             // Ejecuta el comando
//             await command.ExecuteNonQueryAsync();
//         }

//         return "Usuario eliminado con éxito";
//     }
//     catch (Exception ex)
//     {
//         return $"Error al eliminar usuario: {ex.Message}";
//     }
//     finally
//     {
//         // Cierra la conexión
//         context.CloseConnection();
//     }
// }
