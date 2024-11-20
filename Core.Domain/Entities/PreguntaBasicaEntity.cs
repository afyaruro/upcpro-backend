using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities.Base;

namespace Core.Domain.Entities
{
    public class PreguntaBasicaEntity : BaseEntity
    {
        public int id_pregunta { get; set; }
        public string encabezado { get; set; }
        public string imagenEncabezado { get; set; }
        public string opcionA { get; set; }
        public string opcionB { get; set; }
        public string opcionC { get; set; }
        public string opcionD { get; set; }
        public int opcionCorrecta { get; set; }  // a = 1, b = 2, c=3, d=4
        public string retroalimentacion { get; set; }
    }
}