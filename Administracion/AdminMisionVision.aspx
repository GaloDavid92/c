<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminMisionVision.aspx.cs" Inherits="Administracion.AdminMisionVision" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <form runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--mision  s#########################################################################################-->
                        <div class="panel panel-pricing" style="background-color: transparent">
                            <div class="panel-heading text-center" style="color: orange">
                                <h1>Misión y Visión
                                </h1>
                            </div>
                            <div class="panel-body" style="background-color: transparent">
                                <div runat="server" id="mision" visible="true">
                                    <div class="panel panel-pricing" style="background-color: transparent">
                                        <div class="panel-heading text-center" style="color: azure">
                                            <h3><b>Misión</b></h3>
                                        </div>
                                        <div class="panel-body" style="background-color: transparent">

                                            <div class="col-sm-12">

                                                <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                                    <div runat="server" id="m">
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
                                                            <asp:Button ID="btnAgregarMision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Agregar" OnClick="btnAgregarMision_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-12 text-center-md item-caption">
                                                            <asp:Button ID="btnActualizarMison" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnActualizarMison_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Actualizar imagenes#########################################################################################-->
                                <!--fin vision====================================================================================================-->
                                <div runat="server" id="vision" visible="true">
                                    <div class="panel panel-pricing" style="background-color: transparent">
                                        <div class="panel-heading text-center" style="color: azure">
                                            <h3><b>Visión</b></h3>
                                        </div>
                                        <div class="panel-body" style="background-color: transparent">
                                            <<div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                                <div runat="server" id="v">
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
                                                        <asp:Button ID="btnAgregarVision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Agregar" OnClick="btnAgregarVision_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-sm-offset-0">
                                                <div class="form-group">
                                                    <div class="col-md-12 text-center-md item-caption">
                                                        <asp:Button ID="btnActualizarVision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnActualizarVision_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--fin vision====================================================================================================-->
                        <!--Agregar Mision#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="agregarmision" visible="false">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="panel panel-pricing" style="background-color:aliceblue">
                                            <div class="panel-heading text-center">
                                                <h2>Editar Misión</h2>
                                            </div>
                                            <div class="panel-body" style="background-color:aliceblue">
                                                <div class="col-sm-12 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            
                                                                    <CKEditor:CKEditorControl ID="CKEditorMision" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-md-6 text-center-md item-caption">
                                                        <asp:Button ID="btnGuardarMision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarMision_Click" />
                                                        <asp:Button ID="btnActualizarMision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnActualizarMision_Click" />

                                                    </div>
                                                    <div class="col-md-6 text-center-md item-caption">
                                                        <asp:Button ID="btnCancelarMision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarMision_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--fin campos de formacion #########################################################################################-->
                         <!--Agregar Vision#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="agregarvision" visible="false">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="panel panel-pricing" style="background-color:aliceblue">
                                            <div class="panel-heading text-center">
                                                <h2>Editar Visión</h2>
                                            </div>
                                            <div class="panel-body" style="background-color:aliceblue">
                                                <div class="col-sm-12 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                          
                                                                    <CKEditor:CKEditorControl ID="CKEditorVision" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-md-6 text-center-md item-caption">
                                                        <asp:Button ID="btnGuardarVision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarVision_Click" />
                                                        <asp:Button ID="btnGuardarActualizarVision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnGuardarActualizarVision_Click"  />

                                                    </div>
                                                    <div class="col-md-6 text-center-md item-caption">
                                                        <asp:Button ID="btnCancelarVision" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarVision_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--fin agregar vision #########################################################################################-->
                    </ContentTemplate>
                </asp:UpdatePanel>
            </form>
        </div>
    </div>

</asp:Content>
