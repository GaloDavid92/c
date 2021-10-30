using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPCamCarrera : System.Web.UI.Page
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
                if (item.NombreProceso == "Cambio Carrera" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarCarrera.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarCarrera.Visible = false;
            }

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Cambio Carrera") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Cambio Carrera")
                {

                    ca.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnAgregarCarrera_Click(object sender, EventArgs e)
        {
            agregarcarrera.Visible = true;
            carrera.Visible = false;
        }

        protected void btnActualizarCarrera_Click(object sender, EventArgs e)
        {
            agregarcarrera.Visible = true;
            carrera.Visible = false;
            btnGuardarCarrera.Visible = false;
            btnGuardarActualizarCarrera.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Cambio Carrera"
                       select a.Proceso).FirstOrDefault();
            CKEditorCarrera.Text = act;
        }

        protected void btnGuardarCarrera_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Procesos nuevocarrera = new Procesos();
            nuevocarrera.NombreProceso = "Cambio Carrera";
            nuevocarrera.IdMalla = (int)Session["IdMalla"];
            nuevocarrera.Proceso = CKEditorCarrera.Text;
            db.Procesos.InsertOnSubmit(nuevocarrera);
            db.SubmitChanges();
            CargarDatos();
            carrera.Visible = true;
            agregarcarrera.Visible = false;
            btnActualizarCarrera.Visible = true;
            btnAgregarCarrera.Visible = false;
        }

        protected void btnGuardarActualizarCarrera_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Cambio Carrera"
                       select a).First();
            act.Proceso = CKEditorCarrera.Text;
            db.SubmitChanges();
            carrera.Visible = true;
            agregarcarrera.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarCarrera_Click(object sender, EventArgs e)
        {
            carrera.Visible = true;
            agregarcarrera.Visible = false;
        }
    }
}