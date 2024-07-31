using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioPagos
    {
        DaoPagos dao = new DaoPagos();

        public DataTable getTablaCompleta()
        {
            return dao.getTablaPagos();
        }
        public DataTable getPago(Pagos pago)
        {
            return dao.getPago(pago);
        }

        public String getCeldaPagos(String campo, Pagos pago)
        {
            return dao.getCeldaPagos(campo, pago);
        }

        public void EliminarPago(Pagos pago)
        {
            dao.EliminarPago(pago);
        }

        public DataTable getPagoPorIdSocio(Socios socio)
        {
            return dao.getPagoPorIdSocio(socio);
        }

        public DataTable getPagoPorFecha(string fecha)
        {
            DataTable tabla = dao.getPagoPorFecha(fecha);
            return tabla;
        }

        public DataTable getInformePorFecha(string fechaInicial, string fechaFinal)
        {
            DataTable tabla = dao.getInformePorFecha(fechaInicial, fechaFinal);
            return tabla;
        }

        public void ActualizarPago(Pagos pago)
        {
            dao.ActualizarPagos(pago);
        }

        public DataTable ordenarPorFecha()
        {
            DataTable tabla = dao.ordenarPorFecha();
            return tabla;
        }

        public bool agregarPago(Pagos pago)
        {
            DaoPagos dao = new DaoPagos();
            return dao.agregarPago(pago);
        }

        public DataTable pagoSocioOrdenarPorFecha(Socios socio)
        {
            return dao.pagoSocioOrdenarPorFecha(socio);
        }

        public DataTable pagoSocioOrdenarPorMonto(Socios socio)
        {
            return dao.pagoSocioOrdenarPorMonto(socio);
        }
    }
}
