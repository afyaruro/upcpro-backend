using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Response
{
    public class NivelResponse
    {
        
        public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }
        public Nivel nivel { get; set; }
        public List<Nivel> niveles { get; set; }

        public NivelResponse(List<Nivel> niveles, string message)
        {
            this.IsError = false;
            this.message = message;
            this.niveles = niveles;
            this.StatusCode = 200;
        }


        public NivelResponse(Nivel nivel, string message)
        {
            this.IsError = false;
            this.message = message;
            this.nivel = nivel;
            this.StatusCode = 200;
        }

        public NivelResponse(string message, bool IsError, int StatusCode)
        {
            this.IsError = IsError;
            this.message = message;
            this.StatusCode = StatusCode;
        }
    
    }
}