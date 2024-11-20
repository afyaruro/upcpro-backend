using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Core.Domain.Response
{
    public class ValidateResponse
    {
         public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }

        public ValidateResponse(string message, int StatusCode)
        {
            this.IsError = true;
            this.message = message;
            this.StatusCode = StatusCode;
        }

        public ValidateResponse()
        {
            this.IsError = false;
        }

    }
}