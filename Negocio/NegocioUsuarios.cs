using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;
using System.Net;
using System.Security.Policy;

namespace Negocio
{
    public class NegocioUsuarios
    {
        DaoUsuario dao = new DaoUsuario();

        public DataTable getTablaCompleta()
        {
            return dao.getTablaUsuarios();
        }

        public DataTable getUsuario(Usuarios user)
        {
            return dao.getUsuario(user);
        }

        public Usuarios getUsuarioId(Usuarios user)
        {
            return dao.getUsuarioId(user);
        }
        
        public Usuarios getUsuarioPorIdSocio(Usuarios user)
        {
            return dao.getUsuarioPorIdSocio(user);
        }

        public String getCeldaUsuario(String campo, Usuarios user)
        {
            return dao.getCeldaUsuario(campo, user);
        }

        public Boolean ExisteUsuario(Usuarios user)
        {
            bool existe = dao.ExisteUsuario(user);
            if (existe) return true;
            return false;
        }

        public Boolean LoginCheck(Usuarios user)
        {
            bool existe = dao.Login(user);
            if (existe) return true;
            return false;
        }

        public Boolean ObtenerRolUsuario(Usuarios user)
        {
            bool rol = dao.ObtenerRolUsuario(user);
            return rol;
        }
        public bool agregarUsuario(Usuarios us)
        {
            return dao.agregarUsuario(us);
        }
        public int getIdPorNombre(string nombre)
        {
            return dao.getIdPorNombre(nombre);
        }

        public int getUltimoIdUsuario()
        {
            return dao.getUltimoIdUsuario();
        }

        public bool existeNombreUsuario(string nombreUsuario)
        {
            DaoUsuario dao = new DaoUsuario();
            return dao.existeNombreUsuario(nombreUsuario);
        }

        public string getContraseñaUsuario(string nombreUsuario)
        {
            return dao.getContraseñaUsuario(nombreUsuario);
        }

        public bool ModificarContraseña(Usuarios user)
        {
            DaoUsuario dao = new DaoUsuario();
            return dao.ModificarContraseña(user);
        }
    }
}
