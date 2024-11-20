using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Infrastructure.config
{
    public interface IConfigConnection
    {
        string Server { get; }
        string Database { get; }
        string User { get; }
        string Password { get; }

    }
}

