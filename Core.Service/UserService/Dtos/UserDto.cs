using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Core.Service.UserService.Dtos
{
    public class UserDto
    {
        public string emailUser { get; set; }
        public string passwordUser { get; set; }
        public bool estado { get; set; }
        public string imagen { get; set; }
        public string tipoUsuario { get; set; }

    }
}