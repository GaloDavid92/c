using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPExReAn : System.Web.UI.Page
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
                if (item.NombreProceso == "Extraordinarias" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarExtra.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarExtra.Visible = false;
            }

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Extraordinarias") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Extraordinarias")
                {

                    ex.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnAgregarExtra_Click(object sender, EventArgs e)
        {
            agregarextra.Visible = true;
            extraordinaria.Visible = false;
        }

        protected void btnActualizarExtra_Click(object sender, EventArgs e)
        {
            agregarextra.Visible = true;
            extraordinaria.Visible = false;
            btnGuardarExtra.Visible = false;
            btnGuardarActualizarExtra.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Extraordinarias"
                       select a.Proceso).FirstOrDefault();
            CKEditorExtra.Text = act;
        }

        protected void btnGuardarExtra_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Procesos nuevoextra = new Procesos();
            nuevoextra.NombreProceso = "Extraordinarias";
            nuevoextra.IdMalla = (int)Session["IdMalla"];
            nuevoextra.Proceso = CKEditorExtra.Text;
            db.Procesos.InsertOnSubmit(nuevoextra);
            db.SubmitChanges();
            CargarDatos();
            extraordinaria.Visible = true;
            agregarextra.Visible = false;
            btnActualizarExtra.Visible = true;
            btnAgregarExtra.Visible = false;
        }

        protected void btnGuardarActualizarExtra_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Procesos
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreProceso == "Extraordinarias"
                       select a).First();
            act.Proceso = CKEditorExtra.Text;
            db.SubmitChanges();
            extraordinaria.Visible = true;
            agregarextra.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarExtra_Click(object sender, EventArgs e)
        {
            extraordinaria.Visible = true;
            agregarextra.Visible = false;
        }
    }
}