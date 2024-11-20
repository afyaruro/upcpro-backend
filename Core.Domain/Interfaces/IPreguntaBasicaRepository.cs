using System.Reflection.Metadata;
using Core.Domain.Entities;

namespace Core.Domain.Interfaces
{
    public interface IPreguntaBasicaRepository
    {
        public Task<PreguntaBasicaResponse> NewPreguntaBasica(PreguntaBasicaEntity pregunta);

        public Task<PreguntaBasicaResponse> ConsultaPreguntaBasica(int idPregunta);

        public Task<List<PreguntaBasicaResponse>> ObtenerTodasPreguntaBasica(int idPregunta);

        public Task<bool> DeletePreguntaBasica(int idPregunta);

        public Task<bool> UpdatePreguntaBasica(PreguntaBasicaEntity pregunta);

    }
}