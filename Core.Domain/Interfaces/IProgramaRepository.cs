using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;

namespace Core.Domain.Interfaces
{
    public interface IProgramaRepository
    {

        public Task<ProgramaResponse> NuevaPrograma(ProgramaEntity programa);

        public Task<ProgramaResponse> ConsultaPrograma(int idPrograma);

        public Task<ProgramaResponse> ObtenerTodosProgramas();

        public Task<ProgramaResponse> DeletePrograma(int idPregunta);

        public Task<ProgramaResponse> UpdatePrograma(ProgramaEntity pregunta);
    }
}
