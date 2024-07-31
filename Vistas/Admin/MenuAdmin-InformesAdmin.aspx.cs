using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas.Admin
{
    public partial class MenuAdmin_InformesAdmin : System.Web.UI.Page
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
            Server.Transfer("/Admin/MenuAdmin-Principal.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        protected void btnGenerarInforme_Click(object sender, EventArgs e)
        {
            string fechaInicial, fechaFinal;
            fechaInicial = txtFechaOrigenAño.Text.Trim() + "-" +txtFechaOrigenMes.Text.Trim() + "-" + txtFechaOrigenDia.Text.Trim();
            fechaFinal = txtFechaFinalAño.Text.Trim() + "-" + txtFechaFinalMes.Text.Trim() + "-" + txtFechaFinalDia.Text.Trim();
            Application["fechaInicial"] = fechaInicial;
            Application["fechaFinal"] = fechaFinal;
            Server.Transfer("/Admin/MenuAdmin-InformesAdmin2.aspx");
        }
    }
}