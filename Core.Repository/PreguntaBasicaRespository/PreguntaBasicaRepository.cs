using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Infrastructure.context;

namespace Core.Repository.PreguntaBasicaRespository
{
    public class PreguntaBasicaRepository : IPreguntaBasicaRepository
    {

        private readonly MysqlContext _context;

        public PreguntaBasicaRepository(MysqlContext context)
        {
            _context = context;
        }
        public Task<PreguntaBasicaResponse> ConsultaPreguntaBasica(int idPregunta)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeletePreguntaBasica(int idPregunta)
        {
            throw new NotImplementedException();
        }

        public Task<PreguntaBasicaResponse> NewPreguntaBasica(PreguntaBasicaEntity pregunta)
        {
            return NewPreguntaBasicaRepository.NewPreguntaBasica(pregunta, _context);
        }

        public Task<List<PreguntaBasicaResponse>> ObtenerTodasPreguntaBasica(int idPregunta)
        {
            throw new NotImplementedException();
        }

        public Task<bool> UpdatePreguntaBasica(PreguntaBasicaEntity pregunta)
        {
            throw new NotImplementedException();
        }
    }
}