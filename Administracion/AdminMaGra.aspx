<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminMaGra.aspx.cs" Inherits="Administracion.AdminMaGra" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- script para grafica --%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                
                width: 600,
                height: 400,
                bar: { groupWidth: "95%" },
                legend: { position: "none" },
                isStacked: true
            };
            $.ajax({
                type: "POST",
                url: "AdminMaGra.aspx/GetChartDataMatriculados",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.ColumnChart($("#chartmatriculados")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                
                width: 600,
                height: 400,
                bar: { groupWidth: "95%" },
                legend: { position: "none" },
                isStacked: true
            };
            $.ajax({
                type: "POST",
                url: "AdminMaGra.aspx/GetChartDataGraduados",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.ColumnChart($("#chartgraduados")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>


    <div id="page-wrapper">
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <form runat="server">
                <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                <!--matriculados#########################################################################################-->
                <div class="panel panel-pricing" style="background-color: transparent">
                    <div class="panel-heading text-center" style="color: orange">
                        <h1>Matriculados y Graduados
                        </h1>
                    </div>
                    <div class="panel-body" style="background-color: transparent">
                        <div runat="server" id="matriculados" visible="true">
                            <div class="panel panel-pricing" style="background-color: transparent">
                                <div class="panel-heading text-center" style="color: azure">
                                    <h3><b>Número de Estudiantes Matriculados</b></h3>
                                </div>
                                <div class="panel-body" style="background-color: transparent">

                                    <div class="col-sm-12">
                                        <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                            <div runat="server" id="mensajematri">
                                            </div>
                                        </div>
                                        <div class="col-sm-8 col-sm-offset-3 text-center" style="color: azure">
                                                                                           
                                            <div id="chartmatriculados">
                                            </div>
                                        </div>

                                        <div class="col-sm-12 col-sm-offset-0">
                                            <div class="form-group">
                                                <div class="col-md-12 text-center-md item-caption">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-sm-offset-0">
                                            <div class="form-group">
                                                <div class="col-md-12 text-center-md item-caption">
                                                    <asp:Button ID="btnAgregarMatriculados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Editar Matriculados" OnClick="btnAgregarMatriculados_Click" Style="height: 36px" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--fin matriculados#########################################################################################-->
                        <!-- graduados====================================================================================================-->
                        <div runat="server" id="graduados" visible="true">
                            <div class="panel panel-pricing" style="background-color: transparent">
                                <div class="panel-heading text-center" style="color: azure">
                                    <h3><b>Número de Estudiantes Graduados</b></h3>
                                </div>
                                <div class="panel-body" style="background-color: transparent">
                                    <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                        <div runat="server" id="mensajegrad">
                                        </div>
                                    </div>
                                    <<div class="col-sm-8 col-sm-offset-3 text-justify" style="color: azure">
                                        <div id="chartgraduados">
                                            </div>
                                    </div>

                                    <div class="col-sm-12 col-sm-offset-0">
                                        <div class="form-group">
                                            <div class="col-md-12 text-center-md item-caption">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-sm-offset-0">
                                        <div class="form-group">
                                            <div class="col-md-12 text-center-md item-caption">
                                                <asp:Button ID="btnEditarGraduados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Editar Graduados" OnClick="btnEditarGraduados_Click" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--fin graduados====================================================================================================-->
                <!--Agregar Matriculados#########################################################################################-->
                <div class="row">
                    <div class="col-lg-12 col-xs-12">
                        <div runat="server" id="agregarmatriculados" visible="false">
                            <div class="col-sm-6 col-sm-offset-3">
                                <div class="panel panel-pricing" style="background-color: aliceblue">
                                    <div class="panel-heading text-center">
                                        <h2>Editar Matriculados</h2>
                                    </div>
                                    <div class="panel-body" style="background-color: aliceblue">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon">Texto</i></span>
                                                <CKEditor:CKEditorControl ID="ckeMensajeMatriculados" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 text-center-md item-caption">
                                                <asp:Button ID="btnGuardarMensaje" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar Texto" OnClick="btnGuardarMensaje_Click" />
                                                <asp:Button ID="btnActualizarMensaje" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar Texto" Visible="false" OnClick="btnActualizarMensaje_Click" />

                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 text-center-md item-caption">
                                                <br />
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon"><i class="fa fa-fw fa-list-ul"></i></span>
                                                <asp:TextBox ID="txtPeriodoMatriculados" runat="server" class="form-control" placeholder="Periodo Académico"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon"><i class="fa fa-fw fa-male"></i></span>
                                                <asp:TextBox ID="txtHombresMatriculados" runat="server" class="form-control" placeholder="Número de Estudiantes Hombres"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon"><i class="fa fa-fw fa-female"></i></span>
                                                <asp:TextBox ID="txtMujeresMatriculados" runat="server" class="form-control" placeholder="Número de Estudiantes Mujeres"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-12 text-center table-responsive">
                                            <asp:GridView ID="gvMatriculados" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdMatriculados" Width="440px" AllowPaging="True" OnRowCommand="gvMatriculados_RowCommand">
                                                <RowStyle BackColor="#EFF3FB" />
                                                <Columns>
                                                    <asp:ButtonField CommandName="Select" Text="Actualizar" />

                                                    <asp:BoundField DataField="Periodo" HeaderText="Periodo Académico" />
                                                    <asp:BoundField DataField="Hombres" HeaderText="N° Estudiantes Hombres" />
                                                    <asp:BoundField DataField="Mujeres" HeaderText="N° Estudiantes Mujeres" />

                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerSettings NextPageText="Siguiente" PageButtonCount="15" PreviousPageText="Anterior" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 text-center-md item-caption">
                                                <asp:Button ID="btnGuardarMatriculados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarMatriculados_Click" />
                                                <asp:Button ID="btnGuardarActualizarMatriculados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnGuardarActualizarMatriculados_Click" />

                                            </div>
                                            <div class="col-md-6 text-center-md item-caption">
                                                <asp:Button ID="btnCancelarMatriculados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarMatriculados_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--fin agregar matriculados #########################################################################################-->
                <!--Agregar graduados#########################################################################################-->
                <div class="row">
                    <div class="col-lg-12 col-xs-12">
                        <div runat="server" id="agregargraduados" visible="false">
                            <div class="col-sm-6 col-sm-offset-3">
                                <div class="panel panel-pricing" style="background-color: aliceblue">
                                    <div class="panel-heading text-center">
                                        <h2>Editar Graduados</h2>
                                    </div>
                                    <div class="panel-body" style="background-color: aliceblue">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon"><i class="fa fa-fw fa-list-ul"></i></span>
                                                <CKEditor:CKEditorControl ID="ckeMensajeGraduados" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 text-center-md item-caption">
                                                <asp:Button ID="btnGuardarMensajeGraduados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar Texto" OnClick="btnGuardarMensajeGraduados_Click" />
                                                <asp:Button ID="btnActualizarMensajeGraduados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar Texto" Visible="false" OnClick="btnActualizarMensajeGraduados_Click" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-12 text-center-md item-caption">
                                                <br />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon"><i class="fa fa-fw fa-list-ul"></i></span>
                                                <asp:TextBox ID="txtPeriodoGraduados" runat="server" class="form-control" placeholder="Periodo Académico"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon"><i class="fa fa-fw fa-male"></i></span>
                                                <asp:TextBox ID="txtHombresGraduados" runat="server" class="form-control" placeholder="Número de Estudiantes Hombres"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group input-group-lg">
                                                <span class="input-group-addon"><i class="fa fa-fw fa-female"></i></span>
                                                <asp:TextBox ID="txtMujeresGraduados" runat="server" class="form-control" placeholder="Número de Estudiantes Mujeres"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-12 text-center table-responsive">
                                            <asp:GridView ID="gvGraduados" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdGraduados" Width="440px" AllowPaging="True" OnRowCommand="gvGraduados_RowCommand">
                                                <RowStyle BackColor="#EFF3FB" />
                                                <Columns>
                                                    <asp:ButtonField CommandName="Select" Text="Actualizar" />

                                                    <asp:BoundField DataField="Periodo" HeaderText="Periodo Académico" />
                                                    <asp:BoundField DataField="Hombres" HeaderText="N° Estudiantes Hombres" />
                                                    <asp:BoundField DataField="Mujeres" HeaderText="N° Estudiantes Mujeres" />

                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerSettings NextPageText="Siguiente" PageButtonCount="15" PreviousPageText="Anterior" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-6 text-center-md item-caption">
                                                <asp:Button ID="btnGuardarGraduados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarGraduados_Click" />
                                                <asp:Button ID="btnGuardarActualizarGraduados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnGuardarActualizarGraduados_Click" />

                                            </div>
                                            <div class="col-md-6 text-center-md item-caption">
                                                <asp:Button ID="btnCancelarGraduados" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarGraduados_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--fin agregar graduados #########################################################################################-->
                <%--  </ContentTemplate>
                </asp:UpdatePanel>--%>
            </form>
        </div>
    </div>
</asp:Content>
