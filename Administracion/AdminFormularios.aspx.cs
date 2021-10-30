using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Administracion
{
    public partial class AdminFormularios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdMalla"] == null)
                    Response.Redirect("AdminPensum.aspx");
                CargarDatos();
            }
        }
        private void CargarDatos()
        {
            dbTICsDataContext db = new dbTICsDataContext();
            int n1 = 0;
            foreach (var item in db.FormSoli)
            {
                if (item.Tipo == "Formulario" && item.IdMalla == (int)Session["IdMalla"])
                    n1++;
            }

            var agregar = (from a in db.FormSoli
                           where (a.Tipo == "Formulario") && a.IdMalla == (int)Session["IdMalla"]
                           select a).ToList();
            gvFormularios.DataSource = agregar;
            gvFormularios.DataBind();

            //DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Formularios"));
            //FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);

            //gvFormularios.DataSource = fileInfo;
            //gvFormularios.DataBind();
        }
        protected void btnGuardarFormulario_Click(object sender, EventArgs e)
        {


            dbTICsDataContext db = new dbTICsDataContext();
            FormSoli nuevo = new FormSoli();
            nuevo.IdMalla = (int)Session["IdMalla"];
            nuevo.Tipo = "Formulario";
            nuevo.Nombre = txtNombre.Text;

            //string extencion = Path.GetExtension(fileFormulario.FileName);
            string extencion = Path.GetExtension(Server.HtmlEncode(fileFormulario.FileName)).ToLower();
            try
            {
                string saveDir = @"\Formularios\";
                string appPath = Request.PhysicalApplicationPath;

                if (fileFormulario.HasFile)
                {
                    string savePath = appPath + saveDir +
                        Server.HtmlEncode($"{txtNombre.Text}{extencion}");

                    fileFormulario.SaveAs(savePath);
                    nuevo.FormSoli1 = $"{txtNombre.Text}{extencion}";
                    db.FormSoli.InsertOnSubmit(nuevo);
                    db.SubmitChanges();
                    Response.Write("<script>window.message('Guardado con Éxito');</script>");

                }

            }
            catch (Exception ex)
            {
                //divOK.Visible = false;
                //divError.Visible = true;
            }
        }

        protected void gvFormularios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
        

        }

        protected void btnsubirarchivo_Click(object sender, EventArgs e)
        {
            if (fileFormulario.HasFile)
            {
                string fullPath = Path.Combine(Server.MapPath("~/Formularios"), fileFormulario.FileName);
                
                 int count = 1;

                string fileNameOnly = Path.GetFileNameWithoutExtension(fullPath);
                string extension = Path.GetExtension(fullPath);
                string path = Path.GetDirectoryName(fullPath);
                string newFullPath = fullPath;
                string tempFileNameOnly = fileNameOnly;
                while(File.Exists(newFullPath)) 
                {
                    tempFileNameOnly = fileNameOnly;
                    string tempFileName = string.Format("{0}({1})", fileNameOnly, count++);
                    newFullPath = Path.Combine(path, tempFileName + extension);
                    tempFileNameOnly = Path.GetFileNameWithoutExtension(newFullPath);
                    extension = Path.GetExtension(newFullPath);
                }
                fileFormulario.SaveAs(newFullPath);
                
                dbTICsDataContext db = new dbTICsDataContext();
                FormSoli formulario = new FormSoli();
                formulario.Tipo = "Formulario";
                formulario.FormSoli1 = tempFileNameOnly + extension;
                formulario.IdMalla = (int)Session["IdMalla"];
                formulario.Nombre = txtNombre.Text;
                db.FormSoli.InsertOnSubmit(formulario);
                db.SubmitChanges();
                Response.Redirect("AdminFormularios.aspx"); //se recarga la propia pagina

            }
        }

        protected void gvFormularios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            int id_form = (int)gvFormularios.DataKeys[index].Value;

            dbTICsDataContext db = new dbTICsDataContext();

            var formElim = (from f in db.FormSoli
                            where f.IdFormSoli == id_form
                            select f).First();

            string fullPath = Path.Combine(Server.MapPath("~/Formularios"), formElim.FormSoli1);
            FileInfo file = new FileInfo(fullPath);
            if (file.Exists)//check file exsit or not  
            {
                file.Delete();
            }

            db.FormSoli.DeleteOnSubmit(formElim);
            db.SubmitChanges();
            Response.Redirect("AdminFormularios.aspx"); //se recarga la propia pagina
        }
    }
}