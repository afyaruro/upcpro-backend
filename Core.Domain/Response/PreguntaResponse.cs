using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Response
{
    public class PreguntaResponse
    {
        public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }
        public PreguntaEntity pregunta { get; set; }
        public List<PreguntaEntity> preguntas { get; set; }


        public PreguntaResponse(PreguntaEntity preguntaEntity, string message)
        {
            this.IsError = false;
            this.message = message;
            this.pregunta = preguntaEntity;
            this.StatusCode = 200;
        }

        public PreguntaResponse(List<PreguntaEntity> preguntas, string message)
        {
            this.IsError = false;
            this.message = message;
            this.preguntas = preguntas;
            this.StatusCode = 200;
        }


        public PreguntaResponse(string message, bool IsError, int StatusCode)
        {
            this.IsError = IsError;
            this.message = message;
            this.StatusCode = StatusCode;
        }
    }
}
