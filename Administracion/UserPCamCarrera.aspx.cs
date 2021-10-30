using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserPCamCarrera : System.Web.UI.Page
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
                           where (a.NombreProceso == "Cambio Carrera") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Cambio Carrera")
                {

                    ca.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            var camCarr = "";
            dbTICsDataContext db = new dbTICsDataContext();

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Cambio Carrera") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Cambio Carrera")
                {

                    camCarr= item.Proceso;

                }
            }

            var mensaje = "<h1>Cambio de Carrera</h1>" + camCarr;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Cambio de Carrera", mensaje);
            msgMail.Visible = true;
            txtDestinatario.Text = "";
        }
    }
}