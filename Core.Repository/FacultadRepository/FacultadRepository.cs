using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.FacultadRepository
{
    public class FacultadRepository : IFacultadRepository
    {

        private readonly MysqlContext _context;

        public FacultadRepository(MysqlContext context)
        {
            _context = context;
        }

        public async Task<FacultadResponse> ConsultaFacultad(int idFacultad)
        {
            return await ConsultarFacultadRepository.ConsultaFacultad(idFacultad, _context);
        }

        public Task<FacultadResponse> DeleteFacultad(int idPregunta)
        {

            //actualizar estado a true
            throw new NotImplementedException();
        }

        public async Task<FacultadResponse> NuevaFacultad(FacultadEntity facultad)
        {
            try
            {
                var query = "INSERT INTO facultades (nombre) VALUES (@nombre)";

                _context.OpenConnection();

                using (var command = new MySqlCommand(query, _context.Connection))
                {
                    command.Parameters.AddWithValue("@nombre", facultad.nombre);

                    await command.ExecuteNonQueryAsync();
                }

                return new FacultadResponse(facultad, "Facultad creada exitosamente");


            }
            catch (Exception e)
            {
                return new FacultadResponse("Error: " + e.Message, true, 500);
            }
            finally
            {
                _context.CloseConnection();
            }
        }

        public async Task<FacultadResponse> ObtenerTodasFacultades()
        {
            List<FacultadEntity> facultades = new List<FacultadEntity>();

            try
            {
                var query = "SELECT * FROM facultades";

                _context.OpenConnection();

                using (var command = new MySqlCommand(query, _context.Connection))
                {
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var facultad = new FacultadEntity
                            {
                                Id = reader.GetInt32("ID"),
                                nombre = reader.GetString("nombre"),
                                estado = reader.GetBoolean("estado")

                            };

                            facultades.Add(facultad);


                        }
                    }
                }

                return new FacultadResponse(facultades, "Facultades cargada exitosamente");
            }
            catch (Exception e)
            {
                return new FacultadResponse("Error: " + e.Message, true, 500);

            }
            finally
            {
                _context.CloseConnection();
            }
        }

        public Task<FacultadResponse> UpdateFacultad(FacultadEntity pregunta)
        {
            //actualizar el nombre
            throw new NotImplementedException();
        }
    }
}