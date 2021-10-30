using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminMatriz : System.Web.UI.Page
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
                if (item.NombreObj == "Matriz de Trazabilidad" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }
            if (n1 == 1)
            {
                btnAgregarMatriz.Visible = false;
            }
            if (n1 == 0)
            {
                btnActualizarMatriz.Visible = false;
            }

            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Matriz de Trazabilidad") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Matriz de Trazabilidad")
                {

                    m.InnerHtml = item.Objetivo;

                }
            }

        }

        protected void btnAgregarMatriz_Click(object sender, EventArgs e)
        {
            agregarmatriz.Visible = true;
            matriz.Visible = false;
        }

        protected void btnActualizarMatriz_Click(object sender, EventArgs e)
        {
            agregarmatriz.Visible = true;
            matriz.Visible = false;
            btnGuardarMatriz.Visible = false;
            btnGuardarActualizarMatriz.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Matriz de Trazabilidad"
                       select a.Objetivo).FirstOrDefault();
            CKEditorMatriz.Text = act;
        }

        protected void btnGuardarMatriz_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            ObjetivosAprendizaje nuevamatriz = new ObjetivosAprendizaje();
            nuevamatriz.NombreObj = "Matriz de Trazabilidad";
            nuevamatriz.IdMalla = (int)Session["IdMalla"];
            nuevamatriz.Objetivo = CKEditorMatriz.Text;
            db.ObjetivosAprendizaje.InsertOnSubmit(nuevamatriz);
            db.SubmitChanges();
            CargarDatos();
            matriz.Visible = true;
            agregarmatriz.Visible = false;
            btnActualizarMatriz.Visible = true;
            btnAgregarMatriz.Visible = false;
        }

        protected void btnGuardarActualizarMatriz_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.ObjetivosAprendizaje
                       where a.IdMalla == (int)Session["IdMalla"] && a.NombreObj == "Matriz de Trazabilidad"
                       select a).First();
            act.Objetivo = CKEditorMatriz.Text;
            db.SubmitChanges();
            matriz.Visible = true;
            agregarmatriz.Visible = false;
            CargarDatos();
        }

        protected void btnCancelarMatriz_Click(object sender, EventArgs e)
        {
            matriz.Visible = true;
            agregarmatriz.Visible = false;
        }
    }
}