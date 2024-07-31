using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;


namespace Vistas.Admin
{
    public partial class MenuAdmin_RegistrarGrupo : System.Web.UI.Page
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
                    NegocioCategoria negC = new NegocioCategoria();
                    ddlCategoria.DataSource = negC.getTablaCategoria();
                    ddlCategoria.DataTextField = "nombre_C";
                    ddlCategoria.DataValueField = "idcategoria_C";
                    ddlCategoria.DataBind();
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                NegocioGrupo negG = new NegocioGrupo();
                Grupos grupo = new Grupos();

                //grupo.IdCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
                Categoria categoria = new Categoria(); 
                categoria.IdCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
                grupo.Categoria = categoria;
                grupo.Descripcion = txtDescripcion.Text;
                grupo.Profesor = txtProfesor.Text;
                grupo.Horario = txtHorario.Text;
                grupo.Arancel = Convert.ToDecimal(txtArancel.Text);

                negG.AgregarGrupo(grupo);

                borrarTodo();
            
                Server.Transfer("/Admin/MenuAdmin-Grupos.aspx");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Server.Transfer("/Admin/MenuAdmin-Grupos.aspx");
        }

        protected void btnBorrar_Click(object sender, EventArgs e)
        {
            borrarTodo();
        }

        protected void borrarTodo()
        {
            txtDescripcion.Text = "";
            txtProfesor.Text = "";
            txtHorario.Text = "";
            txtArancel.Text = "";
            ddlCategoria.SelectedIndex = -1;
        }

        protected void cvExisteGrupo_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string descripcion = args.Value;
            NegocioGrupo negG = new NegocioGrupo();

            bool existe = negG.existeGrupo(descripcion);

            args.IsValid = !existe;
        }
    }
}