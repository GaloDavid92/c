using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPEgreso : System.Web.UI.Page
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
            foreach (var item in db.ObjetivosAprendizaje)
            {
                if (item.NombreObj == "Perfil de Egreso" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarEgreso.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarEgreso.Visible = false;
            }

            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Perfil de Egreso") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Perfil de Egreso")
                {

                    eg.InnerHtml = item.Objetivo;

                }
            }

        }

        protected void btnAgregarEgreso_Click(object sender, EventArgs e)
        {
            agregaregreso.Visible = true;
            egreso.Visible = false;
        }

        protected void btnActualizarEgreso_Click(object sender, EventArgs e)
        {
            agregaregreso.Visible = true;
            egreso.Visible = false;
            btnGuardarEgreso.Visible = false;
            btnGuardarActualizarEgreso.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Perfil de Egreso"
                       select a.Objetivo).FirstOrDefault();
            CKEditorEgreso.Text = act;
        }

        protected void btnGuardarEgreso_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            ObjetivosAprendizaje nuevoegreso = new ObjetivosAprendizaje();
            nuevoegreso.NombreObj = "Perfil de Egreso";
            nuevoegreso.IdMalla = (int)Session["IdMalla"];
            nuevoegreso.Objetivo = CKEditorEgreso.Text;
            db.ObjetivosAprendizaje.InsertOnSubmit(nuevoegreso);
            db.SubmitChanges();
            CargarDatos();
            egreso.Visible = true;
            agregaregreso.Visible = false;
            btnActualizarEgreso.Visible = true;
            btnAgregarEgreso.Visible = false;
        }

        protected void btnGuardarActualizarEgreso_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Perfil de Egreso"
                       select a).First();
            act.Objetivo = CKEditorEgreso.Text;
            db.SubmitChanges();
            egreso.Visible = true;
            agregaregreso.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarEgreso_Click(object sender, EventArgs e)
        {
            egreso.Visible = true;
            agregaregreso.Visible = false;
        }
    }
}