using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Response
{
    public class EstudianteResponse
    {
        public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }
        public EstudianteEntity? estudiante { get; set; }


        public EstudianteResponse(EstudianteEntity estudianteEntity, string message)
        {
            this.IsError = false;
            this.message = message;
            this.estudiante = estudianteEntity;
            this.StatusCode = 200;
        }

        public EstudianteResponse(string message)
        {
            this.IsError = true;
            this.message = message;
            this.estudiante = null;

        }
    }
}