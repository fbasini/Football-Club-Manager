using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        private int idUsuario;
        private String nombreUsuario;
        private String contraseñaUsuario;
        private bool rolUsuario;

        public Usuarios()
        {

        }

        public Usuarios(int _idUsuario, String _nombreUsuario, String _contraseñaUsuario, bool _rolUsuario)
        {
            idUsuario = _idUsuario;
            nombreUsuario = _nombreUsuario;
            contraseñaUsuario = _contraseñaUsuario;
            rolUsuario = _rolUsuario;
        }

        public int IdUsuario
        {
            get { return idUsuario; }
            set { idUsuario = value; }
        }

        public String NombreUsuario
        {
            get { return nombreUsuario; }
            set { nombreUsuario = value; }
        }

        public String ContraseñaUsuario
        {
            get { return contraseñaUsuario; }
            set { contraseñaUsuario = value; }
        }

        public bool RolUsuario
        {
            get { return rolUsuario; }
            set { rolUsuario = value; }
        }
    }
}
