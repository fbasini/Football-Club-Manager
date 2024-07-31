using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Dao
{
    public class AccesoDatos
    {
        private String rutaBDClubFutbol = "Data Source=localhost\\sqlexpress;Initial Catalog=BDClubFutbol;Integrated Security=True;";

        public AccesoDatos()
        {

        }

        public SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(rutaBDClubFutbol);
            try
            {
                cn.Open();
                return cn;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public SqlDataAdapter ObtenerAdaptador(String consultaSql, SqlConnection cn)
        {
            SqlDataAdapter adp;
            try
            {
                adp = new SqlDataAdapter(consultaSql, cn);
                return adp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(String nombreTabla, String SqlConsulta)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = ObtenerAdaptador(SqlConsulta, ObtenerConexion());
            adp.Fill(ds, nombreTabla);
            return ds.Tables[nombreTabla];
        }

        public int EjecutarProcedimiento(SqlCommand comando, String NombreSP)
        {
            int filasCambiadas;
            SqlConnection cn = ObtenerConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = comando;
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            filasCambiadas = cmd.ExecuteNonQuery();
            cn.Close();
            return filasCambiadas;
        }

        public Boolean Existe(String consulta)
        {
            Boolean estado = false;
            SqlCommand cmd = new SqlCommand(consulta, ObtenerConexion());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                estado = true;
            }

            return estado;

        }

        public Boolean ObtenerRol(String consulta)
        {
            Boolean rol = false;
            SqlCommand cmd = new SqlCommand(consulta, ObtenerConexion());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                rol = dr.GetBoolean(0);
            }

            return rol;
        }

        public int ObtenerUltimoId(String consulta)
        {
            int id = 0;
            SqlCommand cmd = new SqlCommand(consulta, ObtenerConexion());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = dr.GetInt32(0);
            }

            return id;
        }

        public String ObtenerString(String consulta)
        {
            String texto="Error";
            SqlCommand cmd = new SqlCommand(consulta, ObtenerConexion());
            SqlDataReader dr = cmd.ExecuteReader();
            
            if (dr.Read())
            {
                texto = dr.GetString(0);
            }
            
            return texto;
        }

        public int ObtenerId(String consulta)
        {
            int id = 0;
            SqlCommand cmd = new SqlCommand(consulta, ObtenerConexion());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = dr.GetInt32(0);
            }

            return id;
        }

        public int ExisteNombreUsuario(String consulta)
        {
            int cantidad = 0;
            SqlCommand cmd = new SqlCommand(consulta, ObtenerConexion());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                cantidad = dr.GetInt32(0);
            }

            return cantidad;
        }

        public int ExisteDni(String consulta)
        {
            int cantidad = 0;
            SqlCommand cmd = new SqlCommand(consulta, ObtenerConexion());
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                cantidad = dr.GetInt32(0);
            }

            return cantidad;
        }
    }
}
