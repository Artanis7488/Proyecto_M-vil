using MySql.Data.MySqlClient;
using System.Data;
using System;

namespace PruebaFractal.Controllers
{
    public class DAL
    {
        public Empleado Login(String username, String contrasena)
        {
            Empleado empleado = new Empleado();

            using (var conn = new ConnectionDB())
            {
                using (MySqlCommand cmd = new MySqlCommand("SP_LOGIN", conn.connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("PARAM_USERNAME", username);
                    cmd.Parameters.AddWithValue("PARAM_CONTRASENA", contrasena);

                    //establecemos la conexión con la bd
                    conn.Open();

                    MySqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            empleado.correo = reader["CORREO"] == null ? string.Empty : Convert.ToString(reader["CORREO"]);
                            empleado.nombres = reader["NOMBRES"] == null ? string.Empty : Convert.ToString(reader["NOMBRES"]);
                            empleado.apellidos = reader["APELLIDOS"] == null ? string.Empty : Convert.ToString(reader["APELLIDOS"]);
                            empleado.edad = reader["EDAD"] == null ? string.Empty : Convert.ToString(reader["EDAD"]);
                            empleado.dni = reader["DNI"] == null ? string.Empty : Convert.ToString(reader["DNI"]);
                            empleado.direccion = reader["DIRECCION"] == null ? string.Empty : Convert.ToString(reader["DIRECCION"]);
                            empleado.foto = reader["FOTO"] == null ? string.Empty : Convert.ToString(reader["FOTO"]);
                            empleado.username = reader["USERNAME"] == null ? string.Empty : Convert.ToString(reader["USERNAME"]);
                            empleado.contrasena = reader["CONTRASENA"] == null ? string.Empty : Convert.ToString(reader["CONTRASENA"]);
                        }
                    }

                    //liberamos el recurso
                    conn.Close();
                }
            }

            return empleado;
        }

        public bool Register(Empleado empleado)
        {
            using (var conn = new ConnectionDB())
            {
                using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRO", conn.connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("PARAM_CORREO", empleado.correo);
                    cmd.Parameters.AddWithValue("PARAM_NOMBRES", empleado.nombres);
                    cmd.Parameters.AddWithValue("PARAM_APELLIDOS", empleado.apellidos);
                    cmd.Parameters.AddWithValue("PARAM_EDAD", empleado.edad);
                    cmd.Parameters.AddWithValue("PARAM_DNI", empleado.dni);
                    cmd.Parameters.AddWithValue("PARAM_DIRECCION", empleado.direccion);
                    cmd.Parameters.AddWithValue("PARAM_FOTO", empleado.foto);
                    cmd.Parameters.AddWithValue("PARAM_USERNAME", empleado.username);
                    cmd.Parameters.AddWithValue("PARAM_CONTRASENA", empleado.contrasena);

                    //abrir la conexion
                    conn.Open();

                    //ejecutamos el procedimiento
                    cmd.ExecuteNonQuery();

                    //cerramos la conexion
                    conn.Close();
                }
            }
            return true;
        }
    }
}
