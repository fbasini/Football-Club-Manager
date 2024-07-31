using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace Dao
{
    public class DaoResponsable
    {
        AccesoDatos datos = new AccesoDatos();
        public DataTable getTablaResponsable()
        {
            DataTable tabla = datos.ObtenerTabla("Responsable", "select * from Responsables");
            return tabla;
        }
        public DataTable getResponsable(Responsable resp)
        {
            DataTable tabla = datos.ObtenerTabla("Responsables", "select * from Responsables where IdResponsable_R = '" + resp.IdResponsable + "'");
            return tabla;
        }

        public String getCeldaResponsable(String nombreColumna, Responsable resp)
        {
            String celda = datos.ObtenerString("select " + nombreColumna + " from Usuarios where idResponsable_R= '" + resp.IdResponsable + "'");
            return celda;
        }

        public int getId(int dni)
        {
            DataTable tabla = datos.ObtenerTabla("Responsables", "select * from Responsables where Dni_R = '" + dni + "'");
            int id = int.Parse(tabla.Rows[0]["IdResponsable_R"].ToString());
            return id;
        }
        private void armarParametroAgregar(ref SqlCommand cmd, Responsable resp)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
            parametro.Value = resp.NombreResponsable;
            parametro = cmd.Parameters.Add("@apellido", SqlDbType.VarChar);
            parametro.Value = resp.ApellidoResponsable;
            parametro = cmd.Parameters.Add("@dni", SqlDbType.Char);
            parametro.Value = resp.DniResponsable;
            parametro = cmd.Parameters.Add("@genero", SqlDbType.VarChar);
            parametro.Value = resp.GeneroResponsable;
            parametro = cmd.Parameters.Add("@telefono", SqlDbType.VarChar);
            parametro.Value = resp.TelefonoResponsable;
        }
        public bool agregarResponsable(Responsable resp)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametroAgregar(ref cmd, resp);
            int filas = datos.EjecutarProcedimiento(cmd, "Sp_AgregarResponsable");
            if(filas == 1)
            {
                return true;
            }
            return false;
        }

        public Responsable infoRespoPorID(Responsable respo)
        {
            DataTable tabla = new DataTable();
            tabla = getResponsable(respo);
            respo.NombreResponsable = tabla.Rows[0]["Nombre_R"].ToString();
            respo.ApellidoResponsable = tabla.Rows[0]["Apellido_R"].ToString();
            respo.DniResponsable = int.Parse(tabla.Rows[0]["Dni_R"].ToString());
            respo.GeneroResponsable = tabla.Rows[0]["Genero_R"].ToString();
            respo.TelefonoResponsable = tabla.Rows[0]["Telefono_R"].ToString();
            return respo;
        }

        public void ArmarParametroModificarResponsable(ref SqlCommand cmd, Responsable respo)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@idResponsable", SqlDbType.Int);
            parametro.Value = respo.IdResponsable;
            parametro = cmd.Parameters.Add("@telefono", SqlDbType.VarChar);
            parametro.Value = respo.TelefonoResponsable;
        }

        public bool modificarResponsable(Responsable respo)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametroModificarResponsable(ref cmd, respo);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "Sp_ModificarResponsable");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }
    }
}
