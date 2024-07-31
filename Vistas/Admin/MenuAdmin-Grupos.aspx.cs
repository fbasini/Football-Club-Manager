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
    public partial class MenuAdmin_Grupos : System.Web.UI.Page
    {
        NegocioGrupo negG = new NegocioGrupo();
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
                    NegocioCategoria negC = new NegocioCategoria();
                    ddlCategoria.DataSource = negC.getTablaCategoria();
                    ddlCategoria.DataTextField = "nombre_C";
                    ddlCategoria.DataValueField = "idcategoria_C";
                    ddlCategoria.DataBind();
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
            grdGrupos.DataSource = negG.getTablaGruposConCategorias();
            grdGrupos.DataBind();
        }

        
        protected void grdGrupos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            
            
        }

        protected void grdGrupos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdGrupos.EditIndex = e.NewEditIndex;
            cargarGridView();

            lblMensaje.Visible = false;
        }

        protected void grdGrupos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdGrupos.EditIndex = -1;
            cargarGridView();
        }

        protected void grdGrupos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            NegocioGrupo negG = new NegocioGrupo();
            Grupos grupo = new Grupos();

            String s_idGrupo = ((Label)grdGrupos.Rows[e.RowIndex].FindControl("lbl_it_IdGrupo")).Text;
            grupo.IdGrupo = Convert.ToInt32(s_idGrupo);

            negG.EliminarGrupo(grupo);

            grdGrupos.EditIndex = -1;
            cargarGridView();

            lblMensaje.Text = "El registro se ha eliminado con éxito.";
            lblMensaje.Visible = true;
        }

        protected void grdGrupos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            NegocioGrupo negG = new NegocioGrupo();
            Grupos grupo = new Grupos();

            String s_idGrupo = ((Label)grdGrupos.Rows[e.RowIndex].FindControl("lbl_eit_IdGrupo")).Text;
            String s_descripcion = ((TextBox)grdGrupos.Rows[e.RowIndex].FindControl("txt_eit_Descripcion")).Text;
            String s_profe = ((TextBox)grdGrupos.Rows[e.RowIndex].FindControl("txt_eit_Profesor")).Text;
            String s_horario = ((TextBox)grdGrupos.Rows[e.RowIndex].FindControl("txt_eit_Horario")).Text;
            String s_arancel = ((TextBox)grdGrupos.Rows[e.RowIndex].FindControl("txt_eit_Arancel")).Text;

            grupo.IdGrupo = Convert.ToInt32(s_idGrupo);
            grupo.Descripcion = s_descripcion;
            grupo.Profesor = s_profe;
            grupo.Horario = s_horario;
            grupo.Arancel = Convert.ToDecimal(s_arancel);

            negG.ActualizarGrupo(grupo);
            
            grdGrupos.EditIndex = -1;
            cargarGridView();

            lblMensaje.Text = "El registro se ha editado con éxito.";
            lblMensaje.Visible = true;
        }

        protected void btnBuscarDescripcion_Click(object sender, EventArgs e)
        {
            Grupos grupo = new Grupos();
            grupo.Descripcion = txtBuscadorDescripcion.Text;

            NegocioGrupo negG = new NegocioGrupo();
            grdGrupos.DataSource = negG.getTablaSociosFiltradosPorNombre(grupo);
            grdGrupos.DataBind();

            txtBuscadorDescripcion.Text = "";

            lblMensaje.Visible = false;

        }

        protected void btnBuscarHorario_Click(object sender, EventArgs e)
        {
            Grupos grupo = new Grupos();
            grupo.Horario = txtBuscadorHorario.Text;

            NegocioGrupo negG = new NegocioGrupo();
            grdGrupos.DataSource = negG.getTablaSociosFiltradosPorHorario(grupo);
            grdGrupos.DataBind();

            txtBuscadorHorario.Text = "";

            lblMensaje.Visible = false;
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            cargarGridView();
            txtBuscadorDescripcion.Text = "";
            txtBuscadorHorario.Text = "";

            lblMensaje.Visible = false;
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-RegistrarGrupo.aspx");
        }

        protected void grdGrupos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdGrupos.PageIndex = e.NewPageIndex;
            cargarGridView();

            lblMensaje.Visible = false;
        }

        protected void btnFiltrarCategoria_Click(object sender, EventArgs e)
        {
            Grupos grupo = new Grupos();
            NegocioGrupo negG = new NegocioGrupo();
            grupo.Categoria = new Categoria();
            grupo.Categoria.IdCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);

            grdGrupos.DataSource = negG.getTablaGruposFiltradosPorCategoria(grupo);
            grdGrupos.DataBind();

            lblMensaje.Visible = false;
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            cargarGridView();
            lblMensaje.Visible = false;
        }
    }

}