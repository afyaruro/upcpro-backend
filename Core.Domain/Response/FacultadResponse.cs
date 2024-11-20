using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Response
{
    public class FacultadResponse
    {
        public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }
        public FacultadEntity facultad { get; set; }
        public List<FacultadEntity> facultades { get; set; }

        public FacultadResponse(List<FacultadEntity> facultades, string message)
        {
            this.IsError = false;
            this.message = message;
            this.facultades = facultades;
            this.StatusCode = 200;
        }


        public FacultadResponse(FacultadEntity facultad, string message)
        {
            this.IsError = false;
            this.message = message;
            this.facultad = facultad;
            this.StatusCode = 200;
        }

        public FacultadResponse(string message, bool IsError, int StatusCode)
        {
            this.IsError = IsError;
            this.message = message;
            this.StatusCode = StatusCode;
        }
    }
}