using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Interfaces
{
    public interface INivelRepository
    {
        public Task<PreguntaBasicaResponse> nuevoNivel(Nivel nivel);

        public Task<PreguntaBasicaResponse> preguntasNivel(int IdNivel);

        public Task<PreguntaBasicaResponse> todosNivelesCompetencia();
    }
}