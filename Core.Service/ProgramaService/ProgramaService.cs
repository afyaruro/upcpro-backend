using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Service.ProgramaService.Dtos;
using Core.Service.ProgramaService.Mapping;

namespace Core.Service.ProgramaService
{
    public class ProgramaService
    {
        private readonly IProgramaRepository _repository;

        public ProgramaService(IProgramaRepository repository)
        {
            _repository = repository;

        }

        public async Task<ProgramaResponse> ObtenerProgramas()
        {
            return await _repository.ObtenerTodosProgramas();
        }

        public async Task<ProgramaResponse> CrearPrograma(ProgramaDto programaDto)
        {

            if (programaDto.nombre == null || string.IsNullOrEmpty(programaDto.nombre))
            {
                return new ProgramaResponse("El nombre del programa es requerido", true, 400);
            }

            ProgramaEntity programa = MappingPrograma.toProgramaEntity(programaDto);
            return await _repository.NuevaPrograma(programa);
        }
    }
}