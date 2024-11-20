using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.PreguntaBasicaRespository
{
    public static class NewPreguntaBasicaRepository
    {
        public static async Task<PreguntaBasicaResponse> NewPreguntaBasica(PreguntaBasicaEntity pregunta, MysqlContext context)
        {
             var query = "INSERT INTO preguntas (tipoCompetencia, complejidad, tipoPregunta) VALUES (@tipoCompetencia, @complejidad, @tipoPregunta)";

            // try
            // {
            //     context.OpenConnection();

            //     using (var command = new MySqlCommand(query, context.Connection))
            //     {
            //         command.Parameters.AddWithValue("@tipoCompetencia", pregunta.pregunta.tipoCompetencia);
            //         command.Parameters.AddWithValue("@complejidad", user.emailUser);
            //         command.Parameters.AddWithValue("@tipoPregunta", user.passwordUser);

            //         await command.ExecuteNonQueryAsync();
            //     }

            //     return new UserResponse(user, "Usuario creado exitosamente");
            // }
            // catch (Exception e)
            // {
            //     return new UserResponse("Error: " + e.Message);
            // }
            // finally
            // {
            //     context.CloseConnection();
            // }

            throw new NotImplementedException();
        }
    }
}