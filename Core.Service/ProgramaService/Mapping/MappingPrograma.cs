using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Service.ProgramaService.Dtos;

namespace Core.Service.ProgramaService.Mapping
{
    public static class MappingPrograma
    {
        public static ProgramaEntity toProgramaEntity(ProgramaDto programaDto)
        {
            ProgramaEntity programa = new ProgramaEntity();
            programa.nombre = programaDto.nombre;
            programa.estado = programaDto.estado;
            programa.id_facultad = programaDto.Id_facultad;

            return programa;
        }

    }
}