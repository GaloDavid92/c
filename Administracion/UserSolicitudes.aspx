<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UserMaster.Master" CodeBehind="UserSolicitudes.aspx.cs" Inherits="Administracion.UserSolicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <form runat="server">
                <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                <!--Perfil de Ingreso====================================================================================================-->
                <div class="panel panel-pricing" style="background-color: transparent">
                    <div class="panel-heading text-center" style="color: orange">
                        <h1>Solicitudes
                        </h1>
                    </div>
                    <div class="panel-body" style="background-color: transparent">
                        <div runat="server" id="formulario" visible="true">
                            <div class="panel panel-pricing" style="background-color: transparent">

                                <div class="panel-body" style="background-color: transparent">

                                    <div class="col-sm-12">
                                        <div class="col-sm-8 col-sm-offset-3 text-justify" style="color: azure">

                                            <%-- <asp:GridView ID="gvFormularios" runat="server"></asp:GridView>--%>
                                            <asp:GridView ID="gvFormularios" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table-hover"
                                                ForeColor="#333333" GridLines="None" DataKeyNames="IdFormSoli" OnRowDataBound="gvFormularios_RowDataBound">
                                                <RowStyle BackColor="#EFF3FB" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Nombre">
                                                        <ItemTemplate>
                                                            <asp:Label ID="nombre" runat="server" Text='<%# Eval("Nombre") %>'>
                                                            </asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Archivo">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="archivo" runat="server" Target="_blank" NavigateUrl='<%# Eval("FormSoli1", "~/Formularios/{0}") %>'
                                                                Text='<%# Eval("FormSoli1") %>'>
                                                            </asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Descargar" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="archivo" runat="server" Target="_blank" NavigateUrl='<%# Eval("FormSoli1", "~/Formularios/{0}") %>'>
                                                                <asp:Image ID="imgEliminar" runat="server" ImageUrl="~/images/descargar.png" Width="24px" Height="24px" />
                                                            </asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
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
                    </div>
                </div>
                <!--fin Perfil de Ingreso====================================================================================================-->
            </form>
        </div>
    </div>
</asp:Content>
