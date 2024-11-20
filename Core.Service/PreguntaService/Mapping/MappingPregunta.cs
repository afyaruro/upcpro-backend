using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Service.PreguntaService.Dtos;

namespace Core.Service.PreguntaService.Mapping
{
    public static class MappingPregunta
    {
        public static PreguntaBasicaEntity toPreguntaBasicaEntity(PreguntaInput preguntaInput)
        {
            PreguntaBasicaEntity pregunta = new PreguntaBasicaEntity();
            pregunta.preguntaEntity = new PreguntaEntity();
            pregunta.preguntaEntity.tipoCompetencia = preguntaInput.tipoCompetencia;
            pregunta.preguntaEntity.tipoPregunta = preguntaInput.tipoPregunta;
            pregunta.preguntaEntity.complejidad = preguntaInput.complejidad;

            pregunta.imagenEncabezado = preguntaInput.imagenEncabezado;
            pregunta.encabezado = preguntaInput.encabezado;
            pregunta.opcionA = preguntaInput.opcionA;
            pregunta.opcionB = preguntaInput.opcionB;
            pregunta.opcionC = preguntaInput.opcionC;
            pregunta.opcionD = preguntaInput.opcionD;
            pregunta.opcionCorrecta = preguntaInput.opcionCorrecta;
            pregunta.retroalimentacion = preguntaInput.retroalimentacion;

            return pregunta;
        }


    }
}