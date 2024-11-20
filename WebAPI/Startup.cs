using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.Domain.Interfaces;
using Core.Repository.EstudianteRepository;
using Core.Repository.FacultadRepository;
using Core.Repository.ProgramasRepository;
using Core.Repository.Repository;
using Core.Service.jwtService;
using Infrastructure.config;
using Infrastructure.context;
using Infrastructure.jwt;
using Infrastructure.jwtConfig;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;



namespace WebAPI
{
    public class Startup
    {
        public IConfiguration Configuration { get; }
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {


            var dbConfig = new ConfigConnection
            {
                Server = "localhost",
                Database = "saberpro",
                User = "root",
                Password = "12345"
            };

            var jwtConfig = new Jwt
            {
                audience = "usuarios",
                expiryMinutes = 60,
                issuer = "upcpro",
                key = "Nj$4xN9Zb@Q#G2nL&*cP6jXp!wV8tRzA"

            };


            services.AddControllers();

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = jwtConfig.issuer,
                    ValidAudience = jwtConfig.audience,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtConfig.key))
                };
            });

            services.AddEndpointsApiExplorer();
            services.AddSwaggerGen();

            services.AddSingleton<IConfigConnection>(dbConfig);
            services.AddSingleton<IJwt>(jwtConfig);
            services.AddTransient<MysqlContext>();
            services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<IEstudianteRepository, EstudianteRepository>();
            services.AddTransient<IFacultadRepository, FacultadRepository>();
            services.AddTransient<IProgramaRepository, ProgramaRepository>();


            services.AddScoped<IJwtService, JwtService>();


        }
    }
}