using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.PreguntaRepository
{
    public static class NuevaPreguntaRepository
    {

        public static async Task<PreguntaResponse> NewPregunta(PreguntaEntity pregunta, MysqlContext context)
        {
            var query = "INSERT INTO preguntas (tipoCompetencia, complejidad, tipoPregunta) VALUES (@tipoCompetencia, @complejidad, @tipoPregunta)";
            var idQuery = "SELECT LAST_INSERT_ID();";

            try
            {
                context.OpenConnection();

                using (var command = new MySqlCommand(query, context.Connection))
                {
                    command.Parameters.AddWithValue("@tipoCompetencia", pregunta.tipoCompetencia);
                    command.Parameters.AddWithValue("@complejidad", pregunta.complejidad);
                    command.Parameters.AddWithValue("@tipoPregunta", pregunta.tipoPregunta);

                    await command.ExecuteNonQueryAsync();

                }

                using (var idCommand = new MySqlCommand(idQuery, context.Connection))
                {
                    // Ejecutar la consulta para obtener el ID generado
                    var insertedId = await idCommand.ExecuteScalarAsync();

                    if (insertedId != null)
                    {
                        pregunta.Id = Convert.ToInt32(insertedId); // Asignar el ID a la entidad
                    }
                }


                return new PreguntaResponse(pregunta, "Pregunta creada exitosamente");

            }
            catch (Exception e)
            {
                return new PreguntaResponse("Error2: " + e.Message, true, 500);
            }
            finally
            {
                context.CloseConnection();
            }

            throw new NotImplementedException();
        }

    }
}