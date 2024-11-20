using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Core.Service.UserService.Dtos
{
    public class LoginDto
    {
        public string correo { get; set; }
        public string password { get; set; }
    }
}