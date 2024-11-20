using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Service.EstudianteService;
using Core.Service.EstudianteService.Dtos;
using Core.Service.EstudianteService.Mapping;
using Core.Service.UserService;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class EstudianteController : ControllerBase
    {

        private readonly EstudianteService _service;
        private readonly UserService _userService;


        public EstudianteController(IEstudianteRepository repository, IUserRepository userRepository)
        {
            _service = new EstudianteService(repository, userRepository);
            _userService = new UserService(userRepository);
        }

        [HttpPost("crearCuenta")]
        public async Task<IActionResult> crearCuenta(EstudianteDto estudianteDto)
        {
            EstudianteResponse resp = await _service.newEstudiante(estudianteDto);

            if (resp.IsError == false)
            {

                var estudiante = MappingEstudiante.toOutputEstudiante(resp.estudiante!);
                return Ok(new { success = true, message = resp.message, data = estudiante });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }

        //consultar cuenta por userId

        [HttpGet("GetUserxID")]
        public async Task<IActionResult> GetUserxID([FromQuery] int Id)
        {
            EstudianteResponse resp = await _service.GetEstudiantexUserID(Id);

            if (resp.IsError == false)
            {
                return Ok(new { success = true, message = resp.message, user = resp.estudiante});
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }


    }
}
