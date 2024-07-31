using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;



namespace Vistas.Socio
{
    public partial class MenuSocio_Pagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Socio/MenuSocio-Principal.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        protected void cargarGridView()
        {
            NegocioPagos negP = new NegocioPagos();
            Socios socio = new Socios();
            socio = (Socios)Session["socio"];
            grdPagos.DataSource = negP.getPagoPorIdSocio(socio);
            grdPagos.DataBind();
        }

        protected void grdPagos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdPagos.PageIndex = e.NewPageIndex;
            cargarGridView();
        }

        protected void btnOrdenarPorFecha_Click(object sender, EventArgs e)
        {
            NegocioPagos negP = new NegocioPagos();
            Socios socio = new Socios();
            socio = (Socios)Session["socio"];
            grdPagos.DataSource = negP.pagoSocioOrdenarPorFecha(socio);
            grdPagos.DataBind();
        }

        protected void btnOrdenarPorMonto_Click(object sender, EventArgs e)
        {
            NegocioPagos negP = new NegocioPagos();
            Socios socio = new Socios();
            socio = (Socios)Session["socio"];
            grdPagos.DataSource = negP.pagoSocioOrdenarPorMonto(socio);
            grdPagos.DataBind();
        }

        protected void btnRestaurar_Click(object sender, EventArgs e)
        {
            cargarGridView();
        }
    }
}