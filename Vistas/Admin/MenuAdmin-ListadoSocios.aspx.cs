using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Entidades;
using System.Data;

namespace Vistas.Admin
{
    public partial class MenuAdmin_ListadoSocios : System.Web.UI.Page
    {
        Negocio.NegocioSocios negS = new Negocio.NegocioSocios();

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
                lblMensaje.Visible = false;
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


        private void cargarGridView()
        {
            grdSocios.DataSource = negS.getTablaCompleta();
            grdSocios.DataBind();
        }

        protected void grdSocios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Socios socios = new Socios();
            socios.IdSocio = Convert.ToInt32(((Label)grdSocios.Rows[e.RowIndex].FindControl("lbl_it_IdSocio")).Text);
            negS.EliminarRegistroGruposPorSocios(socios);
            negS.EliminarRegistroPagos(socios);
            negS.EliminarSocio(socios);
            grdSocios.EditIndex = -1;
            cargarGridView();

            lblMensaje.Text = "El registro se ha eliminado con éxito.";
            lblMensaje.Visible = true;

        }

        protected void grdSocios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdSocios.PageIndex = e.NewPageIndex;
            cargarGridView();

            lblMensaje.Visible = false;
        }

        protected void btnBuscarNombre_Click(object sender, EventArgs e)
        {
            Socios socios = new Socios();
            socios.NombreSocio = txtBuscadorNombre.Text.Trim();

            if (txtBuscadorNombre.Text.Trim() != "")
            {
                grdSocios.DataSource = negS.getTablaSociosFiltradosPorNombre(socios);
                grdSocios.DataBind();
            }

            txtBuscadorNombre.Text = "";

            lblMensaje.Visible = false;
        }

        protected void btnBuscarDni_Click(object sender, EventArgs e)
        {
            Socios socios = new Socios();
            socios.DniSocio = Convert.ToInt32(txtBuscadorDni.Text.Trim());

            if (txtBuscadorDni.Text.Trim() != "")
            {
                grdSocios.DataSource = negS.getTablaSociosFiltradosPorDni(socios);
                grdSocios.DataBind();
            }

            txtBuscadorDni.Text = "";

            lblMensaje.Visible = false;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-RegistrarSocio.aspx");
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            cargarGridView();

            lblMensaje.Visible = false;
        }

        protected void grdSocios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdSocios.EditIndex = e.NewEditIndex;
            cargarGridView();

            lblMensaje.Visible = false;
        }

        protected void grdSocios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdSocios.EditIndex = -1;
            cargarGridView();
        }

        protected void grdSocios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Socios socios = new Socios();
            socios.IdSocio = Convert.ToInt32(((Label)grdSocios.Rows[e.RowIndex].FindControl("lbl_eit_IdSocio")).Text);
            socios.NombreSocio = ((TextBox)grdSocios.Rows[e.RowIndex].FindControl("txt_eit_NombreSocio")).Text;
            socios.ApellidoSocio = ((TextBox)grdSocios.Rows[e.RowIndex].FindControl("txt_eit_ApellidoSocio")).Text;
            socios.DniSocio = Convert.ToInt32(((TextBox)grdSocios.Rows[e.RowIndex].FindControl("txt_eit_DniSocio")).Text);
            socios.TelefonoSocio = ((TextBox)grdSocios.Rows[e.RowIndex].FindControl("txt_eit_TelefonoSocio")).Text;
            socios.EmailSocio = ((TextBox)grdSocios.Rows[e.RowIndex].FindControl("txt_eit_EmailSocio")).Text;

            negS.modificarSocio(socios);

            grdSocios.EditIndex = -1;
            cargarGridView();

            lblMensaje.Text = "El registro se ha editado con éxito.";
            lblMensaje.Visible = true;
        }
    }
}