using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Service.EstudianteService.Dtos;
using Core.Service.FacultadService.Dtos;
using Core.Service.UserService.Dtos;

namespace Core.Service.FacultadService.Mapping
{
    public class MappingFacultad
    {

        public static FacultadEntity toFacultadEntity(FacultadDto facultadDto)
        {
            FacultadEntity facultad = new FacultadEntity();
            facultad.nombre = facultadDto.nombre;
            facultad.estado = facultadDto.estado;

            return facultad;
        }




    }
}