using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPAdmision : System.Web.UI.Page
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
                if (item.NombreProceso == "Admision" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarAdmision.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarAdmision.Visible = false;
            }

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Admision") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Admision")
                {

                    ad.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnAgregarAdmision_Click(object sender, EventArgs e)
        {
            agregaradmision.Visible = true;
            admision.Visible = false;
        }

        protected void btnActualizarAdmision_Click(object sender, EventArgs e)
        {
            agregaradmision.Visible = true;
            admision.Visible = false;
            btnGuardarAdmision.Visible = false;
            btnGuardarActualizarAdmision.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Admision"
                       select a.Proceso).FirstOrDefault();
            CKEditorAdmision.Text = act;
        }

        protected void btnGuardarAdmision_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Procesos nuevoadmision = new Procesos();
            nuevoadmision.NombreProceso = "Admision";
            nuevoadmision.IdMalla = (int)Session["IdMalla"];
            nuevoadmision.Proceso = CKEditorAdmision.Text;
            db.Procesos.InsertOnSubmit(nuevoadmision);
            db.SubmitChanges();
            CargarDatos();
            admision.Visible = true;
            agregaradmision.Visible = false;
            btnActualizarAdmision.Visible = true;
            btnAgregarAdmision.Visible = false;
        }

        protected void btnGuardarActualizarAdmision_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Admision"
                       select a).First();
            act.Proceso = CKEditorAdmision.Text;
            db.SubmitChanges();
            admision.Visible = true;
            agregaradmision.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarAdmision_Click(object sender, EventArgs e)
        {
            admision.Visible = true;
            agregaradmision.Visible = false;
        }
    }
}