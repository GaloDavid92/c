using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserPMatriculacion : System.Web.UI.Page
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
                           where (a.NombreProceso == "Matriculacion") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Matriculacion")
                {

                    ma.InnerHtml = item.Proceso;

                }
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            var pMatriculacion = "";
            dbTICsDataContext db = new dbTICsDataContext();

            var agregar = (from a in db.Procesos
                           where (a.NombreProceso == "Matriculacion") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreProceso == "Matriculacion")
                {

                    pMatriculacion = item.Proceso;

                }
            }
            var mensaje = "<h1>Proceso de Matriculación</h1>" + pMatriculacion;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Proceso de Matriculación", mensaje);
            msgMail.Visible = true;
            txtDestinatario.Text = "";
        }
    }
}