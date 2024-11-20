using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;

namespace Core.Domain.Interfaces
{
    public interface IFacultadRepository
    {
        public Task<FacultadResponse> NuevaFacultad(FacultadEntity facultad);

        public Task<FacultadResponse> ConsultaFacultad(int idFacultad);

        public Task<FacultadResponse> ObtenerTodasFacultades();

        public Task<FacultadResponse> DeleteFacultad(int idPregunta);

        public Task<FacultadResponse> UpdateFacultad(FacultadEntity pregunta);
    }
}