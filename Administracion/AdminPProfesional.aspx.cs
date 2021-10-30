using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPProfesional : System.Web.UI.Page
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
                if (item.NombreObj == "Perfil Profesional" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarProfesional.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarProfesional.Visible = false;
            }

            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Perfil Profesional") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Perfil Profesional")
                {

                    p.InnerHtml = item.Objetivo;

                }
            }

        }

        protected void btnAgregarProfesional_Click(object sender, EventArgs e)
        {
            agregarprofesional.Visible = true;
            profesional.Visible = false;
        }

        protected void btnActualizarProfesional_Click(object sender, EventArgs e)
        {
            agregarprofesional.Visible = true;
            profesional.Visible = false;
            btnGuardarProfesional.Visible = false;
            btnGuardarActualizarProfesional.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Perfil Profesional"
                       select a.Objetivo).FirstOrDefault();
            CKEditorProfesional.Text = act;
        }

        protected void btnGuardarProfesional_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            ObjetivosAprendizaje nuevoprofesional = new ObjetivosAprendizaje();
            nuevoprofesional.NombreObj = "Perfil Profesional";
            nuevoprofesional.IdMalla = (int)Session["IdMalla"];
            nuevoprofesional.Objetivo = CKEditorProfesional.Text;
            db.ObjetivosAprendizaje.InsertOnSubmit(nuevoprofesional);
            db.SubmitChanges();
            CargarDatos();
            profesional.Visible = true;
            agregarprofesional.Visible = false;
            btnActualizarProfesional.Visible = true;
            btnAgregarProfesional.Visible = false;
        }

        protected void btnGuardarActualizarProfesional_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Perfil Profesional"
                       select a).First();
            act.Objetivo = CKEditorProfesional.Text;
            db.SubmitChanges();
            profesional.Visible = true;
            agregarprofesional.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarIProfesional_Click(object sender, EventArgs e)
        {
            profesional.Visible = true;
            agregarprofesional.Visible = false;
        }
    }
}