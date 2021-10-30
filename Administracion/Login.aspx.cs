using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IdMalla"] = null;
               
            }
        }

        protected void btnInicioSesion_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var administrador = (from a in db.Administradores
                                select a).First();
            if (txtUsuario.Text == administrador.Usuario && txtContrasena.Text == administrador.Contraseña)
            {
                Response.Redirect("AdminInicio.aspx");
            }
        }
    }
}