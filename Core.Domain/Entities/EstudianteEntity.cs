using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities.Base;

namespace Core.Domain.Entities
{
    public class EstudianteEntity : BaseEntity
    {
        public UserEntity user { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string tipoIdentificacion { get; set; }
        public string numeroIdentificacion { get; set; }
        public string sexo { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public int programa { get; set; }
    }
}