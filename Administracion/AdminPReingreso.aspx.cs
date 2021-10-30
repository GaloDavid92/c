using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPReingreso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdMalla"] == null)
                    Response.Redirect("AdminPensum.aspx");
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            int n1 = 0;
            foreach (var item in db.Procesos)
            {
                if (item.NombreProceso == "Reingreso" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarReingreso.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarReingreso.Visible = false;
            }

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Reingreso") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Reingreso")
                {

                    re.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnAgregarReingreso_Click(object sender, EventArgs e)
        {
            agregarreingreso.Visible = true;
            reingreso.Visible = false;
        }

        protected void btnActualizarReingreso_Click(object sender, EventArgs e)
        {
            agregarreingreso.Visible = true;
            reingreso.Visible = false;
            btnGuardarReingreso.Visible = false;
            btnGuardarActualizarReingreso.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Reingreso"
                       select a.Proceso).FirstOrDefault();
            CKEditorReingreso.Text = act;
        }

        protected void btnGuardarReingreso_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Procesos nuevoadmision = new Procesos();
            nuevoadmision.NombreProceso = "Reingreso";
            nuevoadmision.IdMalla = (int)Session["IdMalla"];
            nuevoadmision.Proceso = CKEditorReingreso.Text;
            db.Procesos.InsertOnSubmit(nuevoadmision);
            db.SubmitChanges();
            CargarDatos();
            reingreso.Visible = true;
            agregarreingreso.Visible = false;
            btnActualizarReingreso.Visible = true;
            btnAgregarReingreso.Visible = false;
        }

        protected void btnCancelarReingreso_Click(object sender, EventArgs e)
        {
            reingreso.Visible = true;
            agregarreingreso.Visible = false;
        }
    }
}