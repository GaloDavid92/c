using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserPensum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IdMallaU"] = null;
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var pensum = from p in db.MallaCurricular
                         where p.Estado=="Vigente"
                         select p;
            ddlPensum.DataSource = pensum;
            ddlPensum.DataTextField = "Pensum";
            ddlPensum.DataValueField = "IdMalla";
            ddlPensum.DataBind();

            //int id = Convert.ToInt32(ddlPensum.SelectedValue);
            //Session["IdMalla"] = id;
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlPensum.SelectedValue);
            Session["IdMallaU"] = id;
            Response.Redirect("UserMallaCurricular.aspx");
        }

        protected void ddlPensum_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlPensum.SelectedValue);
            Session["IdMallaU"] = id;
        }

        protected void ibtnInicio_Click(object sender, ImageClickEventArgs e)
        {
            Session["IdMallaU"] = null;
            Response.Redirect("UserInicio.aspx");
        }
    }
}