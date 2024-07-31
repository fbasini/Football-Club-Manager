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
    public class DaoAdmin
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaAdmin()
        {
            DataTable tabla = datos.ObtenerTabla("Administradores", "select * from Administradores");
            return tabla;
        }

        public DataTable getAdmin(Administrador admin)
        {
            DataTable tabla = datos.ObtenerTabla("Administradores", "select * from Administradores where idAdmin_A= '" + admin.IdAdmin + "'");
            return tabla;
        }

        public String getCeldaAdmin(String nombreColumna, Administrador admin)
        {
            String celda = datos.ObtenerString("select " + nombreColumna + " from Administradores where idAdmin_A= '" + admin.IdAdmin + "'");
            return celda;
        }

        private void ArmarParametrosAgregarAdmin (ref SqlCommand cmd, Administrador admin)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
            parametro.Value = admin.NombreAdmin;
            parametro = cmd.Parameters.Add("@apellido", SqlDbType.VarChar);
            parametro.Value = admin.ApellidoAdmin;
            parametro = cmd.Parameters.Add("@dni", SqlDbType.Char);
            parametro.Value = admin.DniAdmin;
            parametro = cmd.Parameters.Add("@telefono", SqlDbType.VarChar);
            parametro.Value = admin.TelefonoAdmin;
            parametro = cmd.Parameters.Add("@email", SqlDbType.VarChar);
            parametro.Value = admin.EmailAdmin;
            parametro = cmd.Parameters.Add("@idUsuario", SqlDbType.Int);
            parametro.Value = admin.UsuarioAdmin.IdUsuario;
        }

        public bool AgregarAdmin(Administrador admin)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregarAdmin(ref cmd, admin);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "Sp_agregarAdministrador");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }

        public bool existeDNI(int dni)
        {
            String consulta = "select * from Administradores where Dni_A = '" + dni + "'";
            AccesoDatos ac = new AccesoDatos();
            if (ac.Existe(consulta))
            {
                return true;
            }
            return false;
        }
    }
}
