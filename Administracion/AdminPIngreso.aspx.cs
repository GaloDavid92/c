using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPIngreso : System.Web.UI.Page
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
                if (item.NombreObj == "Perfil de Ingreso" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarIngreso.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarIngreso.Visible = false;
            }
            
            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Perfil de Ingreso") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Perfil de Ingreso")
                {

                    i.InnerHtml = item.Objetivo;

                }
            }

        }
        protected void btnAgregarIngreso_Click(object sender, EventArgs e)
        {
            agregaringreso.Visible = true;
            ingreso.Visible = false;
           
        }

        protected void btnActualizarIngreso_Click(object sender, EventArgs e)
        {
            agregaringreso.Visible = true;
            ingreso.Visible = false;
            btnGuardarIngreso.Visible = false;
            btnGuardarActualizarIngreso.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Perfil de Ingreso"
                       select a.Objetivo).FirstOrDefault();
            CKEditorIngreso.Text = act;
        }

        protected void btnCancelarIngreso_Click(object sender, EventArgs e)
        {
            ingreso.Visible = true;
            agregaringreso.Visible = false;
        }

        protected void btnGuardarIngreso_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            ObjetivosAprendizaje nuevoingreso = new ObjetivosAprendizaje();
            nuevoingreso.NombreObj = "Perfil de Ingreso";
            nuevoingreso.IdMalla = (int)Session["IdMalla"];
            nuevoingreso.Objetivo = CKEditorIngreso.Text;
            db.ObjetivosAprendizaje.InsertOnSubmit(nuevoingreso);
            db.SubmitChanges();
            CargarDatos();
            ingreso.Visible = true;
            agregaringreso.Visible = false;
            btnActualizarIngreso.Visible = true;
            btnAgregarIngreso.Visible = false;
        }

        protected void btnGuardarActualizarIngreso_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Perfil de Ingreso"
                       select a).First();
            act.Objetivo = CKEditorIngreso.Text;
            db.SubmitChanges();
            ingreso.Visible = true;
            agregaringreso.Visible = false;
            CargarDatos();
        }

       
    }
}