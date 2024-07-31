using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Administrador
    {
        private int idAdmin;
        private string nombreAdmin;
        private string apellidoAdmin;
        private int dniAdmin;
        private string telefonoAdmin;
        private string emailAdmin;
        private Usuarios usuarioAdmin;

        public Administrador()
        {

        }
        public Administrador(string nombre, string apellido, int dni, string telefono, string email, Usuarios usuario)
        {
            nombreAdmin = nombre;
            apellidoAdmin = apellido;
            dniAdmin = dni;
            telefonoAdmin = telefono;
            emailAdmin = email;
            usuarioAdmin = usuario;
        }

        public int IdAdmin { get => idAdmin; set => idAdmin = value; }
        public string NombreAdmin { get => nombreAdmin; set => nombreAdmin = value; }
        public string ApellidoAdmin { get => apellidoAdmin; set => apellidoAdmin = value; }
        public int DniAdmin { get => dniAdmin; set => dniAdmin = value; }
        public string TelefonoAdmin { get => telefonoAdmin; set => telefonoAdmin = value; }
        public string EmailAdmin { get => emailAdmin; set => emailAdmin = value; }
        public Usuarios UsuarioAdmin { get => usuarioAdmin; set => usuarioAdmin = value; }
    }
}
