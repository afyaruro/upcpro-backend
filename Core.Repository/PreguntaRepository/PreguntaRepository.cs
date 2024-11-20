using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Infrastructure.context;

namespace Core.Repository.PreguntaRepository
{
    public class PreguntaRepository : IPreguntaRepository
    {

        private readonly MysqlContext _context;

        public PreguntaRepository(MysqlContext context)
        {
            _context = context;
        }

        public Task<PreguntaResponse> ConsultaPregunta(int idPregunta)
        {
            throw new NotImplementedException();
        }

        public Task<PreguntaResponse> DeletePregunta(int idPregunta)
        {
            throw new NotImplementedException();
        }

        public async Task<PreguntaResponse> NewPregunta(PreguntaEntity preguntaEntity)
        {
            return await NuevaPreguntaRepository.NewPregunta(preguntaEntity, _context);
        }

        public Task<PreguntaResponse> ObtenerTodasPregunta()
        {
            return ConsultarPreguntas.ObtenerTodasPregunta(_context);
        }

        public Task<PreguntaResponse> UpdatePregunta(PreguntaBasicaEntity pregunta)
        {
            throw new NotImplementedException();
        }
    }
}