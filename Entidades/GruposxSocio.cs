using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class GruposxSocio
    {
        private int id_GXS;
        private int socio_GXS;
        private int grupo_GXS;

        public GruposxSocio()
        {
        }

        public GruposxSocio(int id_GXS, int socio_GXS, int grupo_GXS)
        {
            this.id_GXS = id_GXS;
            this.socio_GXS = socio_GXS;
            this.grupo_GXS = grupo_GXS;
        }

        public int Id_GXS { get => id_GXS; set => id_GXS = value; }
        public int Socio_GXS { get => socio_GXS; set => socio_GXS = value; }
        public int Grupo_GXS { get => grupo_GXS; set => grupo_GXS = value; }
    }
}
