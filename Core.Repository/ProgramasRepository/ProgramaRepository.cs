using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Repository.FacultadRepository;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.ProgramasRepository
{
    public class ProgramaRepository : IProgramaRepository
    {

        private readonly MysqlContext _context;

        public ProgramaRepository(MysqlContext context)
        {
            _context = context;
        }

        public Task<ProgramaResponse> ConsultaPrograma(int idPrograma)
        {
            throw new NotImplementedException();
        }

        public Task<ProgramaResponse> DeletePrograma(int idPregunta)
        {
            throw new NotImplementedException();
        }

        public async Task<ProgramaResponse> NuevaPrograma(ProgramaEntity programa)
        {
            try
            {
                FacultadResponse resp = await ConsultarFacultadRepository.ConsultaFacultad(programa.id_facultad, _context);

                if (resp.IsError == false)
                {
                    var query = "INSERT INTO programas (nombre, Id_facultad) VALUES (@nombre, @Id_facultad)";

                    _context.OpenConnection();

                    using (var command = new MySqlCommand(query, _context.Connection))
                    {
                        command.Parameters.AddWithValue("@nombre", programa.nombre);
                        command.Parameters.AddWithValue("@Id_facultad", programa.id_facultad);

                        await command.ExecuteNonQueryAsync();
                    }

                    return new ProgramaResponse(programa, "Programa creado exitosamente");
                }

                return new ProgramaResponse(resp.message, true, resp.StatusCode);

            }
            catch (Exception e)
            {
                return new ProgramaResponse("Error: " + e.Message, true, 500);
            }
            finally
            {
                _context.CloseConnection();
            }
        }

        public async Task<ProgramaResponse> ObtenerTodosProgramas()
        {
            List<ProgramaEntity> programas = new List<ProgramaEntity>();

            try
            {
                var query = "SELECT * FROM programas";

                _context.OpenConnection();

                using (var command = new MySqlCommand(query, _context.Connection))
                {

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var programa = new ProgramaEntity
                            {
                                Id = reader.GetInt32("ID"),
                                nombre = reader.GetString("nombre"),
                                id_facultad = reader.GetInt32("Id_facultad"),
                                estado = reader.GetBoolean("estado")

                            };

                            programas.Add(programa);


                        }
                    }
                }

                return new ProgramaResponse(programas, "programas cargada exitosamente");
            }
            catch (Exception e)
            {
                return new ProgramaResponse("Error: " + e.Message, true, 500);

            }
            finally
            {
                _context.CloseConnection();
            }
        }

        public Task<ProgramaResponse> UpdatePrograma(ProgramaEntity pregunta)
        {
            throw new NotImplementedException();
        }
    }
}