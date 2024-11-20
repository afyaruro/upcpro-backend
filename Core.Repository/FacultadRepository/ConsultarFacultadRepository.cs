using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;
using Infrastructure.context;
using MySql.Data.MySqlClient;

namespace Core.Repository.FacultadRepository
{
    public static class ConsultarFacultadRepository
    {
        public static async Task<FacultadResponse> ConsultaFacultad(int idFacultad, MysqlContext _context)
        {
            try
            {
                var query = "SELECT * FROM facultades WHERE id = @id";

                _context.OpenConnection();

                using (var command = new MySqlCommand(query, _context.Connection))
                {
                    command.Parameters.AddWithValue("@id", idFacultad);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            var facultad = new FacultadEntity
                            {
                                Id = reader.GetInt32("ID"),
                                nombre = reader.GetString("nombre"),
                                estado = reader.GetBoolean("estado")
                            };

                            return new FacultadResponse(facultad, "Facultad encontrada exitosamente");
                        }
                        else
                        {
                            return new FacultadResponse("Facultad no encontrada", true, 404);
                        }
                    }
                }
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
    }
}