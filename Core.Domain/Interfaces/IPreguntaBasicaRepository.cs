using System.Reflection.Metadata;
using Core.Domain.Entities;

namespace Core.Domain.Interfaces
{
    public interface IPreguntaBasicaRepository
    {
        public Task<PreguntaBasicaResponse> NewPreguntaBasica(PreguntaBasicaEntity preguntaBasica);

        public Task<PreguntaBasicaResponse> ConsultaPreguntaBasica(int idPregunta);

        public Task<PreguntaBasicaResponse> ObtenerTodasPreguntaBasica();

        public Task<PreguntaBasicaResponse> DeletePreguntaBasica(int idPregunta);

        public Task<PreguntaBasicaResponse> UpdatePreguntaBasica(PreguntaBasicaEntity pregunta);

    }
}