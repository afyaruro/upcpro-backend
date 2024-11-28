using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.PreguntaRepository
{
    public static class ConsultarPreguntas
    {
        public static async Task<PreguntaResponse> ObtenerTodasPregunta(MysqlContext _context)
        {
            List<PreguntaEntity> preguntas = new List<PreguntaEntity>();

            try
            {
                var query = "SELECT * FROM preguntas";

                _context.OpenConnection();

                using (var command = new MySqlCommand(query, _context.Connection))
                {

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var pregunta = new PreguntaEntity
                            {
                                Id = reader.GetInt32("ID"),
                                complejidad = reader.GetInt32("complejidad"),
                                tipoCompetencia = reader.GetInt32("tipoCompetencia"),
                                tipoPregunta = reader.GetInt32("tipoPregunta")

                            };

                            preguntas.Add(pregunta);


                        }
                    }
                }

                return new PreguntaResponse(preguntas, "preguntas cargada exitosamente");
            }
            catch (Exception e)
            {
                return new PreguntaResponse("Error: " + e.Message, true, 500);

            }
            finally
            {
                _context.CloseConnection();
            }
        }



        public static async Task<PreguntaResponse> ObtenerPreguntaPorId(MysqlContext _context, int id)
        {
            try
            {
                var query = "SELECT * FROM preguntas WHERE ID = @Id";
                PreguntaEntity pregunta = null;

                _context.OpenConnection();

                using (var command = new MySqlCommand(query, _context.Connection))
                {
                    command.Parameters.AddWithValue("@Id", id);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            pregunta = new PreguntaEntity
                            {
                                Id = reader.GetInt32("ID"),
                                complejidad = reader.GetInt32("complejidad"),
                                tipoCompetencia = reader.GetInt32("tipoCompetencia"),
                                tipoPregunta = reader.GetInt32("tipoPregunta")
                            };
                        }
                    }
                }

                if (pregunta != null)
                {
                    return new PreguntaResponse(new List<PreguntaEntity> { pregunta }, "Pregunta encontrada exitosamente");
                }
                else
                {
                    return new PreguntaResponse("No se encontró ninguna pregunta con el ID proporcionado", true, 404);
                }
            }
            catch (Exception e)
            {
                return new PreguntaResponse("Error: " + e.Message, true, 500);
            }
            finally
            {
                _context.CloseConnection();
            }
        }

    }
}