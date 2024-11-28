using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities.Base;

namespace Core.Domain.Entities
{
    public class Nivel:BaseEntity
    {

        public int dificultad { get; set; }
        public List<int> preguntas { get; set; }
        public int competencia { get; set; }
        
    }
}