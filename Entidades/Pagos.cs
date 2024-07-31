using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Pagos
    {
        private int IdPago_P;
        private Socios socio_P;
        private float Monto_P;
        private string Fecha_P;

        public Pagos()
        {

        }

        public Pagos(Socios socio, float monto, string fecha)
        {
            socio_P = socio;
            Monto_P = monto;
            Fecha_P = fecha;
        }

        public int IdPagoP { get => IdPago_P; set => IdPago_P = value; }
        public Socios Socio_P { get => socio_P; set => socio_P = value; }
        public float MontoP { get => Monto_P; set => Monto_P = value; }
        public string FechaP { get => Fecha_P; set => Fecha_P = value; }

    }
}
