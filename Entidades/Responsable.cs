using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Responsable
    {
        private int? idResponsable;
        private string nombreResponsable;
        private string apellidoResponsable;
        private int dniResponsable;
        private string generoResponsable;
        private string telefonoResponsable;
        private Socios socioResponsable;

        public Responsable()
        {

        }
        public Responsable(string nombre, string apellido, int dni, string genero, string telefono, Socios socio)
        {
            nombreResponsable = nombre;
            apellidoResponsable = apellido;
            dniResponsable = dni;
            generoResponsable = genero;
            telefonoResponsable = telefono;
            socioResponsable = socio;
        }

        public int? IdResponsable { get => idResponsable; set => idResponsable = value; }
        public string NombreResponsable { get => nombreResponsable; set => nombreResponsable = value; }
        public string ApellidoResponsable { get => apellidoResponsable; set => apellidoResponsable = value; }
        public int DniResponsable { get => dniResponsable; set => dniResponsable = value; }
        public string GeneroResponsable { get => generoResponsable; set => generoResponsable = value; }
        public string TelefonoResponsable { get => telefonoResponsable; set => telefonoResponsable = value; }
        public Socios SocioResponsable { get => socioResponsable; set => socioResponsable = value; }
    }
}
