using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Core.Domain.Entities;

namespace Core.Domain.Response.User
{
    public class UserResponse
    {
        public bool IsError { get; set; }
        public int StatusCode { get; set; }
        public string message { get; set; }
        public UserEntity? user { get; set; }

        public UserResponse(UserEntity userEntity, string message)
        {
            this.IsError = false;
            this.message = message;
            this.user = userEntity;
            this.StatusCode = 200;
        }

        public UserResponse(string message)
        {
            this.IsError = true;
            this.message = message;
            this.user = null;
            
        }
    }
}