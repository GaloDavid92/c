using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;

namespace Administracion
{
    public partial class AdminMaGra : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdMalla"] == null)
                    Response.Redirect("AdminPensum.aspx");
                CargarDatos();

                //idmal = (int)Session["IdMalla"];
                //GetChartDataMatriculados(idmal);
            }
        }

        [WebMethod]
        public static List<object> GetChartDataMatriculados()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var query = (from q in db.Matriculados
                         where q.IdMalla == (int)HttpContext.Current.Session["IdMalla"]
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
                         where q.IdMalla == (int)HttpContext.Current.Session["IdMalla"]
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
                                          where m.IdMalla == (int)Session["IdMalla"] && m.Titulo == "Matriculados"
                                          select m).FirstOrDefault();

                mensajematri.InnerHtml = mensajematricualdo.Mensaje;

                var mensajegraduados = (from m in db.MensajesMaGra
                                        where m.IdMalla == (int)Session["IdMalla"] && m.Titulo == "Graduados"
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
        protected void btnAgregarGraduados_Click(object sender, EventArgs e)
        {
            matriculados.Visible = false;
            graduados.Visible = false;
            agregargraduados.Visible = true;
            CargarGridGraduados();
        }

        protected void btnAgregarMatriculados_Click(object sender, EventArgs e)
        {
            matriculados.Visible = false;
            graduados.Visible = false;
            agregarmatriculados.Visible = true;

            dbTICsDataContext db = new dbTICsDataContext();
            var mensaje = (from m in db.MensajesMaGra
                           where m.IdMalla == (int)Session["IdMalla"] && m.Titulo == "Matriculados"
                           select m).FirstOrDefault();
            if (mensaje == null)
            {
                btnGuardarMensaje.Visible = true;
            }
            else
            {
                btnActualizarMensaje.Visible = true;
                btnGuardarMensaje.Visible = false;
                ckeMensajeMatriculados.Text = mensaje.Mensaje;
            }

            CargarGridMatriculados();


        }

        private void CargarGridGraduados()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var cargar = from c in db.Graduados
                         where c.IdMalla == (int)Session["IdMalla"]
                         select c;
            if (cargar.Count() > 0)
            {
                gvGraduados.DataSource = cargar;
                gvGraduados.DataBind();
            }

        }

        protected void btnGuardarMatriculados_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Matriculados nuevo = new Matriculados();
            nuevo.Periodo = txtPeriodoMatriculados.Text;
            nuevo.IdMalla = (int)Session["IdMalla"];
            nuevo.Hombres = int.Parse(txtHombresMatriculados.Text);
            nuevo.Mujeres = int.Parse(txtMujeresMatriculados.Text);
            db.Matriculados.InsertOnSubmit(nuevo);
            db.SubmitChanges();
            CargarGridMatriculados();
            BorrarMatriculados();


            //egreso.Visible = true;
            //agregaregreso.Visible = false;
            //btnActualizarEgreso.Visible = true;
            //btnAgregarEgreso.Visible = false;
        }
        private void CargarGridMatriculados()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var cargar = from c in db.Matriculados
                         where c.IdMalla == (int)Session["IdMalla"]
                         select c;
            if (cargar.Count() > 0)
            {
                gvMatriculados.DataSource = cargar;
                gvMatriculados.DataBind();
            }
            //var mensaje = (from m in db.MensajesMaGra
            //               where m.IdMalla == (int)Session["IdMalla"] && m.Titulo == "Matriculados"
            //               select m).FirstOrDefault();
            //ckeMensajeMatriculados.Text = mensaje.Mensaje;
        }
        private void BorrarMatriculados()
        {
            txtHombresMatriculados.Text = "";
            txtMujeresMatriculados.Text = "";
            txtPeriodoMatriculados.Text = "";

        }
        private void BorrarGraduados()
        {
            txtHombresGraduados.Text = "";
            txtMujeresGraduados.Text = "";
            txtPeriodoGraduados.Text = "";
        }
        protected void btnCancelarMatriculados_Click(object sender, EventArgs e)
        {
            CargarDatos();
            matriculados.Visible = true;
            graduados.Visible = true;
            agregarmatriculados.Visible = false;
        }

        protected void gvMatriculados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                dbTICsDataContext db = new dbTICsDataContext();

                int index = Convert.ToInt32(e.CommandArgument);
                int id_pro = (int)gvMatriculados.DataKeys[index].Value;
                Session["idmatriculado"] = id_pro;
                var estudiantes = (from c in db.Matriculados
                                   where c.IdMatriculados == id_pro
                                   select c).First();

                txtPeriodoMatriculados.Text = estudiantes.Periodo;
                txtHombresMatriculados.Text = estudiantes.Hombres.ToString();
                txtMujeresMatriculados.Text = estudiantes.Mujeres.ToString();
                btnGuardarMatriculados.Visible = false;
                btnGuardarActualizarMatriculados.Visible = true;

            }
        }

        protected void btnGuardarActualizarMatriculados_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Matriculados
                       where a.IdMalla == (int)Session["IdMalla"] && a.IdMatriculados == (int)Session["idmatriculado"]
                       select a).First();
            act.Periodo = txtPeriodoMatriculados.Text;
            act.Hombres = int.Parse(txtHombresMatriculados.Text);
            act.Mujeres = int.Parse(txtMujeresMatriculados.Text);
            db.SubmitChanges();

            CargarGridMatriculados();
            BorrarMatriculados();
            btnGuardarActualizarMatriculados.Visible = false;
            btnGuardarMatriculados.Visible = true;
        }

        protected void btnGuardarMensaje_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            MensajesMaGra nuevomsn = new MensajesMaGra();
            nuevomsn.Titulo = "Matriculados";
            nuevomsn.IdMalla = (int)Session["IdMalla"];
            nuevomsn.Mensaje = ckeMensajeMatriculados.Text;
            db.MensajesMaGra.InsertOnSubmit(nuevomsn);
            db.SubmitChanges();
            btnGuardarMensaje.Visible = false;
            btnActualizarMensaje.Visible = true;
        }

        protected void btnActualizarMensaje_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var actua = (from a in db.MensajesMaGra
                         where a.IdMalla == (int)Session["IdMalla"] && a.Titulo == "Matriculados"
                         select a).First();
            actua.Mensaje = ckeMensajeMatriculados.Text;
            db.SubmitChanges();
        }

        protected void btnEditarGraduados_Click(object sender, EventArgs e)
        {
            matriculados.Visible = false;
            graduados.Visible = false;
            agregargraduados.Visible = true;

            dbTICsDataContext db = new dbTICsDataContext();
            var mensaje = (from m in db.MensajesMaGra
                           where m.IdMalla == (int)Session["IdMalla"] && m.Titulo == "Graduados"
                           select m).FirstOrDefault();
            if (mensaje == null)
            {
                btnGuardarMensajeGraduados.Visible = true;
            }
            else
            {
                btnActualizarMensajeGraduados.Visible = true;
                btnGuardarMensajeGraduados.Visible = false;
                ckeMensajeGraduados.Text = mensaje.Mensaje;
            }

            CargarGridGraduados();
        }

        protected void btnGuardarMensajeGraduados_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            MensajesMaGra nuevomsn = new MensajesMaGra();
            nuevomsn.Titulo = "Graduados";
            nuevomsn.IdMalla = (int)Session["IdMalla"];
            nuevomsn.Mensaje = ckeMensajeGraduados.Text;
            db.MensajesMaGra.InsertOnSubmit(nuevomsn);
            db.SubmitChanges();
            btnGuardarMensajeGraduados.Visible = false;
            btnActualizarMensajeGraduados.Visible = true;
        }

        protected void btnActualizarMensajeGraduados_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var actua = (from a in db.MensajesMaGra
                         where a.IdMalla == (int)Session["IdMalla"] && a.Titulo == "Graduados"
                         select a).First();
            actua.Mensaje = ckeMensajeGraduados.Text;
            db.SubmitChanges();
        }

        protected void btnGuardarGraduados_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Graduados nuevo = new Graduados();
            nuevo.Periodo = txtPeriodoGraduados.Text;
            nuevo.IdMalla = (int)Session["IdMalla"];
            nuevo.Hombres = int.Parse(txtHombresGraduados.Text);
            nuevo.Mujeres = int.Parse(txtMujeresGraduados.Text);
            db.Graduados.InsertOnSubmit(nuevo);
            db.SubmitChanges();
            CargarGridGraduados();
            BorrarGraduados();
        }

        protected void gvGraduados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                dbTICsDataContext db = new dbTICsDataContext();

                int index = Convert.ToInt32(e.CommandArgument);
                int id_pro = (int)gvGraduados.DataKeys[index].Value;
                Session["idgraduados"] = id_pro;
                var estudiantes = (from c in db.Graduados
                                   where c.IdGraduados == id_pro
                                   select c).First();

                txtPeriodoGraduados.Text = estudiantes.Periodo;
                txtHombresGraduados.Text = estudiantes.Hombres.ToString();
                txtMujeresGraduados.Text = estudiantes.Mujeres.ToString();
                btnGuardarGraduados.Visible = false;
                btnGuardarActualizarGraduados.Visible = true;

            }
        }

        protected void btnGuardarActualizarGraduados_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var act = (from a in db.Graduados
                       where a.IdMalla == (int)Session["IdMalla"] && a.IdGraduados == (int)Session["idgraduados"]
                       select a).First();
            act.Periodo = txtPeriodoGraduados.Text;
            act.Hombres = int.Parse(txtHombresGraduados.Text);
            act.Mujeres = int.Parse(txtMujeresGraduados.Text);
            db.SubmitChanges();

            CargarGridGraduados();
            BorrarGraduados();
            btnGuardarGraduados.Visible = true;
            btnGuardarActualizarGraduados.Visible = false;
        }

        protected void btnCancelarGraduados_Click(object sender, EventArgs e)
        {
            CargarDatos();
            matriculados.Visible = true;
            graduados.Visible = true;
            agregargraduados.Visible = false;
        }
    }
}