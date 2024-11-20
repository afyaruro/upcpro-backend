using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Service.EstudianteService.Dtos;
using Core.Service.EstudianteService.Mapping;
using Core.Service.FacultadService.Dtos;
using Core.Service.FacultadService.Mapping;
using Core.Service.UserService.Dtos;
using Core.Service.UserService.Mapping;
using Core.Service.utils;

namespace Core.Service.FacultadService
{
    public class FacultadService
    {
        private readonly IFacultadRepository _repository;

        public FacultadService(IFacultadRepository repository)
        {
            _repository = repository;

        }

        public async Task<FacultadResponse> ObtenerFacultades()
        {
            return await _repository.ObtenerTodasFacultades();
        }

        public async Task<FacultadResponse> CrearFacultad(FacultadDto facultadDto)
        {

            if (facultadDto.nombre == null || string.IsNullOrEmpty(facultadDto.nombre))
            {
                return new FacultadResponse("El nombre de la facultad es requerido", true, 400);
            }

            FacultadEntity facultad = MappingFacultad.toFacultadEntity(facultadDto);
            return await _repository.NuevaFacultad(facultad);
        }







    }
}