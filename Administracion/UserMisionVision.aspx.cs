using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserMisionVision : System.Web.UI.Page
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
                           where (a.NombreObj == "Mision" || a.NombreObj == "Vision") && a.IdMalla == (int)Session["IdMallaU"]
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

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            var mision = "";
            var vision = "";
            dbTICsDataContext db = new dbTICsDataContext();

            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Mision" || a.NombreObj == "Vision") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Mision")
                {

                    mision = item.Objetivo;

                }
                if (item.NombreObj == "Vision")
                {
                    vision = item.Objetivo;

                }
            }

            var mensaje = "<h1>Misión</h1>" + mision + "<hr/><h1>Visión</h1>" + vision;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Misión y Visión", mensaje);
            msgMail.Visible = true;
        }
    }
}