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
    public partial class MenuPrincipalAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioUsuarios negU = new NegocioUsuarios();
            Usuarios user = new Usuarios();

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

        protected void btnSocios_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-ListadoSocios.aspx");
        }

        protected void btnInscripcionSocios_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-RegistrarSocio.aspx");
        }

        protected void btnGrupos_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-Grupos.aspx");
        }

        protected void btnPagos_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-RegistrarPagos.aspx");
        }

        protected void btnRegistrarAdmin_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-RegistrarAdmin.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        protected void btnReportes_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-InformesAdmin.aspx");
        }
    }
}