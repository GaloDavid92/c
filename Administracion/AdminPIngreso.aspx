<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminPIngreso.aspx.cs" Inherits="Administracion.AdminPIngreso" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--Perfil de Ingreso====================================================================================================-->
                        <div class="panel panel-pricing" style="background-color: transparent">
                            <div class="panel-heading text-center" style="color: orange">
                                <h1>Perfil de Ingreso
                                </h1>
                            </div>
                            <div class="panel-body" style="background-color: transparent">
                                <div runat="server" id="ingreso" visible="true">
                                    <div class="panel panel-pricing" style="background-color: transparent">

                                        <div class="panel-body" style="background-color: transparent">

                                            <div class="col-sm-12">

                                                <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                                    <div runat="server" id="i">
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
                                                            <asp:Button ID="btnAgregarIngreso" runat="server" class="btn btn-primary btn-hh-trigger" Text="Agregar" OnClick="btnAgregarIngreso_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-12 text-center-md item-caption">
                                                            <asp:Button ID="btnActualizarIngreso" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnActualizarIngreso_Click" />
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
                                        <div runat="server" id="agregaringreso" visible="false">
                                            <div class="col-sm-8 col-sm-offset-2">
                                                <div class="panel panel-pricing" style="background-color: aliceblue">
                                                    <div class="panel-heading text-center">
                                                        <h2>Editar Perfil de Ingreso</h2>
                                                    </div>
                                                    <div class="panel-body" style="background-color:aliceblue">
                                                       
                                                        <div class="col-sm-12 col-sm-offset-0">
                                                            <div class="form-group">
                                                                <div class="input-group input-group-lg">
                                                                    
                                                                    <CKEditor:CKEditorControl ID="CKEditorIngreso" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnGuardarIngreso" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarIngreso_Click"/>
                                                                <asp:Button ID="btnGuardarActualizarIngreso" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnGuardarActualizarIngreso_Click"/>

                                                            </div>
                                                            <div class="col-md-6 text-center-md item-caption">
                                                                <asp:Button ID="btnCancelarIngreso" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarIngreso_Click"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--fin Ingreso #########################################################################################-->
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>
</asp:Content>
