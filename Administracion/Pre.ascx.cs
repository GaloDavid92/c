using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class Pre : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public Label Prerre
        {
            get
            {
                return lblPre;
            }
            set
            {
                lblPre = value;
            }
        }
        
    }
}