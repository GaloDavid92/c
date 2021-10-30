using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserMallaCurricular : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdMallaU"] == null)
                    Response.Redirect("UserPensum.aspx");

            }
            AgregarAsignaturas();
        }
        private void AgregarAsignaturas()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var materias = (from m in db.Asignaturas
                            where m.IdMalla == (int)Session["IdMallaU"]
                            select m).ToList();
            var prerre = (from p in db.Prerrequisito
                          where p.IdMalla == (int)Session["IdMallaU"]
                          select p).ToList();
            var semestre = (db.proalmSemestre((int)Session["IdMallaU"]).First()).Semestre;
            var columna = db.proalmColumna((int)Session["IdMallaU"]).First().Columna;
            tblDesplegar.Controls.Clear();

            for (int i = 0; i <= semestre; i++)
            {
                TableRow rowNew = new TableRow();
                tblDesplegar.Controls.Add(rowNew);
                for (int j = 0; j <= columna; j++)
                {

                    TableCell cellNew = new TableCell();
                    rowNew.Controls.Add(cellNew);
                    if (i != 0)
                    {
                        cellNew.Text = i.ToString();
                    }

                }

            }
            foreach (var item in materias)
            {
                Asignatura datos = new Asignatura();
                datos = (Asignatura)LoadControl("~/Asignatura.ascx");
                datos.ID = item.IdAsignatura.ToString();
                datos.cd.Text = item.CompDocenci.ToString();
                datos.cp.Text = item.CompPractico.ToString();
                datos.aa.Text = item.ApreAutonomo.ToString();
                datos.Horas.Text = ((item.CompDocenci + item.CompPractico + item.ApreAutonomo) * 16).ToString();
                datos.HorasSema.Text = (item.CompDocenci + item.CompPractico + item.ApreAutonomo).ToString();
                datos.Nombre.Text = item.Nombre;
                datos.Campo.Text = item.CamposFormacion.SiglasCampo;
                string c = item.CamposFormacion.Color;
                datos.Campo.BackColor = System.Drawing.ColorTranslator.FromHtml(c);
                datos.Codigo.Text = item.Codigo;
                
                    datos.Nombre.CommandName = item.Nombre;
                    datos.Nombre.Click += new EventHandler(Test_AceptarClicked);

                int i = Convert.ToInt32(item.Semestre);
                int j = Convert.ToInt32(item.Columna);


                foreach (var pre in prerre)
                {
                    if (pre.IdAsignatura == item.IdAsignatura)
                    {
                        Pre p = new Pre();
                        p = (Pre)LoadControl("~/Pre.ascx");
                        p.Prerre.Text = pre.Codigo;

                        tblDesplegar.Rows[i].Cells[j].Controls.Add(p);
                    }
                }

                tblDesplegar.Rows[i].Cells[j].Controls.Add(datos);
            }

        }
        protected void Test_AceptarClicked(object sender, EventArgs e)
        {
           
                dbTICsDataContext db = new dbTICsDataContext();
                Button nombre = sender as Button;
                string aux = nombre.CommandName;
                var consulta = (from c in db.Asignaturas
                                where c.Nombre == aux && c.IdMalla == (int)Session["IdMallaU"]
                                select c.Pea).FirstOrDefault();
                titulo.InnerHtml = aux;
                planestudios.InnerHtml = consulta;

            //string modalScript = @"<script type=""text/javascript"">
            //function openModal() {
            //$('#myModal').modal('show');
            //}
            //</script>";
            //ScriptManager.RegisterStartupScript(this, GetType(), "bsChgPwdModal", modalScript, false);

            pea.Visible = true;

            vista.Visible = false;

        }
        protected void btnCerrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCerrarPea_Click2(object sender, EventArgs e)
        {
            pea.Visible = false;
            vista.Visible = true;
        }
    }
}