using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Service.PreguntaService.Dtos;
using Core.Service.PreguntaService.Mapping;

namespace Core.Service.PreguntaService
{
    public class PreguntaService
    {
        private readonly IPreguntaRepository _preguntaRepository;
        private readonly IPreguntaBasicaRepository _preguntaBasicaRepository;



        public PreguntaService(IPreguntaRepository preguntaRepository, IPreguntaBasicaRepository preguntaBasicaRepository)
        {
            _preguntaRepository = preguntaRepository;
            _preguntaBasicaRepository = preguntaBasicaRepository;

        }

        public async Task<PreguntaBasicaResponse> NuevaPreguntaBasica(PreguntaInput preguntaInput)
        {

            //validar los valores y listo

            PreguntaBasicaEntity preguntaBasica = MappingPregunta.toPreguntaBasicaEntity(preguntaInput);

            PreguntaResponse preguntaResponse = await _preguntaRepository.NewPregunta(preguntaBasica.preguntaEntity);

            if (!preguntaResponse.IsError)
            {

                preguntaBasica.Id = preguntaResponse.pregunta.Id;
                PreguntaBasicaResponse preguntaBasicaResponse = await _preguntaBasicaRepository.NewPreguntaBasica(preguntaBasica);

                if (!preguntaBasicaResponse.IsError){
                    return preguntaBasicaResponse;
                }

                return new PreguntaBasicaResponse(preguntaBasicaResponse.message, true, preguntaBasicaResponse.StatusCode);

            }

            return new PreguntaBasicaResponse(preguntaResponse.message, true, preguntaResponse.StatusCode);

        }


    }
}