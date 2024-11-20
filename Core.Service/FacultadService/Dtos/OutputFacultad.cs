using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Service.FacultadService.Dtos
{
    public class OutputFacultad
    {
        public int Id { get; set; }
        public string nombre { get; set; }
        public bool estado { get; set; }

    }
}