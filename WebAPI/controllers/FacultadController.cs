using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Service.FacultadService;
using Core.Service.FacultadService.Dtos;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class FacultadController : ControllerBase
    {
        private readonly FacultadService _service;


        public FacultadController(IFacultadRepository repository)
        {
            _service = new FacultadService(repository);
        }

        [HttpPost("nuevaFacultad")]
        public async Task<IActionResult> NuevaFacultad(FacultadDto facultadDto)
        {
            FacultadResponse resp = await _service.CrearFacultad(facultadDto);

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

        [HttpGet("todasFacultades")]
        public async Task<IActionResult> TodasFacultades()
        {
            FacultadResponse resp = await _service.ObtenerFacultades();

            if (resp.IsError == false)
            {
                return Ok(new { success = true, message = resp.message, data = resp.facultades });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }

    }
}