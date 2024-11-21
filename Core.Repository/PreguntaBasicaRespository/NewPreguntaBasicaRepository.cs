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
             var query = "INSERT INTO pregunta_basica (	Id_pregunta, encabezado, question, imagenEncabezado, opcionA, opcionB, opcionC, opcionD, opcionCorrecta, retroalimentacion) VALUES (@Id_pregunta, @encabezado, @question, @imagenEncabezado, @opcionA, @opcionB, @opcionC, @opcionD, @opcionCorrecta, @retroalimentacion)";

            try
            {
                context.OpenConnection();

                using (var command = new MySqlCommand(query, context.Connection))
                {
                    command.Parameters.AddWithValue("@Id_pregunta", pregunta.preguntaEntity.Id);
                    command.Parameters.AddWithValue("@encabezado", pregunta.encabezado);
                    command.Parameters.AddWithValue("@question", pregunta.question);
                    command.Parameters.AddWithValue("@imagenEncabezado", pregunta.imagenEncabezado);
                    command.Parameters.AddWithValue("@opcionA", pregunta.opcionA);
                    command.Parameters.AddWithValue("@opcionB", pregunta.opcionB);
                    command.Parameters.AddWithValue("@opcionC", pregunta.opcionC);
                    command.Parameters.AddWithValue("@opcionD", pregunta.opcionD);
                    command.Parameters.AddWithValue("@opcionCorrecta", pregunta.opcionCorrecta);
                    command.Parameters.AddWithValue("@retroalimentacion", pregunta.retroalimentacion);


                    await command.ExecuteNonQueryAsync();

                }

                return new PreguntaBasicaResponse(pregunta, "Pregunta Basica creada exitosamente");
                
            }
            catch (Exception e)
            {
                return new PreguntaBasicaResponse("Error1: " + e.Message, true, 500);
            }
            finally
            {
                context.CloseConnection();
            }

        }
    }
}