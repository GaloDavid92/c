using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminMisionVision : System.Web.UI.Page
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
            int n2 = 0;
            foreach (var item in db.ObjetivosAprendizaje)
            {
                if (item.NombreObj == "Mision" && item.IdMalla==(int)Session["IdMalla"])
                    n1++;
                if (item.NombreObj == "Vision" && item.IdMalla == (int)Session["IdMalla"])
                    n2++;
            }
            if (n1 == 1)
            {
                btnAgregarMision.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarMison.Visible = false;
            }
            if (n2 == 1)
            {
                btnAgregarVision.Visible = false;
            }
            if (n2 == 0)
            {
                btnActualizarVision.Visible = false;
            }
            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Mision" || a.NombreObj == "Vision") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Mision")
                {

                    m.InnerHtml = item.Objetivo;
                   
                }
                if (item.NombreObj == "Vision")
                {
                    v.InnerHtml = item.Objetivo;
                   
                }
            }

        }
        protected void btnAgregarMision_Click(object sender, EventArgs e)
        {
            agregarmision.Visible = true;
            mision.Visible = false;
            vision.Visible = false;
        }

        protected void btnActualizarMison_Click(object sender, EventArgs e)
        {
            agregarmision.Visible = true;
            mision.Visible = false;
            vision.Visible = false;
            btnActualizarMision.Visible = true;
            btnGuardarMision.Visible = false;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Mision"
                       select a.Objetivo).FirstOrDefault();
            CKEditorMision.Text = act;
        }

        protected void btnGuardarMision_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            ObjetivosAprendizaje nuevamision = new ObjetivosAprendizaje();
            nuevamision.NombreObj = "Mision";
            nuevamision.IdMalla = (int)Session["IdMalla"];
            nuevamision.Objetivo = CKEditorMision.Text;
            db.ObjetivosAprendizaje.InsertOnSubmit(nuevamision);
            db.SubmitChanges();
            CargarDatos();
            mision.Visible = true;
            vision.Visible = true;
            agregarmision.Visible = false;
            btnActualizarMison.Visible = true;
            btnAgregarMision.Visible = false;
        }

        protected void btnActualizarMision_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Mision"
                       select a).First();
            act.Objetivo = CKEditorMision.Text;
            db.SubmitChanges();
            mision.Visible = true;
            vision.Visible = true;
            agregarmision.Visible = false;
            CargarDatos();
        }

        protected void btnAgregarVision_Click(object sender, EventArgs e)
        {
           
            agregarvision.Visible = true;
            mision.Visible = false;
            vision.Visible = false;
           
        }

        protected void btnGuardarVision_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            
                ObjetivosAprendizaje nuevavision = new ObjetivosAprendizaje();
                nuevavision.NombreObj = "Vision";
                nuevavision.Objetivo = CKEditorVision.Text;
                nuevavision.IdMalla = (int)Session["IdMalla"];
                db.ObjetivosAprendizaje.InsertOnSubmit(nuevavision);
                db.SubmitChanges();
                CargarDatos();
                mision.Visible = true;
                vision.Visible = true;
                agregarvision.Visible = false;
            btnActualizarVision.Visible = true;
            btnAgregarVision.Visible = false;
        }

        protected void btnAgregarVision_Click1(object sender, EventArgs e)
        {
            agregarvision.Visible = true;
            mision.Visible = false;
            vision.Visible = false;
        }

        protected void btnCancelarVision_Click(object sender, EventArgs e)
        {
            agregarvision.Visible = false;
            mision.Visible = true;
            vision.Visible = true;
        }

        protected void btnCancelarMision_Click(object sender, EventArgs e)
        {
            agregarmision.Visible = false;
            mision.Visible = true;
            vision.Visible = true;
        }

        protected void btnGuardarActualizarVision_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Vision"
                       select a).First();
            act.Objetivo = CKEditorVision.Text;
            db.SubmitChanges();
            mision.Visible = true;
            vision.Visible = true;
            agregarvision.Visible = false;
            CargarDatos();
        }

        protected void btnActualizarVision_Click(object sender, EventArgs e)
        {
            agregarvision.Visible = true;
            mision.Visible = false;
            vision.Visible = false;
            btnGuardarVision.Visible = false;
            btnGuardarActualizarVision.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Vision"
                       select a.Objetivo).FirstOrDefault();
            CKEditorVision.Text = act;
        }
    }
}