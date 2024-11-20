using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Infrastructure.jwt;
using Infrastructure.jwtConfig;
using Microsoft.IdentityModel.Tokens;

namespace Core.Service.jwtService
{
    public class JwtService : IJwtService
    {
        private readonly IJwt _jwtConfig;

        public JwtService(IJwt jwtConfig)
        {
            _jwtConfig = jwtConfig;
        }

        public string GenerateToken(string userId)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtConfig.key));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, userId),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
            };

            var token = new JwtSecurityToken(
                issuer: _jwtConfig.issuer,
                audience: _jwtConfig.audience,
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(_jwtConfig.expiryMinutes),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
            
        }

        ClaimsPrincipal IJwtService.ValidateToken(string token)
        {
             var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes(_jwtConfig.key);

            try
            {
                var principal = tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = _jwtConfig.issuer,
                    ValidAudience = _jwtConfig.audience,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ClockSkew = TimeSpan.Zero
                }, out SecurityToken validatedToken);

                return principal;
            }
            catch
            {
                return null; // El token no es válido
            }
        }
    }

}