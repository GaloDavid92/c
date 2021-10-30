using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserPAdmision : System.Web.UI.Page
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
            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Admision") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Admision")
                {

                    ad.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            var pAdmision = "";
            dbTICsDataContext db = new dbTICsDataContext();
            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Admision") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Admision")
                {

                    pAdmision = item.Proceso;

                }
            }
            var mensaje = "<h1>Proceso de Admisión</h1>" + pAdmision;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Proceso de Admisión", mensaje);
            msgMail.Visible = true;
            txtDestinatario.Text = "";
        }
    }
}