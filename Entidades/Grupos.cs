using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Grupos
    {
        private int idGrupo;
        //private int idCategoria;
        private Categoria categoria; // agregado
        private String descripcion;
        private String profesor;
        private String horario;
        private decimal arancel;

        public Grupos()
        {

        }

        public Grupos(int _idGrupo, /*int _idCategoria*/ Categoria _categoria, String _Descripcion, String _ProfesorrolUsuario, String _Horario, decimal _Arancel) 
        {
            idGrupo = _idGrupo;
            categoria = _categoria;
            descripcion = _Descripcion;
            profesor = _ProfesorrolUsuario;
            horario = _Horario;
            arancel = _Arancel;
        }

        public int IdGrupo
        {
            get { return idGrupo; }
            set { idGrupo = value; }
        }

        //public int IdCategoria
        //{
        //    get { return idCategoria; }
        //    set { idCategoria = value; }
        //}

        public Categoria Categoria
        {
            get { return categoria; }
            set { categoria = value; }
        }

        public String Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public String Profesor
        {
            get { return profesor; }
            set { profesor = value; }
        }

        public String Horario
        {
            get { return horario; }
            set { horario = value; }
        }

        public decimal Arancel
        {
            get { return arancel; }
            set { arancel = value; }
        }

    }
}
