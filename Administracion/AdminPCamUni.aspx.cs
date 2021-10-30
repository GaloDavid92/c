using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPCamUni : System.Web.UI.Page
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
                if (item.NombreProceso == "Cambio Universidad" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarUniversidad.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarUniversidad.Visible = false;
            }

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Cambio Universidad") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Cambio Universidad")
                {

                    uni.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnAgregarUniversidad_Click(object sender, EventArgs e)
        {
            agregaruniversidad.Visible = true;
            universidad.Visible = false;
        }

        protected void btnActualizarUniversidad_Click(object sender, EventArgs e)
        {
            agregaruniversidad.Visible = true;
            universidad.Visible = false;
            btnGuardarUniversidad.Visible = false;
            btnGuardarActualizarUniversidad.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Cambio Universidad"
                       select a.Proceso).FirstOrDefault();
            CKEditorUniversidad.Text = act;
        }

        protected void btnGuardarUniversidad_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Procesos nuevoauni = new Procesos();
            nuevoauni.NombreProceso = "Cambio Universidad";
            nuevoauni.IdMalla = (int)Session["IdMalla"];
            nuevoauni.Proceso = CKEditorUniversidad.Text;
            db.Procesos.InsertOnSubmit(nuevoauni);
            db.SubmitChanges();
            CargarDatos();
            universidad.Visible = true;
            agregaruniversidad.Visible = false;
            btnActualizarUniversidad.Visible = true;
            btnAgregarUniversidad.Visible = false;
        }

        protected void btnGuardarActualizarUniversidad_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Cambio Universidad"
                       select a).First();
            act.Proceso = CKEditorUniversidad.Text;
            db.SubmitChanges();
            universidad.Visible = true;
            agregaruniversidad.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarUniversidad_Click(object sender, EventArgs e)
        {
            universidad.Visible = true;
            agregaruniversidad.Visible = false;
        }
    }
}