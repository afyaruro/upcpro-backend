using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Core.Service.EstudianteService.Dtos
{
    public class EstudianteDto
    {

        //user
        public string emailUser { get; set; }
        public string passwordUser { get; set; }
        public string tipoUser { get; set; }
        public string imagen { get; set; }

        //estudiante
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string tipoIdentificacion { get; set; }
        public string numeroIdentificacion { get; set; }
        public string sexo { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public int programa { get; set; }

    }
}