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
    public class NegocioCategoria
    {
        DaoCategoria dao = new DaoCategoria();
        public DataTable getTablaCategoria()
        {
            return dao.getTablaCategoria();
        }

        public DataTable getCategoria(Categoria cat)
        {
            return dao.getCategoria(cat);
        }

        public String getCeldaCategoria(String campo, Categoria cat)
        {
            return dao.getCeldaCategoria(campo, cat);
        }
    }
}
