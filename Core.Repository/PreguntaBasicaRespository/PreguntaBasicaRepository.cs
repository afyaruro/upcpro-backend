using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Repository.PreguntaRepository;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.PreguntaBasicaRespository
{
    public class PreguntaBasicaRepository : IPreguntaBasicaRepository
    {

        private readonly MysqlContext _context;

        public PreguntaBasicaRepository(MysqlContext context)
        {
            _context = context;
        }

        public async Task<PreguntaBasicaResponse> ConsultaPreguntaBasica(int idPregunta)
        {
            try
            {
                PreguntaBasicaEntity pregunta;
                _context.OpenConnection();

                var query = "SELECT * FROM pregunta_basica WHERE Id_pregunta = @Id_pregunta";

                using (var command = new MySqlCommand(query, _context.Connection))
                {
                    command.Parameters.AddWithValue("@Id_pregunta", idPregunta);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            pregunta = new PreguntaBasicaEntity
                            {
                                Id = reader.GetInt32("ID"),

                                encabezado = reader.GetString("encabezado"),
                                question = reader.GetString("question"),
                                imagenEncabezado = reader.GetString("imagenEncabezado"),
                                opcionA = reader.GetString("opcionA"),
                                opcionB = reader.GetString("opcionB"),
                                opcionC = reader.GetString("opcionC"),
                                opcionD = reader.GetString("opcionD"),
                                opcionCorrecta = reader.GetInt32("opcionCorrecta"),
                                retroalimentacion = reader.GetString("retroalimentacion"),
                                preguntaEntity = new PreguntaEntity(),

                            };

                            Console.WriteLine(pregunta.retroalimentacion);

                            return new PreguntaBasicaResponse(pregunta, "existe");




                        }
                    }
                }

                return new PreguntaBasicaResponse("no existe", true, 500);
            }
            catch (Exception ex)
            {
                return new PreguntaBasicaResponse("Error: " + ex.Message, true, 500);
            }
            finally
            {
                _context.CloseConnection();
            }


        }

        public Task<PreguntaBasicaResponse> NewPreguntaBasica(PreguntaBasicaEntity pregunta)
        {
            return NewPreguntaBasicaRepository.NewPreguntaBasica(pregunta, _context);
        }

        public Task<PreguntaBasicaResponse> ObtenerTodasPreguntaBasica()
        {
            throw new NotImplementedException();
        }

        Task<PreguntaBasicaResponse> IPreguntaBasicaRepository.DeletePreguntaBasica(int idPregunta)
        {
            throw new NotImplementedException();
        }

        Task<PreguntaBasicaResponse> IPreguntaBasicaRepository.UpdatePreguntaBasica(PreguntaBasicaEntity pregunta)
        {
            throw new NotImplementedException();
        }
    }
}