using MySql.Data.MySqlClient;
using System;

namespace PruebaFractal.Controllers
{
    public class ConnectionDB : IDisposable
    {
        public readonly MySqlConnection connection;

        public ConnectionDB()
        {
            string hostname = "127.0.0.1";
            string port = "3306";
            string user = "root";
            string password = "74881894";
            string database = "athenec";

            string connectionString = String.Format("Server={0};Port={1};Database={2};userid={3};password={4};", hostname, port, database, user, password);

            connection = new MySqlConnection(connectionString);
        }
        public void Open()
        {
            connection.Open();
        }

        public void Close()
        {
            if (connection != null)
            {
                connection.Close();
            }
        }
        public void Dispose()
        {
            if (connection != null)
            {
                connection.Close();
            }
        }
    }
}
