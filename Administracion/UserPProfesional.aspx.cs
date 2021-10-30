using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserPProfesional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdMallaU"] == null)
                    Response.Redirect("UserPensum.aspx");
                CargarDatos();
            }
            msgMail.Visible = false;
        }
        private void CargarDatos()
        {
            dbTICsDataContext db = new dbTICsDataContext();
           
            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Perfil Profesional") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Perfil Profesional")
                {

                    p.InnerHtml = item.Objetivo;

                }
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            var pProfesional = "";
            dbTICsDataContext db = new dbTICsDataContext();

            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Perfil Profesional") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Perfil Profesional")
                {

                    pProfesional = item.Objetivo;

                }
            }
            var mensaje = "<h1>Perfil Profesional</h1>" + pProfesional;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Perfil Profesional", mensaje);
            msgMail.Visible = true;
            txtDestinatario.Text = "";
        }
    }
}