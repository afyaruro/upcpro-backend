using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities.Base;

namespace Core.Domain.Entities
{
    public class FacultadEntity: BaseEntity
    {
        public string nombre { get; set; }
        public bool estado { get; set; }

    }
}