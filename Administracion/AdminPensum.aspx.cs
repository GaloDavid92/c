using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminPensum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IdMalla"] = null;
                CargarDatos();
               
            }
        }
        private void CargarDatos()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var pensum = from p in db.MallaCurricular
                         select p;
            ddlPensum.DataSource = pensum;
            ddlPensum.DataTextField = "Pensum";
            ddlPensum.DataValueField = "IdMalla";
            ddlPensum.DataBind();

            //int id = Convert.ToInt32(ddlPensum.SelectedValue);
            //Session["IdMalla"] = id;
        }
        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlPensum.SelectedValue);
            Session["IdMalla"] = id;
            Response.Redirect("AdminMallaCurricular.aspx");
            
        }

        protected void ibtnInicio_Click(object sender, ImageClickEventArgs e)
        {
            Session["IdMalla"] = null;
            Response.Redirect("AdminInicio.aspx");
            
        }

        protected void ddlPensum_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddlPensum.SelectedValue);
            Session["IdMalla"] = id;
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            agregar.Visible = true;

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            pensum.Visible = true;
            agregar.Visible = false;
            dbTICsDataContext db = new dbTICsDataContext();
            MallaCurricular nueva = new MallaCurricular();
            nueva.NombreMalla = txtNombre.Text;
            nueva.Pensum = txtPensum.Text;
            nueva.Estado = ddlEstado.SelectedValue;
            db.MallaCurricular.InsertOnSubmit(nueva);
            db.SubmitChanges();
            CargarDatos();
        }

        protected void btnActualizarPensum_Click(object sender, EventArgs e)
        {
            pensum.Visible = true;
            actualizar.Visible = false;

            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.MallaCurricular
                      where a.IdMalla == int.Parse(ddlPensum.SelectedValue)
                      select a).First();
            act.NombreMalla = txtNombreActualizar.Text;
            act.Pensum = txtPensumActualizar.Text;
            act.Estado = ddlActualizarEstado.SelectedValue;
            db.SubmitChanges();
            CargarDatos();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            actualizar.Visible = true;
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.MallaCurricular
                       where a.IdMalla == int.Parse(ddlPensum.SelectedValue)
                       select a).First();
            txtNombreActualizar.Text = act.NombreMalla;
            txtPensumActualizar.Text = act.Pensum;
            ddlActualizarEstado.SelectedValue = act.Estado;
        }
    }
}