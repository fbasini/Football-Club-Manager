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
    public partial class MenuSocio_Datos : System.Web.UI.Page
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

                    NegocioSocios negS = new NegocioSocios();
                    Socios socio = new Socios();
                    socio = (Socios)Session["socio"];

                    Usuarios user = new Usuarios();

                    NegocioResponsable negR = new NegocioResponsable();
                    Responsable respo = new Responsable();

                    user.IdUsuario = negS.getIDUsuarioSocio(socio.IdSocio);
                    respo.IdResponsable = negS.getIDRespoSocio(socio.IdSocio);
                    socio = negS.infoSocioPorID(socio);
                    respo = negR.infoRespoPorID(respo);

                    cargarDatosUsuario();
                    cargarDatosSocio(socio);
                    cargarDatosRespo(respo);

                    NegocioGruposxSocio neg = new NegocioGruposxSocio();
                    //grdGruposActuales.DataSource = neg.getGruposAnotados(socio);
                    grdGruposActuales.DataSource = neg.getGruposPorID(socio);
                    grdGruposActuales.DataBind();

                }
            }

           
        }
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Socio/MenuSocio-Principal.aspx");
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Login/Login.aspx");
        }

        public void cargarDatosUsuario()
        {
            txtNombreUsuario.Text = Session["userName"].ToString();

            NegocioUsuarios negU = new NegocioUsuarios();

            string nombreUsuario = Session["userName"].ToString();
            txtContraseña.Text = negU.getContraseñaUsuario(nombreUsuario);
        }

        public void cargarDatosSocio(Socios socio)
        {
            txtNombre.Text = socio.NombreSocio;
            txtApellido.Text = socio.ApellidoSocio;
            txtDni.Text = socio.DniSocio.ToString();
            txtGenero.Text = socio.GeneroSocio;
            txtNacimiento.Text = socio.NacimientoSocio;
            txtCiudad.Text = socio.CiudadSocio;
            txtDomicilio.Text = socio.DomicilioSocio;
            txtTelefono.Text = socio.TelefonoSocio;
            txtEmail.Text = socio.EmailSocio;
        }

        public void cargarDatosRespo(Responsable respo)
        {
            txtNombreResponsable.Text = respo.NombreResponsable;
            txtApellidoResponsable.Text = respo.ApellidoResponsable;
            txtDniResponsable.Text = respo.DniResponsable.ToString();
            txtGeneroResponsable.Text = respo.GeneroResponsable;
            txtTelefonoResponsable.Text = respo.TelefonoResponsable;
        }

        protected void habilitarUsuario()
        {
            txtNuevaContraseña.Enabled = true;
            txtRepetirContraseña.Enabled = true;
            btnModificarUsuario.Visible = false;
            btnAceptarUsuario.Visible = true;
            btnCancelarUsuario.Visible = true;
        }

        protected void deshabilitarUsuario()
        {
            txtNombreUsuario.Enabled = false;
            txtNuevaContraseña.Enabled = false;
            txtRepetirContraseña.Enabled = false;
            btnModificarUsuario.Visible = true;
            btnAceptarUsuario.Visible = false;
            btnCancelarUsuario.Visible = false;
        }
        protected void habilitarSocio()
        {
            txtCiudad.Enabled = true;
            txtDomicilio.Enabled = true;
            txtTelefono.Enabled = true;
            txtEmail.Enabled = true;
            btnModificarSocio.Visible = false;
            btnAceptarSocio.Visible = true;
            btnCancelarSocio.Visible = true;
        }
        protected void deshabilitarSocio()
        {
            txtCiudad.Enabled = false;
            txtDomicilio.Enabled = false;
            txtTelefono.Enabled = false;
            txtEmail.Enabled = false;
            btnModificarSocio.Visible = true;
            btnAceptarSocio.Visible = false;
            btnCancelarSocio.Visible = false;
        }

        protected void habilitarResponsable()
        {
            txtTelefonoResponsable.Enabled = true;
            btnModificarResponsable.Visible = false;
            btnAceptarResponsable.Visible = true;
            btnCancelarResponsable.Visible = true;
        }

        protected void deshabilitarResponsable()
        {
            txtTelefonoResponsable.Enabled = false;
            btnModificarResponsable.Visible = true;
            btnAceptarResponsable.Visible = false;
            btnCancelarResponsable.Visible = false;
        }

        protected void btnModificarUsuario_Click(object sender, EventArgs e)
        {
            habilitarUsuario();
        }

        protected void btnAceptarUsuario_Click(object sender, EventArgs e)
        {
            NegocioUsuarios negU = new NegocioUsuarios();
            Usuarios user = new Usuarios();

            string nombreUsuario = Session["userName"].ToString();
            user.IdUsuario = negU.getIdPorNombre(nombreUsuario);

            string nuevaContraseña = txtNuevaContraseña.Text.Trim(); 
            user.ContraseñaUsuario = nuevaContraseña;

            negU.ModificarContraseña(user);

            deshabilitarUsuario();
        }

        protected void btnCancelarUsuario_Click(object sender, EventArgs e)
        {
            deshabilitarUsuario();
        }

        protected void btnModificarSocio_Click(object sender, EventArgs e)
        {
            habilitarSocio();
        }

        protected void btnAceptarSocio_Click(object sender, EventArgs e)
        {
            NegocioSocios negS = new NegocioSocios();
            Socios socio = new Socios();

            socio = (Socios)Session["socio"];

            socio.CiudadSocio = txtCiudad.Text.Trim();
            socio.DomicilioSocio = txtDomicilio.Text.Trim();
            socio.TelefonoSocio = txtTelefono.Text.Trim();
            socio.EmailSocio = txtEmail.Text.Trim();

            negS.modificarSocio(socio);

            deshabilitarSocio();
        }

        protected void btnCancelarSocio_Click(object sender, EventArgs e)
        {
            deshabilitarSocio();
        }

        protected void btnModificarResponsable_Click(object sender, EventArgs e)
        {
            habilitarResponsable();
        }

        protected void btnAceptarResponsable_Click(object sender, EventArgs e)
        {
            NegocioSocios negS = new NegocioSocios();
            Socios socio = new Socios();
            socio = (Socios)Session["socio"];

            NegocioResponsable negR = new NegocioResponsable();
            Responsable respo = new Responsable();

            respo.IdResponsable = negS.getIDRespoSocio(socio.IdSocio);
            socio = negS.infoSocioPorID(socio);
            respo = negR.infoRespoPorID(respo);

            respo.TelefonoResponsable = txtTelefonoResponsable.Text.Trim();

            negR.modificarResponsable(respo);

            deshabilitarResponsable();
        }

        protected void btnCancelarResponsable_Click(object sender, EventArgs e)
        {
            deshabilitarResponsable();
        }
    }
}