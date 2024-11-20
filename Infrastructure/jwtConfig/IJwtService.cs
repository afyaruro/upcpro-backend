using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Infrastructure.jwtConfig
{
    public interface IJwtService
    {
        string GenerateToken(string userId);
        ClaimsPrincipal ValidateToken(string token);
    }
}