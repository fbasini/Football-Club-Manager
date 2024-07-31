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
    public partial class MenuSocio_Grupos : System.Web.UI.Page
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
                }

                cargarGridViews();
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

        protected void cargarGridViews()
        {
            Socios socio = new Socios();
            socio = (Socios)Session["socio"];
            NegocioGruposxSocio negGxS = new NegocioGruposxSocio();
            grdGruposActuales.DataSource = negGxS.getGruposAnotados(socio);
            grdGruposActuales.DataBind();

            NegocioGrupo negG = new NegocioGrupo();
            grdGruposDisponibles.DataSource = negG.getTablaCompleta();
            grdGruposDisponibles.DataBind();
        }

        protected void grdGruposActuales_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (Application["anterior_actual"]!= null)
            {
                ((LinkButton)grdGruposActuales.Rows[(int)Application["anterior_actual"]].FindControl("btnSeleccionar_gxs")).Text = "<i class='bi bi-square'></i>"; 
            }
            ((LinkButton)grdGruposActuales.Rows[e.NewSelectedIndex].FindControl("btnSeleccionar_gxs")).Text = "<i class='bi bi-check-square-fill'></i>";
            String id = ((Label)grdGruposActuales.Rows[e.NewSelectedIndex].FindControl("lbl_it_IdGrupo_gxs")).Text;
            Application["id_grupo_gxs"] = Convert.ToInt32(id);
            Application["anterior_actual"] = e.NewSelectedIndex;
        }

        protected void btnBaja_Click(object sender, EventArgs e)
        {
            if (Application["id_grupo_gxs"] != null)
            {
                NegocioGruposxSocio negGxS = new NegocioGruposxSocio();
                negGxS.EliminarGrupoXSocio((int)Application["id_grupo_gxs"]);
                Application["id_grupo_gxs"] = null;
            }
            cargarGridViews();
        }

        protected void grdGruposDisponibles_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            if (Application["anterior_disponible"] != null)
            {
                ((LinkButton)grdGruposDisponibles.Rows[(int)Application["anterior_disponible"]].FindControl("btnSeleccionar_g")).Text = "<i class='bi bi-square'></i>";
            }
            ((LinkButton)grdGruposDisponibles.Rows[e.NewSelectedIndex].FindControl("btnSeleccionar_g")).Text = "<i class='bi bi-check-square-fill'></i>";
            String id = ((Label)grdGruposDisponibles.Rows[e.NewSelectedIndex].FindControl("lbl_it_IdGrupo_g")).Text;
            Application["id_grupo_g"] = Convert.ToInt32(id);
            Application["anterior_disponible"] = e.NewSelectedIndex;
        }

        protected void btnInscribirse_Click(object sender, EventArgs e)
        {
            
            if (Application["id_grupo_g"] != null)
            {
                Grupos grupo = new Grupos();
                grupo.IdGrupo = (int)Application["id_grupo_g"];
                NegocioGrupo negG = new NegocioGrupo();
                negG.getGrupo(grupo);
                Socios socio = (Socios)Session["socio"];
                NegocioGruposxSocio gxs = new NegocioGruposxSocio();
                if (!gxs.Inscripto(grupo, socio))
                {
                    gxs.agregarGrupoXSocio(grupo, socio);
                }
                cargarGridViews();
            }

        }
    }
}