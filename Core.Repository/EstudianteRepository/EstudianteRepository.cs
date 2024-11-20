
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Infrastructure.context;

namespace Core.Repository.EstudianteRepository
{
    public class EstudianteRepository : IEstudianteRepository
    {
        private readonly MysqlContext _context;

        public EstudianteRepository(MysqlContext context)
        {
            _context = context;
        }

        public async Task<EstudianteResponse> GetCuentaxUserId(int userId)
        {
            return await GetCuentaxUserIdRepository.GetCuentaxUserId(userId, _context);
        }

        public async Task<EstudianteResponse> NewCuenta(EstudianteEntity estudiante)
        {
            return await NewEstudianteRepository.NewCuenta(estudiante, _context);
        }
    }
}

