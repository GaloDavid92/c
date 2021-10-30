using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class UserMaGra : System.Web.UI.Page
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
        [WebMethod]
        public static List<object> GetChartDataMatriculados()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var query = (from q in db.Matriculados
                         where q.IdMalla == (int)HttpContext.Current.Session["IdMallaU"]
                         select new { q.Periodo, q.Hombres, q.Mujeres }).ToList();

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
                "Periodo", "Hombres","Mujeres"
            });
            if (query != null)
            {
                foreach (var item in query)
                {
                    chartData.Add(new object[]
                                {
                        item.Periodo, item.Hombres,item.Mujeres
                                });

                }
            }
            return chartData;


        }

        [WebMethod]
        public static List<object> GetChartDataGraduados()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var query = (from q in db.Graduados
                         where q.IdMalla == (int)HttpContext.Current.Session["IdMallaU"]
                         select new { q.Periodo, q.Hombres, q.Mujeres }).ToList();

            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
                "Periodo", "Hombres","Mujeres"
            });
            if (query != null)
            {
                foreach (var item in query)
                {
                    chartData.Add(new object[]
                                {
                        item.Periodo, item.Hombres,item.Mujeres
                                });

                }
            }
            return chartData;
        }

        private void CargarDatos()
        {
            //mostrar datos en forma de barras 
            try
            {
                dbTICsDataContext db = new dbTICsDataContext();
                var mensajematricualdo = (from m in db.MensajesMaGra
                                          where m.IdMalla == (int)Session["IdMallaU"] && m.Titulo == "Matriculados"
                                          select m).FirstOrDefault();

                mensajematri.InnerHtml = mensajematricualdo.Mensaje;

                var mensajegraduados = (from m in db.MensajesMaGra
                                        where m.IdMalla == (int)Session["IdMallaU"] && m.Titulo == "Graduados"
                                        select m).FirstOrDefault();
                mensajegrad.InnerHtml = mensajegraduados.Mensaje;
            }
            catch
            {

                Response.Write("<script>window.alert('Sin registros');</script>");
                matriculados.Visible = true;
                graduados.Visible = true;
            }



        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();

            var mensajeMatricualdo = (from m in db.MensajesMaGra
                                      where m.IdMalla == (int)Session["IdMallaU"] && m.Titulo == "Matriculados"
                                      select m).FirstOrDefault().Mensaje;
            
            var mensajeGraduados = (from m in db.MensajesMaGra
                                    where m.IdMalla == (int)Session["IdMallaU"] && m.Titulo == "Graduados"
                                    select m).FirstOrDefault().Mensaje;

            var dataMatriculados = GetChartDataMatriculados().ToArray();
            var dataGraduados = GetChartDataGraduados().ToArray();

            var tablaMatr = "<table>";
            foreach (var i in dataMatriculados)
            {
                tablaMatr +=
                "<tr>" +
                "<td style='border: 1px solid black; '>" + ((Array)i).GetValue(0) + "</td>" +
                "<td style='border: 1px solid black; text-align: center;'>" + ((Array)i).GetValue(1) + "</td>" +
                "<td style='border: 1px solid black; text-align: center;'>" + ((Array)i).GetValue(2) + "</td>" +
                "</tr>";
            }
            tablaMatr += "</table>";

            var tablaGrad = "<table>";
            foreach (var i in dataGraduados)
            {
                tablaGrad +=
                "<tr>" +
                "<td style='border: 1px solid black;'>" + ((Array)i).GetValue(0) + "</td>" +
                "<td style='border: 1px solid black; text-align: center;'>" + ((Array)i).GetValue(1) + "</td>" +
                "<td style='border: 1px solid black; text-align: center;'>" + ((Array)i).GetValue(2) + "</td>" +
                "</tr>";
            }
            tablaGrad += "</table>";

            var mensaje = "<h1>Matriculados y Graduados</h1>" +
            "<h2>Matriculados</h2>" + mensajeMatricualdo + tablaMatr +
            "<h2>Graduados</h2>" + mensajeGraduados + tablaGrad;

            var dest = txtDestinatario.Text;
            SendMail sendMail = new SendMail("coordinaciontic.epn@gmail.com", "coordinacionTIC2021");
            sendMail.sendMail(dest, "Matriculados y Graduados", mensaje);
            msgMail.Visible = true;
            txtDestinatario.Text = "";
        }
    }
}