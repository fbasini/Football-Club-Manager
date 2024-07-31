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
    public partial class MenuAdmin_RegistrarPagos : System.Web.UI.Page
    {
        NegocioPagos neg = new NegocioPagos();
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
            cargarGridView();
            lblMensaje.Visible = false;
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-Principal.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        protected void btnVerTodos_Click(object sender, EventArgs e)
        {
            cargarGridView();
            vaciarCampos();
        }

        protected void btnBuscarDni_Click(object sender, EventArgs e)
        {
            if (txtBuscadorDni.Text.Trim() != "")
            {
                Negocio.NegocioSocios negS = new NegocioSocios();
                Socios socio = new Socios();
                socio.DniSocio = Convert.ToInt32(txtBuscadorDni.Text.Trim());
                socio.IdSocio = negS.buscarIdSocioPorDni(socio.DniSocio);
                grdPagos.DataSource = neg.getPagoPorIdSocio(socio);
                grdPagos.DataBind();
            }
            
            vaciarCampos();
            lblMensaje.Visible = false;
        }


        protected void btnBuscarFecha_Click(object sender, EventArgs e)
        {
            string fecha = txtBuscadorFecha.Text.Trim();
            grdPagos.DataSource = neg.getPagoPorFecha(fecha);
            grdPagos.DataBind();

            vaciarCampos();
            lblMensaje.Visible = false;
        }

        private void cargarGridView()
        {
            grdPagos.DataSource = neg.getTablaCompleta();
            grdPagos.DataBind();
        }

        protected void grdPagos_RowCommand(object sender, GridViewCommandEventArgs e)
        {



        }

        protected void grdPagos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdPagos.EditIndex = e.NewEditIndex;
            cargarGridView();

            lblMensaje.Visible = false;
        }

        protected void grdPagos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdPagos.EditIndex = -1;
            cargarGridView();
        }

        protected void grdPagos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Pagos pago = new Pagos();

            String s_idPago = ((Label)grdPagos.Rows[e.RowIndex].FindControl("lbl_it_idPago")).Text;
            pago.IdPagoP = Convert.ToInt32(s_idPago);

            neg.EliminarPago(pago);

            grdPagos.EditIndex = -1;
            cargarGridView();

            lblMensaje.Text = "El registro se ha eliminado con éxito.";
            lblMensaje.Visible = true;
        }

        protected void grdPagos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Pagos pago = new Pagos();
            Socios socio = new Socios();
            NegocioSocios negS = new NegocioSocios();

            String p_idPago = ((Label)grdPagos.Rows[e.RowIndex].FindControl("lbl_eit_idPago")).Text;
            String p_idSocio = ((TextBox)grdPagos.Rows[e.RowIndex].FindControl("txt_eit_idSocio")).Text;
            String p_monto = ((TextBox)grdPagos.Rows[e.RowIndex].FindControl("txt_eit_monto")).Text;
            String p_fecha = ((TextBox)grdPagos.Rows[e.RowIndex].FindControl("txt_eit_fechaPago")).Text;

            socio.IdSocio = Convert.ToInt32(p_idSocio);

            pago.IdPagoP = Convert.ToInt32(p_idPago);
            pago.Socio_P = socio;
            pago.MontoP = float.Parse(p_monto);
            pago.FechaP = p_fecha;

            neg.ActualizarPago(pago);

            grdPagos.EditIndex = -1;
            cargarGridView();

            lblMensaje.Text = "El registro se ha editado con éxito.";
            lblMensaje.Visible = true;
        }

        protected void vaciarCampos()
        {
            txtBuscadorDni.Text = "";
            txtBuscadorFecha.Text = "";
        }

        protected void btnOrdenarPorFecha_Click(object sender, EventArgs e)
        {
            grdPagos.DataSource = neg.ordenarPorFecha();
            grdPagos.DataBind();
        }

        protected void btnAgregarPago_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-RegistrarPagos2.aspx");
        }

        protected void grdPagos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPagos.PageIndex = e.NewPageIndex;
            cargarGridView();

            lblMensaje.Visible = false;
        }
    }
}