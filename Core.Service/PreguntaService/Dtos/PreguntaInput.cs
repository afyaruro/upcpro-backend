using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Core.Service.PreguntaService.Dtos
{
    public class PreguntaInput
    {
        public int tipoCompetencia { get; set; } 
        public int tipoPregunta { get; set; } 
        public int complejidad { get; set; } 
        public string encabezado { get; set; }
        public string question { get; set; }

        public string imagenEncabezado { get; set; }
        public string opcionA { get; set; }
        public string opcionB { get; set; }
        public string opcionC { get; set; }
        public string opcionD { get; set; }
        public int opcionCorrecta { get; set; } 
        public string retroalimentacion { get; set; }
    }
}