using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Net;

namespace Dao
{
    public class DaoUsuario
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaUsuarios()
        {
            DataTable tabla = datos.ObtenerTabla("Usuarios", "select * from Usuarios");
            return tabla;
        }
        public DataTable getUsuario(Usuarios user)
        {
            DataTable tabla = datos.ObtenerTabla("Usuarios", "select * from Usuarios where idUsuario_U= '" + user.IdUsuario + "'");
            return tabla;
        }
        public Usuarios getUsuarioPorIdSocio(Usuarios user)
        {
            DataTable tabla = new DataTable();
            tabla = getUsuario(user);
            user.NombreUsuario = tabla.Rows[0]["Nombre_U"].ToString();
            user.ContraseñaUsuario = tabla.Rows[0]["Contraseña_U"].ToString();
            user.RolUsuario = bool.Parse(tabla.Rows[0]["Rol_U"].ToString());
            user.IdUsuario = int.Parse(tabla.Rows[0]["IdSocio_U"].ToString());
            return user;
        }
        public Usuarios getUsuarioId(Usuarios oldUser)
        {
            Usuarios updateUser = new Usuarios();
            int id = datos.ObtenerId("select idusuario_U from Usuarios where nombre_U= '" + oldUser.NombreUsuario + "'");
            updateUser = oldUser;
            updateUser.IdUsuario = id;
            return updateUser;
        }

        public String getCeldaUsuario(String nombreColumna, Usuarios user)
        {
            String celda = datos.ObtenerString("select " + nombreColumna + " from Usuarios where idUsuario_U= '" + user.IdUsuario + "'");
            return celda;
        }

        public Boolean ExisteUsuario(Usuarios user)
        {
            String consulta = "select * from Usuarios where Nombre_U = '" + user.NombreUsuario + "'";
            return datos.Existe(consulta);
        }

        public Boolean Login(Usuarios user)
        {
            String consulta = "select * from Usuarios where Nombre_U = '" + user.NombreUsuario + "' and Contraseña_U = '" + user.ContraseñaUsuario + "'";
            return datos.Existe(consulta);
        }

        public Boolean ObtenerRolUsuario(Usuarios user)
        {
            String consulta = "select Rol_U from Usuarios where Nombre_U = '" + user.NombreUsuario + "'";
            return datos.ObtenerRol(consulta);
        }
        private void parametroAgregarUsuario(ref SqlCommand cmd, Usuarios us)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
            parametro.Value = us.NombreUsuario;
            parametro = cmd.Parameters.Add("@contraseña", SqlDbType.VarChar);
            parametro.Value = us.ContraseñaUsuario;
            parametro = cmd.Parameters.Add("@rol", SqlDbType.Bit);
            parametro.Value = us.RolUsuario;
        }
        public bool agregarUsuario(Usuarios us)
        {
            SqlCommand cmd = new SqlCommand();
            parametroAgregarUsuario(ref cmd, us);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "Sp_AgregarUsuario");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }
        public int getIdPorNombre(string nombre)
        {
            DataTable tabla = datos.ObtenerTabla("Usuarios", "select * from Usuarios where Nombre_U = '" + nombre + "'");
            int id = int.Parse(tabla.Rows[0]["IdUsuario_U"].ToString());
            return id;
        }

        public int getUltimoIdUsuario() 
        {
            String consulta = "select max(IdUsuario_U) from Usuarios";
            return datos.ObtenerUltimoId(consulta);
        }

        public bool existeNombreUsuario(string nombreUsuario)
        {
            String consulta = "select * from Usuarios where Nombre_U = '" + nombreUsuario + "'";
            AccesoDatos ac = new AccesoDatos();
            if (ac.Existe(consulta))
            {
                return true;
            }
            return false;
        }

        public string getContraseñaUsuario(string nombreUsuario)
        {
            String consulta = datos.ObtenerString("select Contraseña_U from Usuarios where Nombre_U = '" + nombreUsuario + "'");
            return consulta;
        }


        public void ArmarParametroModificarContraseña(ref SqlCommand cmd, Usuarios user)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@idUsuario", SqlDbType.Int);
            parametro.Value = user.IdUsuario;
            parametro = cmd.Parameters.Add("@contraseña", SqlDbType.VarChar);
            parametro.Value = user.ContraseñaUsuario;
        }

        public bool ModificarContraseña(Usuarios user)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametroModificarContraseña(ref cmd, user);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "sp_ModificarContraseña");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }
    }
}

