using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserPIngreso : System.Web.UI.Page
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
                           where (a.NombreObj == "Perfil de Ingreso") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Perfil de Ingreso")
                {

                    i.InnerHtml = item.Objetivo;

                }
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            var perfil = "";

            dbTICsDataContext db = new dbTICsDataContext();

            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Perfil de Ingreso") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Perfil de Ingreso")
                {

                    perfil = item.Objetivo;

                }
            }

            var mensaje = "<h1>Perfil de Ingreso</h1>" + perfil;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Perfil de Ingreso", mensaje);
            msgMail.Visible = true;
            txtDestinatario.Text = "";
        }
    }
}