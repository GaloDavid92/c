using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserMatriz : System.Web.UI.Page
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
                           where (a.NombreObj == "Matriz de Trazabilidad") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Matriz de Trazabilidad")
                {

                    m.InnerHtml = item.Objetivo;

                }
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            var matrizT = "";
            dbTICsDataContext db = new dbTICsDataContext();

            var agregar = (from a in db.ObjetivosAprendizaje
                           where (a.NombreObj == "Matriz de Trazabilidad") && a.IdMalla == (int)Session["IdMallaU"]
                           select a).ToList();
            foreach (var item in agregar)
            {
                if (item.NombreObj == "Matriz de Trazabilidad")
                {

                    matrizT = item.Objetivo;

                }
            }
            var mensaje = "<h1>Matriz de Trazabilidad</h1>" + matrizT;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Matriz de Trazabilidad", mensaje);
            msgMail.Visible = true;

        }
    }
}