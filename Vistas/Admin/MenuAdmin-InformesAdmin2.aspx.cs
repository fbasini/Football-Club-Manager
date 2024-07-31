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
    public partial class MenuAdmin_InformesAdmin2 : System.Web.UI.Page
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
                cargarGridView();
            }
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-InformesAdmin.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        protected void cargarGridView()
        {
            NegocioPagos negP = new NegocioPagos();
            grdInforme.DataSource = negP.getInformePorFecha((string)Application["fechaInicial"], (string)Application["FechaFinal"]);
            grdInforme.DataBind();
        }

        protected void btnGenerarOtroInforme_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-InformesAdmin.aspx");
        }
    }
}