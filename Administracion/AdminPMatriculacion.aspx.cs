using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPMatriculacion : System.Web.UI.Page
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
                if (item.NombreProceso == "Matriculacion" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarMatriculacion.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarMatriculacion.Visible = false;
            }

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Matriculacion") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Matriculacion")
                {

                    ma.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnAgregarMatriculacion_Click(object sender, EventArgs e)
        {
            agregarmatriculacion.Visible = true;
            matriculacion.Visible = false;
        }

        protected void btnActualizarMatriculacion_Click(object sender, EventArgs e)
        {
            agregarmatriculacion.Visible = true;
            matriculacion.Visible = false;
            btnGuardarMatriculacion.Visible = false;
            btnGuardarActualizarMatriculacion.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Matriculacion"
                       select a.Proceso).FirstOrDefault();
            CKEditorMatriculacion.Text = act;
        }

        protected void btnGuardarMatriculacion_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Procesos nuevomatriculado = new Procesos();
            nuevomatriculado.NombreProceso = "Matriculacion";
            nuevomatriculado.IdMalla = (int)Session["IdMalla"];
            nuevomatriculado.Proceso = CKEditorMatriculacion.Text;
            db.Procesos.InsertOnSubmit(nuevomatriculado);
            db.SubmitChanges();
            CargarDatos();
            matriculacion.Visible = true;
            agregarmatriculacion.Visible = false;
            btnActualizarMatriculacion.Visible = true;
            btnAgregarMatriculacion.Visible = false;
        }

        protected void btnGuardarActualizarMatriculacion_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Matriculacion"
                       select a).First();
            act.Proceso = CKEditorMatriculacion.Text;
            db.SubmitChanges();
            matriculacion.Visible = true;
            agregarmatriculacion.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarMatriculacion_Click(object sender, EventArgs e)
        {
            matriculacion.Visible = true;
            agregarmatriculacion.Visible = false;
        }
    }
}