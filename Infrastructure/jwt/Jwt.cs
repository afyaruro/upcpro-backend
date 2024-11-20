using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Infrastructure.jwt
{
    public class Jwt : IJwt
    {
        public string key { get; set; }

        public string issuer { get; set; }

        public string audience { get; set; }

        public int expiryMinutes { get; set; }
    }
}