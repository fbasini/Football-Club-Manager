using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas.Admin
{
    public partial class MenuAdmin_RegistrarPagos2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                if (Session["userName"] == null)
                {
                    Server.Transfer("/Login/Login.aspx");
                }
                else
                {
                    lblUsuario.Text = Session["userName"].ToString();
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-RegistrarPagos.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            NegocioPagos neg = new NegocioPagos();
            NegocioSocios negS = new NegocioSocios();
            Pagos pago = new Pagos();
            int IdSocio = Convert.ToInt32(txtIdSocio.Text.Trim());

            if (negS.existeId(IdSocio))
            {
                pago.Socio_P = new Socios();
                pago.Socio_P.IdSocio = IdSocio;
                pago.MontoP = float.Parse(txtMonto.Text.Trim());
                string dia = txtDia.Text.Trim();
                string mes = ddlMes.SelectedValue;
                string año = txtAnio.Text.Trim();
                pago.FechaP = año + "-" + mes + "-" + dia;
                neg.agregarPago(pago);
                vaciarCampos();

                lblMensaje.Text = "El pago se ha registrado correctamente.";
                return;
            }
            lblMensaje.Text = "El ID ingresado no se encuentra entre los Socios registrados.";
            vaciarCampos();
        }

        protected void vaciarCampos()
        {
            txtDia.Text = "";
            ddlMes.SelectedIndex = 0;
            txtAnio.Text = "";
            txtIdSocio.Text = "";
            txtMonto.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            vaciarCampos();
            Server.Transfer("/Admin/MenuAdmin-RegistrarPagos.aspx");
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            vaciarCampos();
        }
    }
}