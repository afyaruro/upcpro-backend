using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Repository.ProgramasRepository;
using Core.Service.ProgramaService;
using Core.Service.ProgramaService.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProgramasController : ControllerBase
    {
        private readonly ProgramaService _service;


        public ProgramasController(IProgramaRepository repository)
        {
            _service = new ProgramaService(repository);
        }

        [HttpPost("nuevoPrograma")]
        public async Task<IActionResult> NuevoPrograma(ProgramaDto programaDto)
        {
            ProgramaResponse resp = await _service.CrearPrograma(programaDto);

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

        [HttpGet("todosProgramas")]
        public async Task<IActionResult> TodosProgramas()
        {
            ProgramaResponse resp = await _service.ObtenerProgramas();

            if (resp.IsError == false)
            {
                return Ok(new { success = true, message = resp.message, data = resp.programas });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }
    }
}