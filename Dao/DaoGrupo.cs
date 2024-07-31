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
    public class DaoGrupo
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaGrupos()
        {
            DataTable tabla = datos.ObtenerTabla("Grupos", "select * from Grupos");
            return tabla;
        }

        public DataTable getTablaGruposConCategorias()
        {
            DataTable tabla = datos.ObtenerTabla("Grupos", "select * from Grupos inner join Categorias on Grupos.idCategoria_G = Categorias.idCategoria_C");
            return tabla;
        }

        public DataTable getGrupo(Grupos grupo)
        {
            DataTable tabla = datos.ObtenerTabla("Grupos", "select * from Grupos where idGrupo_G= '" + grupo.IdGrupo + "'");
            return tabla;
        }

        public String getCeldaGrupo(String nombreColumna, Grupos grupo)
        {
            String celda = datos.ObtenerString("select " + nombreColumna + " from Grupos where idGrupo_G= '" + grupo.IdGrupo + "'");
            return celda;
        }

        public void ArmarParametrosGrupoEliminar(ref SqlCommand comando, Grupos grupo)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@idGrupo", SqlDbType.Int);
            sqlp.Value = grupo.IdGrupo;
        }

        public void ArmarParametrosGrupoActualizar(ref SqlCommand comando, Grupos grupo)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@idGrupo", SqlDbType.Int);
            sqlp.Value = grupo.IdGrupo;
            sqlp = comando.Parameters.Add("@descripcion", SqlDbType.VarChar);
            sqlp.Value = grupo.Descripcion;
            sqlp = comando.Parameters.Add("@profresor", SqlDbType.VarChar);
            sqlp.Value = grupo.Profesor;
            sqlp = comando.Parameters.Add("@horario", SqlDbType.VarChar);
            sqlp.Value = grupo.Horario;
            sqlp = comando.Parameters.Add("@arancel", SqlDbType.Decimal);
            sqlp.Value = grupo.Arancel;
        }

        public void ArmarParametrosGrupoAgregar(ref SqlCommand comando, Grupos grupo)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@idCategoria", SqlDbType.Int);
            //sqlp.Value = grupo.IdCategoria;
            sqlp.Value = grupo.Categoria.IdCategoria;
            sqlp = comando.Parameters.Add("@descripcion", SqlDbType.VarChar);
            sqlp.Value = grupo.Descripcion;
            sqlp = comando.Parameters.Add("@profresor", SqlDbType.VarChar);
            sqlp.Value = grupo.Profesor;
            sqlp = comando.Parameters.Add("@horario", SqlDbType.VarChar);
            sqlp.Value = grupo.Horario;
            sqlp = comando.Parameters.Add("@arancel", SqlDbType.Decimal);
            sqlp.Value = grupo.Arancel;
        }

        public bool EliminarGrupo(Grupos grupo)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosGrupoEliminar(ref comando, grupo);
            AccesoDatos ad = new AccesoDatos();
            int filasCambiadasGrupoXSocio = ad.EjecutarProcedimiento(comando, "sp_EliminarGrupoXSocio");
            int filasCambiadasGrupo = ad.EjecutarProcedimiento(comando, "sp_EliminarGrupo");

            if (filasCambiadasGrupo == 1 && filasCambiadasGrupoXSocio == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool ActualizarGrupo(Grupos grupo)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosGrupoActualizar(ref comando, grupo);
            AccesoDatos ad = new AccesoDatos();
            int filasCambiadasGrupo = ad.EjecutarProcedimiento(comando, "sp_ModificarGrupo");

            if (filasCambiadasGrupo == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool AgregarGrupo(Grupos grupo)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosGrupoAgregar(ref comando, grupo);
            AccesoDatos ad = new AccesoDatos();
            int filasCambiadasGrupo = ad.EjecutarProcedimiento(comando, "sp_AgregarGrupo");

            if (filasCambiadasGrupo == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public DataTable getTablaSociosFiltradosPorNombre(Grupos grupo)
        {
            DataTable tabla = datos.ObtenerTabla("Grupos", "select * from Grupos where descripcion_G like '%" + grupo.Descripcion + "%'");
            return tabla;
        }

        public DataTable getTablaSociosFiltradosPorHorario(Grupos grupo)
        {
            DataTable tabla = datos.ObtenerTabla("Grupos", "select * from Grupos where horario_G like '%" + grupo.Horario + "%'");
            return tabla;
        }

        public bool existeGrupo(string descripcion)
        {
            string consulta = "select * from Grupos where descripcion_G = '" + descripcion + "'";
            AccesoDatos ac = new AccesoDatos();

            if (ac.Existe(consulta))
            {
                return true;
            }
            return false;
        }

        public DataTable getTablaGruposFiltradosPorCategoria(Grupos grupo)
        {
            DataTable tabla = datos.ObtenerTabla("Grupos", "select * from Grupos where idCategoria_G = '" + grupo.Categoria.IdCategoria + "'");
            return tabla;
        }
    }
}
