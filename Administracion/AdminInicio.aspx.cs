using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminInicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            actualizarimagenes.Visible = true;
            imagenes.Visible = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            actualizarimagenes.Visible = false;
            imagenes.Visible = true;
        }
    }
}