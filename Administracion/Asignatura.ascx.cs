using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{

    public partial class Asignatura : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public Button Nombre
        {
            get
            {
                return btnNombre;
            }
            set
            {
                btnNombre = value;
            }
        }

        public Label Horas
        {
            get
            {
                return lblHorasSem;
            }
            set
            {
                lblHorasSem = value;
            }
        }
        public Label HorasSema
        {
            get
            {
                return lblHorasSema;
            }
            set
            {
                lblHorasSema = value;
            }
        }
        public Label cd
        {
            get
            {
                return lblcd;
            }
            set
            {
                lblcd = value;
            }
        }
        public Label cp
        {
            get
            {
                return lblcp;
            }
            set
            {
                lblcp = value;
            }
        }
        public Label aa
        {
            get
            {
                return lblaa;
            }
            set
            {
                lblaa = value;
            }
        }
        public Label Codigo
        {
            get
            {
                return lblCodigo;
            }
            set
            {
                lblCodigo = value;
            }
        }

        public Label Campo
        {
            get
            {
                return lblCampo;
            }
            set
            {
                lblCampo = value;
            }
        }
        public event EventHandler AceptarClicked;
        protected virtual void OnClick(object sender)
        {
            if (this.AceptarClicked != null)
            {
                this.AceptarClicked(sender, new EventArgs());
            }
        }

        private string resultados;
        public String Resultados
        {
            get { return resultados; }
            set { resultados = value; }
        }
        protected void btnNombre_Click(object sender, EventArgs e)
        {
            
            OnClick(sender);
        }


    }
}