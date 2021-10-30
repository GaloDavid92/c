<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminPExReAn.aspx.cs" Inherits="Administracion.AdminPExReAn" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--Proceso de Extraordinarias, Reincripcion y Anulacion====================================================================================================-->
                        <div class="panel panel-pricing" style="background-color: transparent">
                            <div class="panel-heading text-center" style="color: orange">
                                <h1>Proceso de Matriculas Extraordinarias, Reincripción y Anulación
                                </h1>
                            </div>
                            <div class="panel-body" style="background-color: transparent">
                                <div runat="server" id="extraordinaria" visible="true">
                                    <div class="panel panel-pricing" style="background-color: transparent">

                                        <div class="panel-body" style="background-color: transparent">

                                            <div class="col-sm-12">

                                                <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                                    <div runat="server" id="ex">
                                                    </div>
                                                </div>

                                                <div class="col-sm-12 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-12 text-center-md item-caption">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-12 text-center-md item-caption">
                                                            <asp:Button ID="btnAgregarExtra" runat="server" class="btn btn-primary btn-hh-trigger" Text="Agregar" OnClick="btnAgregarExtra_Click"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-12 text-center-md item-caption">
                                                            <asp:Button ID="btnActualizarExtra" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnActualizarExtra_Click"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--fin Perfil de Ingreso====================================================================================================-->
                                <!--Agregar Ingreso#########################################################################################-->
                                <div class="row">
                                    <div class="col-lg-12 col-xs-12">
                                        <div runat="server" id="agregarextra" visible="false">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <div class="panel panel-pricing" style="background-color: aliceblue">
                                                    <div class="panel-heading text-center">
                                                        <h2>Editar Proceso de Matriculas Extraordinarias, Reincripción y Anulación</h2>
                                                    </div>
                                                    <div class="panel-body" style="background-color:aliceblue">
                                                       
                                                        <div class="col-sm-12 col-sm-offset-0">
                                                            <div class="form-group">
                                                                <div class="input-group input-group-lg">
                                                                    
                                                                    <CKEditor:CKEditorControl ID="CKEditorExtra" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnGuardarExtra" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarExtra_Click"/>
                                                                <asp:Button ID="btnGuardarActualizarExtra" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnGuardarActualizarExtra_Click"/>

                                                            </div>
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnCancelarExtra" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarExtra_Click"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <!--Proceso de Extraordinarias, Reincripcion y Anulacion====================================================================================================-->
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
</asp:Content>