using System;
using System.Threading.Tasks;
using Core.Domain.Entities;
using Core.Domain.Interfaces;
using Core.Domain.Response;
using Core.Domain.Response.User;
using Core.Service.EstudianteService.Dtos;
using Core.Service.UserService;
using Core.Service.UserService.Dtos;
using Core.Service.UserService.Mapping;
using Infrastructure.jwtConfig;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers // Asegúrate de que el espacio de nombres esté correcto, "Controllers" en lugar de "controllers"
{
    [ApiController]
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {
        private readonly UserService _service;
        private readonly IJwtService _jwtService;


        public UserController(IUserRepository repository, IJwtService jwtService)
        {
            _service = new UserService(repository);
            _jwtService = jwtService;
        }

        // [Authorize]
        [HttpPost("newAdmin")]
        public async Task<IActionResult> crearAdministrador(UserDto userDto)
        {
            UserResponse resp = await _service.newAdministrador(userDto);

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

       

        [HttpPost("loginWeb")]
        public async Task<IActionResult> loginWeb(LoginDto loginDto)
        {

            UserResponse resp = await _service.loginWeb(loginDto.correo, loginDto.password);

            if (resp.IsError == false)
            {
                OutputUserDto userOuput = MappingUser.toOutputUserDto(resp.user!);
                var token = _jwtService.GenerateToken(resp.user!.Id.ToString());
                return Ok(new { success = true, message = resp.message, user = userOuput, token = token });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }

        [HttpPost("loginMovil")]
        public async Task<IActionResult> loginMovil(LoginDto loginDto)
        {

            UserResponse resp = await _service.loginMovil(loginDto.correo, loginDto.password);

            if (resp.IsError == false)
            {
                OutputUserDto userOuput = MappingUser.toOutputUserDto(resp.user!);
                var token = _jwtService.GenerateToken(resp.user!.Id.ToString());
                return Ok(new { success = true, message = resp.message, user = userOuput, token = token });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }


        [HttpGet("GetUser")]
        public async Task<IActionResult> GetUser([FromQuery] string correo)
        {
            UserResponse resp = await _service.GetUser(correo);

            if (resp.IsError == false)
            {
                OutputUserDto userOuput = MappingUser.toOutputUserDto(resp.user!);

                return Ok(new { success = true, message = resp.message, user = userOuput });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }

        [HttpGet("GetUserxID")]
        public async Task<IActionResult> GetUserxID([FromQuery] int Id)
        {
            UserResponse resp = await _service.GetUserxID(Id);

            if (resp.IsError == false)
            {
                OutputUserDto userOuput = MappingUser.toOutputUserDto(resp.user!);
                return Ok(new { success = true, message = resp.message, user = userOuput });
            }
            else if (resp.IsError == true)
            {
                return StatusCode(resp.StatusCode, new { success = false, message = resp.message });
            }

            return StatusCode(500, new { success = false, message = "Error: " + resp.message });

        }




    }
}
