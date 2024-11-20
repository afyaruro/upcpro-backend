using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Service.EstudianteService.Dtos
{
    public class OutputEstudiante
    {
        public int userId { get; set; }
        public string emailUser { get; set; }
        public string tipoUser { get; set; }
        public bool estado { get; set; }
        public string imagen { get; set; }


        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string tipoIdentificacion { get; set; }
        public string numeroIdentificacion { get; set; }
        public string sexo { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string programa { get; set; }


      

    }
}