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
    public class DaoSocio
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaSocios()
        {
            DataTable tabla = datos.ObtenerTabla("Socios", "select * from Socios");
            return tabla;
        }

        public DataTable getSocio(Socios socio)
        {
            DataTable tabla = datos.ObtenerTabla("Socios", "select * from Socios where idSocio_S= '" + socio.IdSocio + "'");
            return tabla;
        }

        public Socios infoSocioPorID(Socios socio)
        {
            DataTable tabla = new DataTable();
            tabla = getSocio(socio);
            socio.NombreSocio = tabla.Rows[0]["Nombre_S"].ToString();
            socio.ApellidoSocio = tabla.Rows[0]["Apellido_S"].ToString();
            socio.DniSocio = int.Parse(tabla.Rows[0]["Dni_S"].ToString());
            socio.GeneroSocio = tabla.Rows[0]["Genero_S"].ToString();
            socio.NacimientoSocio = tabla.Rows[0]["FechaNacimiento_S"].ToString();
            socio.CiudadSocio = tabla.Rows[0]["Ciudad_S"].ToString();
            socio.DomicilioSocio = tabla.Rows[0]["Domicilio_S"].ToString();
            socio.TelefonoSocio = tabla.Rows[0]["Telefono_S"].ToString();
            socio.EmailSocio = tabla.Rows[0]["Email_S"].ToString();
            return socio;
        }

        public Socios getSocioPorUsuario(Usuarios user)
        {
            Socios socio = new Socios();
            socio.IdSocio = datos.ObtenerId("select idSocio_S from Socios where idUsuario_S= '" + user.IdUsuario + "'");
            return socio;
        }

        
        public int getIDUsuarioSocio(int id_socio)
        {
            int id = datos.ObtenerId("select idUsuario_S from Socios where idSocio_S = '" + id_socio + "'");
            return id;
        }

        public int getIDRespoSocio(int id_socio)
        {
            int id = datos.ObtenerId("select idResponsable_S from Socios where idSocio_S = '" + id_socio + "'");
            return id;
        }

        public String getCeldaSocio(String nombreColumna, Socios socio)
        {
            String celda = datos.ObtenerString("select " + nombreColumna + " from Socios where idSocio_S= '" + socio.IdSocio + "'");
            return celda;
        }

        public void ArmarParametrosSociosEliminar(ref SqlCommand comando, Socios socios)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@IdSocio", SqlDbType.Int);
            sqlp.Value = socios.IdSocio;
        }

        public bool EliminarSocio(Socios socios)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosSociosEliminar(ref comando, socios);
            AccesoDatos ad = new AccesoDatos();
            int filasInsertadas = ad.EjecutarProcedimiento(comando, "sp_EliminarSocio");
            if (filasInsertadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        private void parametroAgregarSocio(ref SqlCommand cmd, Socios socio)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
            parametro.Value = socio.NombreSocio;
            parametro = cmd.Parameters.Add("@apellido", SqlDbType.VarChar);
            parametro.Value = socio.ApellidoSocio;
            parametro = cmd.Parameters.Add("@dni", SqlDbType.Char);
            parametro.Value = socio.DniSocio;
            parametro = cmd.Parameters.Add("@genero", SqlDbType.VarChar);
            parametro.Value = socio.GeneroSocio;
            parametro = cmd.Parameters.Add("@nacimiento", SqlDbType.Date);
            parametro.Value = socio.NacimientoSocio;
            parametro = cmd.Parameters.Add("@ciudad", SqlDbType.VarChar);
            parametro.Value = socio.CiudadSocio;
            parametro = cmd.Parameters.Add("@domicilio", SqlDbType.VarChar);
            parametro.Value = socio.DomicilioSocio;
            parametro = cmd.Parameters.Add("@telefono", SqlDbType.VarChar);
            parametro.Value = socio.TelefonoSocio;
            parametro = cmd.Parameters.Add("@email", SqlDbType.VarChar);
            parametro.Value = socio.EmailSocio;
            parametro = cmd.Parameters.Add("@idResponsable", SqlDbType.Int);
            if (socio.ResponsableSocio.IdResponsable == null) parametro.Value = DBNull.Value;
            parametro = cmd.Parameters.Add("@idUsuario", SqlDbType.Int);
            parametro.Value = socio.UsuarioSocio.IdUsuario;
        }
        public bool agregarSocio(Socios socio)
        {
            SqlCommand cmd = new SqlCommand();
            parametroAgregarSocio(ref cmd, socio);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "Sp_AgregarSocio");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }
        public DataTable getTablaSociosFiltradosPorNombre(Socios socios)
        {
            DataTable tabla = datos.ObtenerTabla("Socios", "select * from Socios where nombre_S like '%" + socios.NombreSocio + "%'");
            return tabla;
        }

        public DataTable getTablaSociosFiltradosPorDni(Socios socios)
        {
            DataTable tabla = datos.ObtenerTabla("Socios", "select * from Socios where dni_S like '%" + socios.DniSocio + "%'");
            return tabla;
        }

        public int buscarIdSocioPorDni(int dni)
        {
            DataTable tabla = datos.ObtenerTabla("Socios", "select * from Socios where dni_S = '" + dni + "'");
            int id = int.Parse(tabla.Rows[0]["IdSocio_S"].ToString());
            return id;
        }

        // si se elimina un socio tambien se tiene que eliminar de estas tablas
        public void ArmarParametrosEliminarRegistroGruposPorSocios(ref SqlCommand comando, Socios socios)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@IdSocio", SqlDbType.Int);
            sqlp.Value = socios.IdSocio;
        }

        public bool EliminarRegistroGruposPorSocios(Socios socios)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosEliminarRegistroGruposPorSocios(ref comando, socios);
            AccesoDatos ad = new AccesoDatos();
            int filasInsertadas = ad.EjecutarProcedimiento(comando, "sp_EliminarRegistroGruposPorSocios");
            if (filasInsertadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public void ArmarParametrosEliminarRegistroPagos(ref SqlCommand comando, Socios socios)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@IdSocio", SqlDbType.Int);
            sqlp.Value = socios.IdSocio;
        }

        public bool EliminarRegistroPagos(Socios socios)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosEliminarRegistroPagos(ref comando, socios);
            AccesoDatos ad = new AccesoDatos();
            int filasInsertadas = ad.EjecutarProcedimiento(comando, "sp_EliminarRegistroPagos");
            if (filasInsertadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        ///////////////////////
        
        public void ArmarParametroModificarSocio(ref SqlCommand cmd, Socios socio)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@idSocio", SqlDbType.Int);
            parametro.Value = socio.IdSocio;
            parametro = cmd.Parameters.Add("@nombre", SqlDbType.VarChar);
            parametro.Value = socio.NombreSocio;
            parametro = cmd.Parameters.Add("@apellido", SqlDbType.VarChar);
            parametro.Value = socio.ApellidoSocio;
            parametro = cmd.Parameters.Add("@dni", SqlDbType.Char);
            parametro.Value = socio.DniSocio;
            parametro = cmd.Parameters.Add("@telefono", SqlDbType.VarChar);
            parametro.Value = socio.TelefonoSocio;
            parametro = cmd.Parameters.Add("@email", SqlDbType.VarChar);
            parametro.Value = socio.EmailSocio;
        }
        
        public bool modificarSocio(Socios socios)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametroModificarSocio(ref cmd, socios);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "Sp_ModificarSocio");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }

        public bool existeId(int id)
        {
            String consulta = "select * from Socios where IdSocio_S = '" + id + "'";
            AccesoDatos ac = new AccesoDatos();
            if(ac.Existe(consulta))
            {
                return true;
            }
            return false;
        }

        public bool existeDNI(int dni)
        {
            String consulta = "select * from Socios where Dni_S = '" + dni + "'";
            AccesoDatos ac = new AccesoDatos();
            if (ac.Existe(consulta))
            {
                return true;
            }
            return false;
        }

        public bool esMenor(Socios socio)
        {
            DateTime fechaNacimiento = DateTime.Parse(socio.NacimientoSocio);

            int edad = DateTime.Today.Year - fechaNacimiento.Year;

            if (DateTime.Today < fechaNacimiento.AddYears(edad))
            {
                edad--;
            }

            return edad < 18; 
        }

        public void parametroAgregarIdResponsable(ref SqlCommand cmd, Socios socio)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@idSocio", SqlDbType.Int);
            parametro.Value = socio.IdSocio;
            parametro = cmd.Parameters.Add("@idResponsable", SqlDbType.Int);
            parametro.Value = socio.ResponsableSocio.IdResponsable;
        }

        public bool agregarIdResponsableAlSocio(Socios socio)
        {
            SqlCommand cmd = new SqlCommand();
            parametroAgregarIdResponsable(ref cmd, socio);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "Sp_AgregarIdResponsable");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }
    }
}