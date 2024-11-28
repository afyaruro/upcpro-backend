using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Interfaces;
using Core.Service.PreguntaService;
using Core.Service.PreguntaService.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PreguntaController : ControllerBase
    {
        private readonly PreguntaService _service;


        public PreguntaController(IPreguntaBasicaRepository repositoryPreguntaBasica, IPreguntaRepository repositoryPregunta)
        {
            _service = new PreguntaService(repositoryPregunta, repositoryPreguntaBasica);
        }

        [HttpPost("nuevaPregunta")]
        public async Task<IActionResult> nuevaPregunta(PreguntaInput preguntaInput)
        {
            PreguntaBasicaResponse resp = await _service.NuevaPreguntaBasica(preguntaInput);

            if (resp.IsError == false)
            {
                return Ok(new { success = true, message = resp.message });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }

        [HttpGet("consultarPreguntas")]
        public async Task<IActionResult> consultarPreguntas()
        {
            PreguntaBasicaResponse resp = await _service.todasPreguntas();

            if (resp.IsError == false)
            {
                return Ok(new { success = true, message = resp.message, data = resp.preguntasBasicas });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }
    }
}