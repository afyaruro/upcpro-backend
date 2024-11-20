using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities.Base;

namespace Core.Domain.Entities
{
    public class ProgramaEntity: BaseEntity
    {

        public int id_facultad { get; set; }
        public string nombre { get; set; }
        public bool estado { get; set; }
        
    }
}