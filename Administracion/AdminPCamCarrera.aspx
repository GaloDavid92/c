<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminPCamCarrera.aspx.cs" Inherits="Administracion.AdminPCamCarrera" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--Proceso de Cambio de Carrera====================================================================================================-->
                        <div class="panel panel-pricing" style="background-color: transparent">
                            <div class="panel-heading text-center" style="color: orange">
                                <h1>Proceso de Cambio de Carrera
                                </h1>
                            </div>
                            <div class="panel-body" style="background-color: transparent">
                                <div runat="server" id="carrera" visible="true">
                                    <div class="panel panel-pricing" style="background-color: transparent">

                                        <div class="panel-body" style="background-color: transparent">

                                            <div class="col-sm-12">

                                                <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                                    <div runat="server" id="ca">
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
                                                            <asp:Button ID="btnAgregarCarrera" runat="server" class="btn btn-primary btn-hh-trigger" Text="Agregar" OnClick="btnAgregarCarrera_Click"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-12 text-center-md item-caption">
                                                            <asp:Button ID="btnActualizarCarrera" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnActualizarCarrera_Click"/>
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
                                        <div runat="server" id="agregarcarrera" visible="false">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <div class="panel panel-pricing" style="background-color: aliceblue">
                                                    <div class="panel-heading text-center">
                                                        <h2>Editar Proceso de Cambio de Carrera</h2>
                                                    </div>
                                                    <div class="panel-body" style="background-color:aliceblue">
                                                       
                                                        <div class="col-sm-12 col-sm-offset-0">
                                                            <div class="form-group">
                                                                <div class="input-group input-group-lg">
                                                                    
                                                                    <CKEditor:CKEditorControl ID="CKEditorCarrera" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnGuardarCarrera" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarCarrera_Click"/>
                                                                <asp:Button ID="btnGuardarActualizarCarrera" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnGuardarActualizarCarrera_Click"/>

                                                            </div>
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnCancelarCarrera" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarCarrera_Click"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <!--Proceso de Cambio de Carrera====================================================================================================-->
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
</asp:Content>