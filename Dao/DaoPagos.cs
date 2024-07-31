using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoPagos
    {
        AccesoDatos datos = new AccesoDatos();

        public DataTable getTablaPagos()
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select * from Pagos");
            return tabla;
        }

        public DataTable getPago(Pagos pago)
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select * from Pagos where Id_Pago_P= '" + pago.IdPagoP + "'");
            return tabla;
        }

        public String getCeldaPagos(String nombreColumna, Pagos pago)
        {
            String celda = datos.ObtenerString("select " + nombreColumna + " from Pagos where idPago_P= '" + pago.IdPagoP + "'");
            return celda;
        }

        public void ArmarParametrosPagosEliminar(ref SqlCommand comando, Pagos pago)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@IdPago_P", SqlDbType.Int);
            sqlp.Value = pago.IdPagoP;
        }

        public void ArmarParametrosPagosActualizar(ref SqlCommand comando, Pagos pago)
        {
            SqlParameter sqlp = new SqlParameter();
            sqlp = comando.Parameters.Add("@IdPago_P", SqlDbType.Int);
            sqlp.Value = pago.IdPagoP;
            sqlp = comando.Parameters.Add("@IdSocio_P", SqlDbType.Int);
            sqlp.Value = pago.Socio_P.IdSocio;
            sqlp = comando.Parameters.Add("@Monto_P", SqlDbType.Float);
            sqlp.Value = pago.MontoP;
            sqlp = comando.Parameters.Add("@Fecha_P", SqlDbType.VarChar);
            sqlp.Value = pago.FechaP;
        }
        public bool EliminarPago(Pagos pago)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosPagosEliminar(ref comando, pago);
            AccesoDatos ad = new AccesoDatos();
            int filasInsertadas = ad.EjecutarProcedimiento(comando, "sp_EliminarPago");
            if (filasInsertadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool ActualizarPagos(Pagos pago)
        {

            SqlCommand comando = new SqlCommand();
            ArmarParametrosPagosActualizar(ref comando, pago);
            AccesoDatos ad = new AccesoDatos();
            int filasCambiadas = ad.EjecutarProcedimiento(comando, "sp_ModificarPago");

            if (filasCambiadas == 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public DataTable getPagoPorIdSocio(Socios socio)
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select IdPago_P as [ID Pago], Monto_P as [Monto], Fecha_P as [Fecha] from Pagos where IdSocio_P = '" + socio.IdSocio + "'");
            return tabla;
        }

        public DataTable pagoSocioOrdenarPorFecha(Socios socio)
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select IdPago_P AS [ID Pago], Monto_P AS [Monto], Fecha_P AS [Fecha] from Pagos where IdSocio_P = '" + socio.IdSocio + "' ORDER BY Fecha_P DESC");
            return tabla;
        }

        public DataTable pagoSocioOrdenarPorMonto(Socios socio)
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select IdPago_P AS [ID Pago], Monto_P AS [Monto], Fecha_P AS [Fecha] from Pagos where IdSocio_P = '" + socio.IdSocio + "' ORDER BY Monto_P DESC");
            return tabla;
        }

        public DataTable getPagoPorFecha(string fecha)
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select * from Pagos where Fecha_P like '%" + fecha + "%'");
            return tabla;
        }

        public DataTable getInformePorFecha(string fechaInicial, string fechaFinal)
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select * from Pagos where Fecha_P >= '" + fechaInicial + "' and Fecha_P <= '" + fechaFinal + "'");
            return tabla;
        }

        public DataTable ordenarPorFecha()
        {
            DataTable tabla = datos.ObtenerTabla("Pagos", "select * FROM Pagos ORDER BY Fecha_P DESC ");
            return tabla;
        }

        private void parametroAgregarPago(ref SqlCommand cmd, Pagos pago)
        {
            SqlParameter parametro = new SqlParameter();
            parametro = cmd.Parameters.Add("@Id_Socio", SqlDbType.Int);
            parametro.Value = pago.Socio_P.IdSocio;
            parametro = cmd.Parameters.Add("@Monto_P", SqlDbType.Float);
            parametro.Value = pago.MontoP;
            parametro = cmd.Parameters.Add("@Fecha_P", SqlDbType.VarChar);
            parametro.Value = pago.FechaP;
        }
        public bool agregarPago(Pagos pago)
        {
            SqlCommand cmd = new SqlCommand();
            parametroAgregarPago(ref cmd, pago);
            int cantFilas = datos.EjecutarProcedimiento(cmd, "Sp_AgregarPago");
            if (cantFilas == 1)
            {
                return true;
            }
            return false;
        }
    }
}
