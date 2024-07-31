using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas.Socio
{
    public partial class MenuSocio_Principal : System.Web.UI.Page
    {

        NegocioUsuarios negU = new NegocioUsuarios();
        Usuarios user = new Usuarios();
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
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        protected void btnGrupos_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Socio/MenuSocio-Grupos.aspx");
        }

        protected void btnPagos_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Socio/MenuSocio-Pagos.aspx");
        }

        protected void btnDatos_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Socio/MenuSocio-Datos.aspx");
        }
    }
}