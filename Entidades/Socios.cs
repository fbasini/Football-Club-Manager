using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Socios
    {
        private int idSocio;
        private string nombreSocio;
        private string apellidoSocio;
        private int dniSocio;
        private string generoSocio;
        private string nacimientoSocio;
        private string ciudadSocio;
        private string domicilioSocio;
        private string telefonoSocio;
        private string emailSocio;
        private Grupos grupoSocio;
        private Usuarios usuarioSocio;
        private Responsable responsableSocio;

        public Socios()
        {

        }

        public Socios(string nombre, string apellido, int dni, string genero, string nacimiento, string ciudad, string domicilio, string telefono, string email, Grupos grupo, Usuarios usuario, Responsable responsable)
        {
            nombreSocio = nombre;
            apellidoSocio = apellido;
            dniSocio = dni;
            generoSocio = genero;
            nacimientoSocio = nacimiento;
            ciudadSocio = ciudad;
            domicilioSocio = domicilio;
            telefonoSocio = telefono;
            emailSocio = email;
            grupoSocio = grupo;
            usuarioSocio = usuario;
            responsableSocio = responsable;
        }

        public int IdSocio { get => idSocio; set => idSocio = value; }
        public string NombreSocio { get => nombreSocio; set => nombreSocio = value; }
        public string ApellidoSocio { get => apellidoSocio; set => apellidoSocio = value; }
        public int DniSocio { get => dniSocio; set => dniSocio = value; }
        public string GeneroSocio { get => generoSocio; set => generoSocio = value; }
        public string NacimientoSocio { get => nacimientoSocio; set => nacimientoSocio = value; }
        public string CiudadSocio { get => ciudadSocio; set => ciudadSocio = value; }
        public string DomicilioSocio { get => domicilioSocio; set => domicilioSocio = value; }
        public string TelefonoSocio { get => telefonoSocio; set => telefonoSocio = value; }
        public string EmailSocio { get => emailSocio; set => emailSocio = value; }
        public Grupos GrupoSocio { get => grupoSocio; set => grupoSocio = value; }
        public Usuarios UsuarioSocio { get => usuarioSocio; set => usuarioSocio = value; }
        public Responsable ResponsableSocio { get => responsableSocio; set => responsableSocio = value; }
    }
}
