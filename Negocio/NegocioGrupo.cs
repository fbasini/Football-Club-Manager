using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;


namespace Negocio
{
    public class NegocioGrupo
    {
        DaoGrupo dao = new DaoGrupo();

        public DataTable getTablaCompleta()
        {
            return dao.getTablaGrupos();
        }
        public DataTable getTablaGruposConCategorias()
        {
            return dao.getTablaGruposConCategorias();
        }

        public DataTable getGrupo(Grupos grupo)
        {
            return dao.getGrupo(grupo);
        }

        public String getCeldaGrupo(String campo, Grupos grupo)
        {
            return dao.getCeldaGrupo(campo, grupo);
        }

        public void EliminarGrupo(Grupos grupo)
        {
            dao.EliminarGrupo(grupo);
        }

        public void ActualizarGrupo(Grupos grupo)
        {
            dao.ActualizarGrupo(grupo);
        }

        public void AgregarGrupo(Grupos grupo)
        {
            dao.AgregarGrupo(grupo);
        }

        public DataTable getTablaSociosFiltradosPorNombre(Grupos grupo)
        {
            return dao.getTablaSociosFiltradosPorNombre(grupo);
        }

        public DataTable getTablaSociosFiltradosPorHorario(Grupos grupo)
        {
            return dao.getTablaSociosFiltradosPorHorario(grupo);
        }

        public bool existeGrupo(string descripcion)
        {
            return dao.existeGrupo(descripcion);
        }

        public DataTable getTablaGruposFiltradosPorCategoria(Grupos grupo)
        {
            return dao.getTablaGruposFiltradosPorCategoria(grupo);
        }
    }
}

