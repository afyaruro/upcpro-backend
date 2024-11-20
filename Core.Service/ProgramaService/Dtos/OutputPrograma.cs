using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Service.ProgramaService.Dtos
{
    public class OutputPrograma
    {
        public int Id { get; set; }
         public int Id_facultad { get; set; }
        public string nombre { get; set; }
        public bool estado { get; set; }

    }
}