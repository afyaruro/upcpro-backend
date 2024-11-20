using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;

namespace Core.Domain.Interfaces
{
    public interface IPreguntaRepository
    {
         public Task<PreguntaResponse> NewPregunta(PreguntaEntity preguntaEntity);

        public Task<PreguntaResponse> ConsultaPregunta(int idPregunta);

        public Task<PreguntaResponse> ObtenerTodasPregunta();

        public Task<PreguntaResponse> DeletePregunta(int idPregunta);

        public Task<PreguntaResponse> UpdatePregunta(PreguntaBasicaEntity pregunta);
    }
}