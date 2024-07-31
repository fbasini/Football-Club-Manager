using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoGruposxSocio
    {
        AccesoDatos datos = new AccesoDatos();
        public DataTable getGruposAnotados(Socios socio)
        {
            DataTable tabla = datos.ObtenerTabla("GruposXSocios", "select gxs.IdGrupoXSocio_GxS, grp.IdGrupo_G, cat.Nombre_C, grp.Descripcion_G, grp.Profesor_G, grp.Horario_G, grp.Arancel_G from grupos as grp inner join gruposxsocios as gxs on grp.IdGrupo_G = gxs.IdGrupo_GxS inner join Socios as scs on scs.IdSocio_S = gxs.IdSocio_GxS inner join Categorias as cat on cat.IdCategoria_C = grp.IdCategoria_G where scs.IdSocio_S = " + socio.IdSocio);
            return tabla;
        }
        public DataTable getTablaCompleta()
        {
            DataTable tabla = datos.ObtenerTabla("GruposXSocios", " SELECT IdGrupo_G as [ID Grupo], Categorias.Nombre_C as [Categoría], Descripcion_G as [Nombre], Profesor_G as [Profesor], Horario_G as [Horario], Arancel_G as [Arancel] FROM Grupos inner join Categorias on Grupos.idCategoria_G = Categorias.idCategoria_C INNER JOIN GruposXSocios ON Grupos.IdGrupo_G = GruposXSocios.IdGrupo_GxS");
            return tabla;
        }

        public void ArmarParametrosGrupoXSocioEliminar(ref SqlCommand comando, int id)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@idgrupo", SqlDbType.Int);
            sqlp.Value = id;
        }

        public bool EliminarGrupo(int id)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosGrupoXSocioEliminar(ref comando, id);
            AccesoDatos ad = new AccesoDatos();
            int filasCambiadasGrupoXSocio = ad.EjecutarProcedimiento(comando, "sp_EliminarGrupoXSocio");

            if (filasCambiadasGrupoXSocio == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public Boolean Inscripto(Grupos grupo, Socios socio)
        {
            String consulta = "select * from GruposXSocios where idsocio_gxs = " + socio.IdSocio + " and idgrupo_gxs = " + grupo.IdGrupo;
            return datos.Existe(consulta);
        }

        private void parametroAgregarGrupoXSocio(ref SqlCommand cmd, Grupos grupo, Socios socio)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@idgrupo", SqlDbType.VarChar);
            parametro.Value = grupo.IdGrupo;
            parametro = cmd.Parameters.Add("@idsocio", SqlDbType.VarChar);
            parametro.Value = socio.IdSocio;
        }
        public bool agregarGrupoXSocio(Grupos grupo, Socios socio)
        {
            SqlCommand cmd = new SqlCommand();
            parametroAgregarGrupoXSocio(ref cmd, grupo, socio);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "sp_AgregarGrupoXSocio");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }

        public DataTable getGruposxID(Socios socio)
        {
            DataTable tabla = datos.ObtenerTabla("Grupos", " SELECT IdGrupo_G as [ID Grupo], Categorias.Nombre_C as [Categoría], Descripcion_G as [Nombre], Profesor_G as [Profesor], Horario_G as [Horario], Arancel_G as [Arancel] FROM Grupos inner join Categorias on Grupos.idCategoria_G = Categorias.idCategoria_C INNER JOIN GruposXSocios ON Grupos.IdGrupo_G = GruposXSocios.IdGrupo_GxS WHERE GruposXSocios.IdSocio_GxS =" + socio.IdSocio);
            return tabla;
        }
    }
}
