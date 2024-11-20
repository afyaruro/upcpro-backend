using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Response
{
    public class ProgramaResponse
    {
        public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }
        public ProgramaEntity programa { get; set; }
        public List<ProgramaEntity> programas { get; set; }

        public ProgramaResponse(List<ProgramaEntity> programaEntities, string message)
        {
            this.IsError = false;
            this.message = message;
            this.programas = programaEntities;
            this.StatusCode = 200;
        }


        public ProgramaResponse(ProgramaEntity programa, string message)
        {
            this.IsError = false;
            this.message = message;
            this.programa = programa;
            this.StatusCode = 200;
        }

        public ProgramaResponse(string message, bool IsError, int StatusCode)
        {
            this.IsError = IsError;
            this.message = message;
            this.StatusCode = StatusCode;
        }
    }
}