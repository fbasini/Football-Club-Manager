using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            
            string nombreUsuario = txtUsuario.Text;
            string contraseña = txtContrasena.Text;

            NegocioUsuarios negU = new NegocioUsuarios();
            Usuarios user = new Usuarios
            {
                NombreUsuario = nombreUsuario,
                ContraseñaUsuario = contraseña
            };

            bool existeUsuario = negU.LoginCheck(user);

            if (existeUsuario)
            {
                bool rol = negU.ObtenerRolUsuario(user);
                Session["userName"] = nombreUsuario;
                user = negU.getUsuarioId(user);

                if (rol)
                {
                    Server.Transfer("/Admin/MenuAdmin-Principal.aspx");
                }
                else
                {
                    NegocioSocios negS = new NegocioSocios();
                    Session["socio"] = negS.getSocioPorUsuario(user);
                    Server.Transfer("/Socio/MenuSocio-Principal.aspx");
                }
            }
            else
            {
                lblMensaje.Visible = true;
                txtUsuario.Text = "";
                txtContrasena.Text = "";
            }
        }
    }
}