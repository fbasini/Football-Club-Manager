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
    public partial class MenuAdmin_RegistarSocio : System.Web.UI.Page
    {

        Usuarios us;
        NegocioUsuarios negUsuario;

        Socios socio;
        NegocioSocios negSocio;

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



        //usuario
        protected void btnGuardar1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                us = new Usuarios();
                negUsuario = new NegocioUsuarios();
                bool retorno = true;
                us.NombreUsuario = txtUsuario.Text.Trim();
                us.ContraseñaUsuario = txtContraseña.Text.Trim();
                us.RolUsuario = false;
                retorno = negUsuario.agregarUsuario(us);
                if (retorno)
                {
                    lblMensaje.Text = "Usuario agregado correctamente.";
                }

                Session["Usuario"] = us;

                borrarTodo();

                habilitarSocio();
            }
        }

        protected void btnCancelar1_Click(object sender, EventArgs e)
        {
            borrarTodo();
            Server.Transfer("/Admin/MenuAdmin-Principal.aspx");
        }

        protected void btnBorrar1_Click(object sender, EventArgs e)
        {
            borrarTodo();
        }


        protected void cvExisteNombreUsuario_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string nombreUsuario = args.Value;
            NegocioUsuarios negU = new NegocioUsuarios();

            bool existe = negU.existeNombreUsuario(nombreUsuario);

            args.IsValid = !existe;
        }





        // socio
        protected void btnGuardar2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                socio = new Socios();
                socio.UsuarioSocio = new Usuarios(); 
                socio.ResponsableSocio = new Responsable();
                ///////////////////////////
                us = (Usuarios)Session["Usuario"]; 
                negUsuario = new NegocioUsuarios();

                //socio = new Socios();
                negSocio = new NegocioSocios();
                bool retorno = true;
                socio.NombreSocio = txtNombre.Text.Trim();
                socio.ApellidoSocio = txtApellido.Text.Trim();
                socio.DniSocio = Convert.ToInt32(txtDNI.Text.Trim());
                socio.GeneroSocio = ddlSexoSocio.Text;
                string dia = txtDia.Text.Trim();
                string mes = ddlMes.SelectedValue;
                string año = txtAnio.Text.Trim();
                socio.NacimientoSocio = año + "-" + mes + "-" + dia;
                socio.CiudadSocio = txtLocalidad.Text.Trim();
                socio.DomicilioSocio = txtDomicilio.Text.Trim();
                socio.TelefonoSocio = txtTelefono.Text.Trim();
                socio.EmailSocio = txtEmail.Text.Trim();
                socio.UsuarioSocio.IdUsuario = negUsuario.getIdPorNombre(us.NombreUsuario);
                retorno = negSocio.agregarSocio(socio);
                if (retorno)
                {
                    lblMensaje2.Text = "Socio agregado correctamente.";

                    int idSocio = negSocio.buscarIdSocioPorDni(socio.DniSocio); 
                    socio.IdSocio = idSocio;
                    Session["Socio"] = socio;
                }

                borrarTodo();

                if (negSocio.esMenor(socio))
                {
                    lblMensaje2.Text += " El socio es menor, por favor agregar un responsable.";
                    habilitarResponsable();
                }
                else
                {
                    socio.ResponsableSocio.IdResponsable = null;
                    deshabilitarResponsable();
                }
            }
        }

        protected void btnBorrar2_Click(object sender, EventArgs e)
        {
            borrarTodo();
        }

        protected void cvExisteDni_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            int dni = Convert.ToInt32(args.Value);
            NegocioSocios negS = new NegocioSocios();

            bool existe = negS.existeDNI(dni);

            args.IsValid = !existe;
        }



        //responsable
        protected void btnGuardar3_Click(object sender, EventArgs e)
        {
            socio = new Socios();
            socio.ResponsableSocio = new Responsable();
            /////////////////////////////
            socio = (Socios)Session["Socio"];
            negSocio = new NegocioSocios();

            Responsable resp = new Responsable();
            NegocioResponsable negResp = new NegocioResponsable();
            bool retorno = true;
            resp.NombreResponsable = txtNombreRespo.Text.Trim();
            resp.ApellidoResponsable = txtApellidoRespo.Text.Trim();
            resp.DniResponsable = Convert.ToInt32(txtDNIRespo.Text.Trim());
            resp.GeneroResponsable = ddlSexoResponsable.Text;
            resp.TelefonoResponsable = txtTelefonoRespo.Text.Trim();
            retorno = negResp.agregarResponsable(resp);
            if (retorno)
            {
                lblMensaje3.Visible = true;
                lblMensaje3.Text = "Responsable agregado correctamente.";
            }

            socio.ResponsableSocio.IdResponsable = negResp.getIdPorDNI(resp.DniResponsable);
            negSocio.agregarIdResponsableAlSocio(socio); 

            borrarTodo();
        }

        protected void btnBorrar3_Click(object sender, EventArgs e)
        {
            borrarTodo();
        }



        protected void borrarTodo()
        {
            txtUsuario.Text = "";
            txtContraseña.Text = "";
            txtRepetirContraseña.Text = "";

            txtNombre.Text = "";
            txtApellido.Text = "";
            txtDNI.Text = "";
            ddlSexoSocio.SelectedIndex = 0;
            txtDia.Text = "";
            ddlMes.SelectedIndex = 0;
            txtAnio.Text = "";
            txtLocalidad.Text = "";
            txtDomicilio.Text = "";
            txtTelefono.Text = "";
            txtEmail.Text = "";

            txtNombreRespo.Text = "";
            txtApellidoRespo.Text = "";
            txtDNIRespo.Text = "";
            ddlSexoResponsable.SelectedIndex = 0;
            txtTelefonoRespo.Text = "";
        }

        protected void deshabilitarUsuario()
        {
            txtContraseña.Enabled = false;
            txtRepetirContraseña.Enabled = false;
            txtUsuario.Enabled = false;
        }

        protected void habilitarSocio()
        {
            txtNombre.Enabled = true;
            txtApellido.Enabled = true;
            txtDNI.Enabled = true;
            txtDia.Enabled = true;
            ddlMes.Enabled = true;
            txtAnio.Enabled = true;
            ddlSexoSocio.Enabled = true;
            txtLocalidad.Enabled = true;
            txtDomicilio.Enabled = true;
            txtTelefono.Enabled = true;
            txtEmail.Enabled = true;

            btnGuardar2.Visible = true;
            btnBorrar2.Visible = true;
        }

        protected void deshabilitarSocio() 
        {
            txtNombre.Enabled = false;
            txtApellido.Enabled = false;
            txtDNI.Enabled = false;
            txtDia.Enabled = false;    
            ddlMes.Enabled = false;
            txtAnio.Enabled = false;
            ddlSexoSocio.Enabled = false;
            txtLocalidad.Enabled = false;
            txtDomicilio.Enabled = false;
            txtTelefono.Enabled = false;
            txtEmail.Enabled = false;
        }

        protected void habilitarResponsable()
        {
            txtNombreRespo.Enabled = true;
            txtApellidoRespo.Enabled = true;
            txtDNIRespo.Enabled = true;
            ddlSexoResponsable.Enabled = true;
            txtTelefonoRespo.Enabled = true;

            btnGuardar3.Visible = true;
            btnBorrar3.Visible = true;
        }

        protected void deshabilitarResponsable()
        {
            txtNombreRespo.Enabled = false;
            txtApellidoRespo.Enabled = false;
            txtDNIRespo.Enabled = false;
            ddlSexoResponsable.Enabled = false;
            txtTelefonoRespo.Enabled = false;

            lblMensaje3.Visible = false;
        }

    }
}