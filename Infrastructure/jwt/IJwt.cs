using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Infrastructure.jwt
{
    public interface IJwt
    {
        string key { get; }
        string issuer { get; }
        string audience { get; }
        int expiryMinutes { get; }
    }
}
