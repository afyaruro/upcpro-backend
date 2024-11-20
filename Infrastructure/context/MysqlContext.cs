using Infrastructure.config;
using MySql.Data.MySqlClient;
using System;

namespace Infrastructure.context
{
    public class MysqlContext : IDisposable
    {
        private readonly IConfigConnection _config;
        public MySqlConnection Connection { get; }

        public MysqlContext(IConfigConnection config)
        {
            _config = config;
            Connection = new MySqlConnection(GetConnectionString());
        }

        private string GetConnectionString()
        {
            return $"Server={_config.Server};Database={_config.Database};User={_config.User};Password={_config.Password};";
        }

        public void OpenConnection()
        {
            if (Connection.State == System.Data.ConnectionState.Closed)
            {
                Connection.Open();
            }
        }

        public void CloseConnection()
        {
            if (Connection.State == System.Data.ConnectionState.Open)
            {
                Connection.Close();
            }
        }

        public void Dispose()
        {
            CloseConnection();
            Connection.Dispose();
        }
    }
}
