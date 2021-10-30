<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UserMaster.Master" CodeBehind="UserPEgreso.aspx.cs" Inherits="Administracion.UserPEgreso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="background-wrapper" class="metro" data-stellar-background-ratio="0.1">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--Perfil de Ingreso====================================================================================================-->
                        <div class="panel panel-pricing" style="background-color: transparent">
                            <div class="panel-heading text-center" style="color: orange">
                                <h1>Perfil de Egreso
                                </h1>
                            </div>
                            <div class="panel-body" style="background-color: transparent">
                                <div runat="server" id="egreso" visible="true">
                                    <div class="panel panel-pricing" style="background-color: transparent">

                                        <div class="panel-body" style="background-color: transparent">

                                            <div class="col-sm-12">

                                                <div id="contenido" class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                                    <div runat="server" id="eg">
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
                                                        <button id="btnPDF" onclick="downloadPDF('Perfil de Egreso')" class="btn btn-primary btn-hh-trigger">Descargar como PDF</button>
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

                                        <div id="msgMail" runat="server" class="alert alert-success alert-dismissible">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                            <strong>Correo!</strong> enviado correctamente.
                                        </div>
                                    </div>
                                </div>
                                <!--fin Perfil de Ingreso====================================================================================================-->

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

