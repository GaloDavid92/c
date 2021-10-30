using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserFormularios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdMallaU"] == null)
                    Response.Redirect("UserPensum.aspx");
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            int n1 = 0;
            foreach (var item in db.FormSoli)
            {
                if (item.Tipo == "Formulario" && item.IdMalla == (int)Session["IdMallaU"])
                    n1++;
            }

            var agregar = (from a in db.FormSoli
                           where (a.Tipo == "Formulario") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            gvFormularios.DataSource = agregar;
            gvFormularios.DataBind();

            //DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Formularios"));
            //FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);

            //gvFormularios.DataSource = fileInfo;
            //gvFormularios.DataBind();
        }

        protected void gvFormularios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        

        }
    }
}