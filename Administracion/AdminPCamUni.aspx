<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminPCamUni.aspx.cs" Inherits="Administracion.AdminPCamUni" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--Proceso de Cambio de Universidad====================================================================================================-->
                        <div class="panel panel-pricing" style="background-color: transparent">
                            <div class="panel-heading text-center" style="color: orange">
                                <h1>Proceso de Cambio de Universidad
                                </h1>
                            </div>
                            <div class="panel-body" style="background-color: transparent">
                                <div runat="server" id="universidad" visible="true">
                                    <div class="panel panel-pricing" style="background-color: transparent">

                                        <div class="panel-body" style="background-color: transparent">

                                            <div class="col-sm-12">

                                                <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                                    <div runat="server" id="uni">
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
                                                            <asp:Button ID="btnAgregarUniversidad" runat="server" class="btn btn-primary btn-hh-trigger" Text="Agregar" OnClick="btnAgregarUniversidad_Click"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-12 text-center-md item-caption">
                                                            <asp:Button ID="btnActualizarUniversidad" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnActualizarUniversidad_Click"/>
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
                                        <div runat="server" id="agregaruniversidad" visible="false">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <div class="panel panel-pricing" style="background-color: aliceblue">
                                                    <div class="panel-heading text-center">
                                                        <h2>Editar Proceso de Cambio de Universidad</h2>
                                                    </div>
                                                    <div class="panel-body" style="background-color:aliceblue">
                                                       
                                                        <div class="col-sm-12 col-sm-offset-0">
                                                            <div class="form-group">
                                                                <div class="input-group input-group-lg">
                                                                    
                                                                    <CKEditor:CKEditorControl ID="CKEditorUniversidad" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnGuardarUniversidad" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarUniversidad_Click"/>
                                                                <asp:Button ID="btnGuardarActualizarUniversidad" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnGuardarActualizarUniversidad_Click"/>

                                                            </div>
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnCancelarUniversidad" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarUniversidad_Click"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <!--Proceso de Cambio de Universidad====================================================================================================-->
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
</asp:Content>