using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Response;

namespace Core.Domain.Interfaces
{
    public interface IEstudianteRepository
    {
        public Task<EstudianteResponse> NewCuenta(EstudianteEntity estudiante);

        public Task<EstudianteResponse> GetCuentaxUserId(int userId);

    }
}