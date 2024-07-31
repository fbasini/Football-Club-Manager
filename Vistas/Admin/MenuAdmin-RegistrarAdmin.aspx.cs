using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.Admin
{
    public partial class MenuAdmin_RegistrarAdmin : System.Web.UI.Page
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Usuarios us = new Usuarios();
                NegocioUsuarios negUsuario = new NegocioUsuarios();
                bool retorno = true;
                us.NombreUsuario = txtUsuario.Text.Trim();
                us.ContraseñaUsuario = txtContraseña.Text.Trim();
                us.RolUsuario = true;
                retorno = negUsuario.agregarUsuario(us);
                if (retorno)
                {
                    lblMensaje.Text = "El registro se ha agregado con éxito.";
                    lblMensaje.Visible = true;
                }

                Administrador admin = new Administrador();
                admin.UsuarioAdmin = new Usuarios();
                admin.NombreAdmin = txtNombre.Text.Trim();
                admin.ApellidoAdmin = txtApellido.Text.Trim();
                admin.DniAdmin = Convert.ToInt32(txtDNI.Text.Trim());
                admin.TelefonoAdmin = txtTelefono.Text.Trim();
                admin.EmailAdmin = txtEmail.Text.Trim();
                admin.UsuarioAdmin.IdUsuario = negUsuario.getUltimoIdUsuario();
                NegocioAdmin negA = new NegocioAdmin();
                negA.AgregarAdmin(admin);

                borrarTodo();
            }
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            borrarTodo();

            lblMensaje.Visible = false;
        }

        protected void borrarTodo()
        {
            txtUsuario.Text = "";
            txtContraseña.Text = "";
            txtRepetirContraseña.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDNI.Text = "";
            txtTelefono.Text = "";
            txtEmail.Text = "";
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            borrarTodo();
            Server.Transfer("/Admin/MenuAdmin-Principal.aspx");

            lblMensaje.Visible = false;
        }

        protected void cvExisteNombreUsuario_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string nombreUsuario = args.Value;
            NegocioUsuarios negU = new NegocioUsuarios();

            bool existe = negU.existeNombreUsuario(nombreUsuario);

            args.IsValid = !existe;
        }

        protected void cvExisteDni_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            int dni = Convert.ToInt32(args.Value);
            NegocioAdmin negA = new NegocioAdmin();

            bool existe = negA.existeDNI(dni);

            args.IsValid = !existe;
        }
    }
}