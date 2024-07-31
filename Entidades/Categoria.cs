using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Categoria
    {
        private int idCategoria;
        private String nombre;

        public Categoria()
        {

        }

        public Categoria(int _idCategoria, String _nombre)
        {
            idCategoria = _idCategoria;
            nombre = _nombre;
        }

        public int IdCategoria
        {
            get { return idCategoria; }
            set { idCategoria = value; }
        }

        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

    }
}
