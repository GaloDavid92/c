<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UserMaster.Master" CodeBehind="UserMaGra.aspx.cs" Inherits="Administracion.UserMaGra" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
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
                url: "UserMaGra.aspx/GetChartDataMatriculados",
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
                url: "UserMaGra.aspx/GetChartDataGraduados",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    console.log(r);
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
        <div id="background-wrapper" class="metro" data-stellar-background-ratio="0.1">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--Matriculados y graduados====================================================================================================-->
                        <!--matriculados#########################################################################################-->
                        <div class="panel panel-pricing" style="background-color: transparent">
                            <div class="panel-heading text-center" style="color: orange">
                                <h1>Matriculados y Graduados
                                </h1>
                            </div>
                            <div class="panel-body" style="background-color: transparent">
                                <div id="contenido" runat="server">
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


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-sm-offset-0">
                                    <div class="form-group">
                                        <div class="col-md-12 text-center-md item-caption">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6 text-center-md item-caption">
                                        <button type="button" class="btn btn-primary btn-hh-trigger" data-toggle="modal" data-target="#myModal">Enviar por Correo</button>
                                    </div>
                                    <div class="col-md-6 text-center-md item-caption">
                                        <button id="btnPDF" onclick="downloadPDF('Matriculados y Graduados')" class="btn btn-primary btn-hh-trigger">Descargar como PDF</button>
                                    </div>
                                </div>
                            </div>

                            <div id="msgMail" runat="server" class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Correo!</strong> enviado correctamente.
                            </div>

                        </div>
                        <!--fin graduados====================================================================================================-->

                        <!--fin Matriculados y graduados====================================================================================================-->

                        <!-- Modal -->
                        <div id="myModal" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Destinatario</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>Destinatario.</p>
                                        <asp:TextBox ID="txtDestinatario" runat="server" class="form-control" type="email" onkeyup="validateEmail(this)"></asp:TextBox>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:Button ID="btnEnviar" runat="server" class="btnEnviar btn btn-primary btn-hh-trigger" Text="Enviar" OnClick="btnEnviar_Click" OnClientClick="hideBack()" disabled />
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
    <script src="js/jspdf.min.js"></script>
    <script src="js/script.js"></script>
</asp:Content>
