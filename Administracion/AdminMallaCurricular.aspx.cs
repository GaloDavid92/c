using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class MallaCurricular1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {


                if (Session["IdMalla"] == null)
                    Response.Redirect("AdminPensum.aspx");
                CargarDDLUnidad();
                CargarDDLCampo();

                dbTICsDataContext db = new dbTICsDataContext();
                var periodo = (from p in db.MallaCurricular
                               where p.IdMalla == (int)Session["IdMalla"]
                               select p.Pensum).First();
                lblPensum.Text = periodo;
                LlenarDatosAsignaturas("");
                //llenar lista materias para prerrequisitos
                 
                 CargarPrerrequisitos();
               

            }
            AgregarAsignaturas();

        }

        private void CargarPrerrequisitos()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var todas = (from t in db.Asignaturas
                         where t.IdMalla == (int)Session["IdMalla"]
                         select new { t.IdAsignatura, t.Nombre, t.Codigo }).ToList();

            foreach (var item in todas)
            {
                List<ListaTodas> todasmaterias = new List<ListaTodas>();
                ListaTodas agregarmateria = new ListaTodas();
                if (Session["todasmaterias"] != null)
                {
                    todasmaterias = (List<ListaTodas>)Session["todasmaterias"];
                }
                agregarmateria.Id = item.IdAsignatura;
                agregarmateria.Codigo = item.Codigo;
                agregarmateria.Asignatura = item.Nombre;
                todasmaterias.Add(agregarmateria);
                Session["todasmaterias"] = todasmaterias;

                //gvArticulos.DataSource = todasmaterias;
                //gvArticulos.DataBind();
            }
            
        }
        private void CargarDDLCampo()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var campos = from c in db.CamposFormacion
                         where c.IdMalla == (int)Session["IdMalla"]
                         select c;
            ddlCampo.DataSource = campos;
            ddlCampo.DataTextField = "NombreCampo";
            ddlCampo.DataValueField = "IdCampo";
            ddlCampo.DataBind();
        }
        private void CargarDDLUnidad()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var uni = from c in db.Unidades
                      where c.IdMalla == (int)Session["IdMalla"]
                      select c;

            ddlUnidad.DataSource = uni;
            ddlUnidad.DataTextField = "NombreUnidad";
            ddlUnidad.DataValueField = "IdUnidades";
            ddlUnidad.DataBind();
        }
        private void CargarExtras()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var totalasig = (from t in db.Asignaturas
                             where t.IdMalla == (int)Session["IdMalla"]
                             select t).ToList();
            var totalcampos = (from c in db.CamposFormacion
                               where c.IdMalla == (int)Session["IdMalla"]
                               select c).ToList();
            var totalunidades = (from u in db.Unidades
                                 where u.IdMalla == (int)Session["IdMalla"]
                                 select u).ToList();
            foreach (var item in totalcampos)
            {
                item.Horas = 0;
                db.SubmitChanges();
            }
            foreach (var item in totalunidades)
            {
                item.Horas = 0;
                db.SubmitChanges();
            }
            /////////////////////////Sumar Campos de Formacion
            foreach (var item in totalasig)
            {
                foreach (var camp in totalcampos)
                {
                    int campo = 0;
                    if (item.IdCampo == camp.IdCampo)
                    {
                        campo = Convert.ToInt32((item.CompDocenci + item.CompPractico + item.ApreAutonomo) * 16);
                        camp.Horas = camp.Horas + campo;
                        db.SubmitChanges();
                    }
                }
            }
            /////////////////////////Sumar unidades
            foreach (var item in totalasig)
            {
                foreach (var uni in totalunidades)
                {
                    int unidad = 0;
                    if (item.IdUnidad == uni.IdUnidades)
                    {
                        unidad = Convert.ToInt32((item.CompDocenci + item.CompPractico + item.ApreAutonomo) * 16);
                        uni.Horas = uni.Horas + unidad;
                        db.SubmitChanges();
                    }
                }
            }

            var mostrarcampos = from c in db.CamposFormacion
                                where c.IdMalla == (int)Session["IdMalla"]
                                select c;
            gvCamposDeFormacion.DataSource = mostrarcampos;
            gvCamposDeFormacion.DataBind();

            var mostrarunidad = from c in db.Unidades
                                where c.IdMalla == (int)Session["IdMalla"]
                                select c;
            gvUnidadesOrganizacion.DataSource = mostrarunidad;
            gvUnidadesOrganizacion.DataBind();
        }
        private void LlenarDatosAsignaturas(string dato)
        {

            dbTICsDataContext db = new dbTICsDataContext();
            var asignaturas = from c in db.Asignaturas
                              where c.IdMalla == (int)Session["IdMalla"]
                              select c;
            if (asignaturas.Count() > 0)
            {
                gvAsignaturas.DataSource = asignaturas;
                gvAsignaturas.DataBind();
            }
        }
        private void LLenarTodasAsignaturasActualizar()
        {
            try
            {
                dbTICsDataContext db = new dbTICsDataContext();
                var llenar = db.palmaTodasAsignaturas((int)Session["IdMalla"], (int)Session["asignatura"]).ToList();
                if (llenar.Count() > 0)
                {
                    gvTodasAsignaturas.DataSource = llenar;
                    gvTodasAsignaturas.DataBind();
                }
            }
            catch
            {

            }

        }
        private void LLenarTodasAsignaturas()
        {

            dbTICsDataContext db = new dbTICsDataContext();
            var llenar = from ll in db.Asignaturas
                         where ll.IdMalla == (int)Session["IdMalla"]
                         select ll;
            if (llenar.Count() > 0)
            {
                gvTodasAsignaturas.DataSource = llenar;
                gvTodasAsignaturas.DataBind();
            }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            agregar.Visible = true;
            LLenarTodasAsignaturas();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            Asignaturas nueva = new Asignaturas();
            try
            {

                nueva.Codigo = txtCodigo.Text.ToUpper();
                nueva.Nombre = txtNombre.Text;
                nueva.CompDocenci = decimal.Parse(txtCompDocencia.Text);
                nueva.CompPractico = decimal.Parse(txtCompPractico.Text);
                nueva.ApreAutonomo = decimal.Parse(txtApreAutonomo.Text);
                nueva.IdCampo = int.Parse(ddlCampo.SelectedValue);
                nueva.IdUnidad = int.Parse(ddlUnidad.SelectedValue);
                nueva.IdMalla = (int)Session["IdMalla"];
                nueva.Semestre = int.Parse(txtSemeste.Text);
                nueva.Columna = int.Parse(txtColumna.Text);
                nueva.Pea = ckePea.Text;
                db.Asignaturas.InsertOnSubmit(nueva);
                db.SubmitChanges();

            }
            catch
            {
                lblCodigoError.Visible = true;
                lblCodigoError.Text = "El código ingresado ya ha sido usado";
            }

            try
            {
                List<Prerrequisito> lista = new List<Prerrequisito>();
                foreach (var item in (List<ListaPre>)Session["lista"])
                {
                    Prerrequisito agregar = new Prerrequisito();
                    agregar.IdAsignatura = nueva.IdAsignatura;
                    agregar.IdMalla = nueva.IdMalla;
                    agregar.Codigo = item.Codigo;
                    agregar.Nombre = item.Asignatura;

                    lista.Add(agregar);
                }
                db.Prerrequisito.InsertAllOnSubmit(lista);
                db.SubmitChanges();
            }
            catch
            {
                Response.Write("<script>window.alert('No hay prerrequisitos ingresados');</script>");

            }

            agregar.Visible = false;
            pensum.Visible = true;
            LlenarDatosAsignaturas("");
            Borrar();
        }

        protected void gvAsignaturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvAsignaturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAsignaturas.PageIndex = e.NewPageIndex;
            LlenarDatosAsignaturas("");

        }

        protected void gvAsignaturas_RowCommand1(object sender, GridViewCommandEventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            if (e.CommandName == "Select")
            {


                int index = Convert.ToInt32(e.CommandArgument);
                int id_pro = (int)gvAsignaturas.DataKeys[index].Value;
                Session["asignatura"] = id_pro;
                var asig = (from c in db.Asignaturas
                            where c.IdAsignatura == id_pro
                            select c).First();

                txtCodigo.Text = asig.Codigo;
                txtNombre.Text = asig.Nombre;
                txtCompDocencia.Text = asig.CompDocenci.ToString();
                txtCompPractico.Text = asig.CompPractico.ToString();
                txtApreAutonomo.Text = asig.ApreAutonomo.ToString();
                ddlCampo.SelectedValue = asig.IdCampo.ToString();
                ddlUnidad.SelectedValue = asig.IdUnidad.ToString();
                ckePea.Text = asig.Pea;
                txtSemeste.Text = asig.Semestre.ToString();
                txtColumna.Text = asig.Columna.ToString();

                List<ListaPre> lista = new List<ListaPre>();
                var prerrequisitos = from c in db.Prerrequisito
                                     where c.IdAsignatura == id_pro
                                     select new { c.IdPre, c.Codigo, c.Nombre };
                foreach (var item in prerrequisitos)
                {
                    ListaPre actualizar = new ListaPre();
                    actualizar.Id = item.IdPre;
                    actualizar.Codigo = item.Codigo;
                    actualizar.Asignatura = item.Nombre;
                    lista.Add(actualizar);

                }
                Session["lista"] = lista; //
                gvPrerrequisitos.DataSource = lista;
                gvPrerrequisitos.DataBind();

                btnActualizar.Visible = true;
                btnGuardar.Visible = false;
                agregar.Visible = true;
                pensum.Visible = false;
                LLenarTodasAsignaturasActualizar();

            }
            if (e.CommandName == "Eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                String codigo = gvAsignaturas.Rows[index].Cells[1].Text;
                var eliminar = (from r in db.Asignaturas
                                where r.Codigo == codigo && r.IdMalla == (int)Session["IdMalla"]
                                select r).First();
                db.Asignaturas.DeleteOnSubmit(eliminar);
                db.SubmitChanges();
                LlenarDatosAsignaturas("");


            }
        }

        protected void gvAsignaturas_PageIndexChanging1(object sender, GridViewPageEventArgs e)
        {
            gvAsignaturas.PageIndex = e.NewPageIndex;
            LlenarDatosAsignaturas("");
        }

        protected void btnPensum_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPensum.aspx");
        }

        protected void btnEditarCampos_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            agregar.Visible = false;

            camposformacion.Visible = true;
            CamposFormacion();
        }
        private void CamposFormacion()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var campo = from c in db.CamposFormacion
                        where c.IdMalla == (int)Session["IdMalla"]
                        select c;
            gvCampos.DataSource = campo;
            gvCampos.DataBind();
        }
        protected void btnGuardarCampo_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            agregar.Visible = true;

            camposformacion.Visible = false;
            dbTICsDataContext db = new dbTICsDataContext();
            var actu = (from t1 in db.CamposFormacion
                        where t1.IdCampo == (int)Session["campo"]
                        select t1).First();
            actu.SiglasCampo = txtSiglasCampo.Text;
            actu.NombreCampo = txtNombreCampo.Text;
            actu.Color = ddlColorCampo.SelectedValue;
            actu.IdMalla = (int)Session["IdMalla"];
            actu.Horas = 0;
            db.SubmitChanges();
            CamposFormacion();
            CargarDDLCampo();
        }

        protected void btnEditarUnidades_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            agregar.Visible = false;

            camposformacion.Visible = false;
            unidades.Visible = true;
            Unidades();
        }
        private void Unidades()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var unidad = from c in db.Unidades
                         select c;
            gvUnidades.DataSource = unidad;
            gvUnidades.DataBind();
        }
        protected void btnGuardarUnidades_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            agregar.Visible = true;

            camposformacion.Visible = false;
            unidades.Visible = false;

            dbTICsDataContext db = new dbTICsDataContext();
            var actu = (from t1 in db.Unidades
                        where t1.IdUnidades == (int)Session["unidad"]
                        select t1).First();
            actu.NombreUnidad = txtSiglasCampo.Text;
            actu.IdMalla = (int)Session["IdMalla"];
            actu.Horas = 0;
            db.SubmitChanges();
            Unidades();
            CargarDDLUnidad();
        }

        protected void gvCampos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                dbTICsDataContext db = new dbTICsDataContext();

                int index = Convert.ToInt32(e.CommandArgument);
                int id_pro = (int)gvCampos.DataKeys[index].Value;
                Session["campo"] = id_pro;
                var asig = (from c in db.CamposFormacion
                            where c.IdCampo == id_pro
                            select c).First();

                txtSiglasCampo.Text = asig.SiglasCampo;
                txtNombreCampo.Text = asig.NombreCampo;

            }
            //if (e.CommandName == "Eliminar")
            //{
            //    dbTICsDataContext db = new dbTICsDataContext();

            //    int index = Convert.ToInt32(e.CommandArgument);
            //    int id_pro = (int)gvCampos.DataKeys[index].Value;
            //    var asig = (from c in db.CamposFormacion
            //                where c.IdCampo == id_pro
            //                select c).First();
            //    db.CamposFormacion.DeleteOnSubmit(asig);
            //    db.SubmitChanges();
            //}
        }

        protected void btnCancelarCampo_Click(object sender, EventArgs e)
        {
            camposformacion.Visible = false;
            agregar.Visible = true;
        }

        protected void gvUnidades_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                dbTICsDataContext db = new dbTICsDataContext();

                int index = Convert.ToInt32(e.CommandArgument);
                int id_pro = (int)gvUnidades.DataKeys[index].Value;
                Session["unidad"] = id_pro;
                var asig = (from c in db.Unidades
                            where c.IdUnidades == id_pro
                            select c).First();
                txtNombreUnidad.Text = asig.NombreUnidad;

            }
        }

        protected void btnCancelarUnidad_Click(object sender, EventArgs e)
        {
            agregar.Visible = true;
            unidades.Visible = false;
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var actu = (from a in db.Asignaturas
                        where a.IdAsignatura == (int)Session["asignatura"]
                        select a).First();

            actu.Codigo = txtCodigo.Text;
            actu.Nombre = txtNombre.Text;
            actu.CompDocenci = decimal.Parse(txtCompDocencia.Text);
            actu.CompPractico = decimal.Parse(txtCompPractico.Text);
            actu.ApreAutonomo = decimal.Parse(txtApreAutonomo.Text);
            actu.IdCampo = int.Parse(ddlCampo.SelectedValue);
            actu.IdUnidad = int.Parse(ddlUnidad.SelectedValue);
            actu.IdMalla = (int)Session["IdMalla"];
            actu.Semestre = int.Parse(txtSemeste.Text);
            actu.Columna = int.Parse(txtColumna.Text);
            actu.Pea = ckePea.Text;
            db.SubmitChanges();

            var eliminar = from eli in db.Prerrequisito
                           where eli.IdAsignatura == (int)Session["asignatura"]
                           select eli;
            db.Prerrequisito.DeleteAllOnSubmit(eliminar);
            db.SubmitChanges();
            List<Prerrequisito> lista = new List<Prerrequisito>();
            foreach (var item in (List<ListaPre>)Session["lista"])//
            {
                Prerrequisito agregar = new Prerrequisito();
                agregar.Codigo = item.Codigo;
                agregar.Nombre = item.Asignatura;
                agregar.IdMalla = actu.IdMalla;
                agregar.IdAsignatura = (int)Session["asignatura"];
                lista.Add(agregar);
            }
            db.Prerrequisito.InsertAllOnSubmit(lista);
            db.SubmitChanges();

            agregar.Visible = false;
            pensum.Visible = true;
            LlenarDatosAsignaturas("");
            Borrar();
        }
        private void Borrar()
        {
            txtCodigo.Text = "";
            txtNombre.Text = "";
            txtApreAutonomo.Text = "";
            txtColumna.Text = "";
            txtCompDocencia.Text = "";
            txtCompPractico.Text = "";
            txtSemeste.Text = "";
            ckePea.Text = "";

            gvPrerrequisitos.DataSource = null;
            gvPrerrequisitos.DataBind();
            Session["lista"] = null;


        }

        protected void btnVista_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            vistaprevis.Visible = true;

            AgregarAsignaturas();
            CargarExtras();

        }

        private void AgregarAsignaturas()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            var materias = (from m in db.Asignaturas
                            where m.IdMalla == (int)Session["IdMalla"]
                            select m).ToList();
            var prerre = (from p in db.Prerrequisito
                          where p.IdMalla == (int)Session["IdMalla"]
                          select p).ToList();
            try
            {
                int semestre = Convert.ToInt32(db.proalmSemestre((int)Session["IdMalla"]).FirstOrDefault().Semestre);
                int columna = Convert.ToInt32(db.proalmColumna((int)Session["IdMalla"]).FirstOrDefault().Columna);
                tblDesplegar.Controls.Clear();
                if (semestre != 0 && columna != 0)
                {
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
                }
            }
            catch
            {
                Response.Write("<script>window.alert('Pensum acádemico sin registros');</script>");

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
                            where c.Nombre == aux && c.IdMalla == (int)Session["IdMalla"]
                            select c.Pea).FirstOrDefault();
            this.lblTituto.Text = aux;
            p.InnerHtml = consulta;
            pea.Visible = true;
            pensum.Visible = false;
            vistaprevis.Visible = false;

        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            pensum.Visible = true;
            vistaprevis.Visible = false;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            pensum.Visible = true;
            agregar.Visible = false;
            Borrar();
            Session["asignatura"] = null;
        }

        protected void gvAsignaturas_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            gvAsignaturas.Columns[8].Visible = false;
        }

        protected void gvTodasAsignaturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                dbTICsDataContext db = new dbTICsDataContext();

                int index = Convert.ToInt32(e.CommandArgument);
                int id_pro = (int)gvTodasAsignaturas.DataKeys[index].Value;
                var asig = (from c in db.Asignaturas
                            where c.IdAsignatura == id_pro
                            select new { c.IdAsignatura, c.Codigo, c.Nombre }).First();

                gvTodasAsignaturas.Rows[index].Enabled = false;
                List<ListaPre> lista = new List<ListaPre>();
                ListaPre agregar = new ListaPre();
                if (Session["lista"] != null)
                {
                    lista = (List<ListaPre>)Session["lista"];
                }
                agregar.Id = asig.IdAsignatura;
                agregar.Codigo = asig.Codigo;
                agregar.Asignatura = asig.Nombre;
                lista.Add(agregar);
                Session["lista"] = lista;
                gvPrerrequisitos.DataSource = (List<ListaPre>)Session["lista"];
                gvPrerrequisitos.DataBind();
            }
        }

        protected void gvPrerrequisitos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                EliminarProductoSelec(index);


            }
        }
        private void EliminarProductoSelec(int index)
        {
            String codigo = gvPrerrequisitos.Rows[index].Cells[0].Text;
            dbTICsDataContext db = new dbTICsDataContext();
            var consulta = (from c in db.Asignaturas
                            where c.Codigo == codigo
                            select c.IdAsignatura).First();
            List<ListaPre> itemspre = Session["lista"] as List<ListaPre>;//
            gvTodasAsignaturas.Rows[consulta].Enabled = true;
            var item = itemspre.Find(x => x.Codigo == codigo);
            itemspre.Remove(item);

            gvPrerrequisitos.DataSource = itemspre;
            gvPrerrequisitos.DataBind();
        }

        protected void btnCerrarPea_Click(object sender, EventArgs e)
        {
            pensum.Visible = false;
            vistaprevis.Visible = true;
            pea.Visible = false;
        }

        protected void gvTodasAsignaturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTodasAsignaturas.PageIndex = e.NewPageIndex;
            LLenarTodasAsignaturasActualizar();
        }

        protected void gvComponentes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        /* protected void btnSeleccionar_Click(object sender, EventArgs e)
         {
             foreach (GridViewRow row in gvArticulos.Rows)
             {
                 CheckBox check = row.FindControl("chkSeleccion") as CheckBox;

                 if (check.Checked)
                 {
                     //
                     // Se arma la fila para el DataSet de seleccion
                     //
                     List<ListaPre> lista = new List<ListaPre>();
                     ListaPre agregar = new ListaPre();
                     if (Session["lista"] != null)
                     {
                         lista = (List<ListaPre>)Session["lista"];
                     }
                     agregar.Id = Convert.ToInt32(gvArticulos.DataKeys[row.RowIndex].Value);
                     agregar.Codigo = row.Cells[1].Text;
                     agregar.Asignatura = row.Cells[2].Text;

                     lista.Add(agregar);
                     Session["lista"] = lista;
                     //
                     // Se busca el registro en el DataTabla por el Id
                     // este metodo devolvera una coleccion de filas, pero es sabido 
                     // de antemano que solo sera encontrado una row para el filtro utilizado
                     //
                     List<ListaTodas> itemspre = Session["todasmaterias"] as List<ListaTodas>;//
                     int id = Convert.ToInt32(gvArticulos.DataKeys[row.RowIndex].Value);
                     var item = itemspre.Find(x => x.Id == id);
                     itemspre.Remove(item);

                 }
             }

             gvArticulos.DataSource = (List<ListaTodas>)Session["todasmaterias"];
             gvArticulos.DataBind();

             gvSeleccion.DataSource = (List<ListaPre>)Session["lista"];
             gvSeleccion.DataBind();

         }

         protected void btnQuitar_Click(object sender, EventArgs e)
         {
             List<ListaTodas> materias = Session["todasmaterias"] as List<ListaTodas>;
             List<ListaPre> prerequisitos = Session["lista"] as List<ListaPre>;

             foreach (GridViewRow row in gvSeleccion.Rows)
             {
                 CheckBox check = row.FindControl("chkSeleccion0") as CheckBox;

                 if (check.Checked)
                 {
                     ListaTodas articulo = new ListaTodas();
                     articulo.Id = Convert.ToInt32(gvSeleccion.DataKeys[row.RowIndex].Value);
                     articulo.Codigo = row.Cells[1].Text;
                     articulo.Asignatura = row.Cells[2].Text;

                     materias.Add(articulo);
                     Session["todasmaterias"] = materias;
                     int id = Convert.ToInt32(gvSeleccion.DataKeys[row.RowIndex].Value);
                     var item = prerequisitos.Find(x => x.Id == id);
                     prerequisitos.Remove(item);

                 }
             }

             gvArticulos.DataSource = (List<ListaTodas>)Session["todasmaterias"];
             gvArticulos.DataBind();

             gvSeleccion.DataSource = (List<ListaPre>)Session["lista"];
             gvSeleccion.DataBind();
         } */
    }


}