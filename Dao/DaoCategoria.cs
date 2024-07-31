using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using System.Data;

namespace Dao
{
    public class DaoCategoria
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaCategoria()
        {
            DataTable tabla = datos.ObtenerTabla("Categorias", "select * from Categorias");
            return tabla;
        }

        public DataTable getCategoria(Categoria cat)
        {
            DataTable tabla = datos.ObtenerTabla("Categorias", "select * from Categorias where idcategoria_C= '" + cat.IdCategoria + "'");
            return tabla;
        }

        public String getCeldaCategoria(String nombreColumna, Categoria cat)
        {
            String celda = datos.ObtenerString("select " + nombreColumna + " from Categorias where idCategoria_C= '" + cat.IdCategoria + "'");
            return celda;
        }
    }
}
