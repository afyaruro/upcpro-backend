using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Interfaces
{
    public class PreguntaBasicaResponse
    {
         public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }
        public PreguntaBasicaEntity preguntaBasica { get; set; }


        public PreguntaBasicaResponse(PreguntaBasicaEntity preguntaBasicaEntity, string message)
        {
            this.IsError = false;
            this.message = message;
            this.preguntaBasica = preguntaBasicaEntity;
            this.StatusCode = 200;
        }

        public PreguntaBasicaResponse(string message, bool IsError, int StatusCode)
        {
            this.IsError = IsError;
            this.message = message;
            this.StatusCode = StatusCode;
        }
    }
}