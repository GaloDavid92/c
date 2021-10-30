<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UserMaster.Master" CodeBehind="UserMallaCurricular.aspx.cs" Inherits="Administracion.UserMallaCurricular" EnableTheming="False" StylesheetTheme="" Theme="" %>

<%@ Register Src="~/Asignatura.ascx" TagName="UC_Asig" TagPrefix="ucl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">
        <form runat="server">
            <div id="background-wrapper" class="metro" data-stellar-background-ratio="0.1">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <%-- malla curricular ============================================================ --%>
                        <div runat="server" id="vista" visible="true">
                            <div class="panel panel-pricing" style="background-color: transparent">
                                <div class="panel-heading text-center" style="color: orange">
                                    <h3>ESCUELA POLITÉCNICA NACIONAL</h3>
                                    <h3>FACULTAD DE INGENIERÍA ELÉCTRICA Y ELECTRÓNICA</h3>
                                    <h3>MALLA CURRICULAR DE LA CARRERA DE TECNOLOGÍAS DE LA INFORMACIÓN</h3>
                                </div>

                                <div class="panel-body" style="background-color: transparent">

                                    <div class="col-sm-3 col-lg-6 col-sm-offset-1">
                                        <div class="col-md-12 text-right-md item-caption">
                                            <%-- <ucl:UC_Asig ID="Test" runat="server" OnAceptarClicked="Test_AceptarClicked" />--%>
                                            <asp:Table ID="tblDesplegar" runat="server" HorizontalAlign="Center" GridLines="Both" data-toggle="modal" data-target="#myModal" BorderWidth="2px" CellPadding="6" CellSpacing="1" Font-Overline="False" Font-Underline="False"></asp:Table>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 col-sm-offset-0">
                                        <div class="form-group">
                                            <br />
                                        </div>
                                    </div>
                                    <div class="col-sm-3 col-sm-offset-0">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg" title="Campos de Formación">
                                                <asp:GridView ID="gvComponentes" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdCampo">
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <%--<Columns>
                                                                    <asp:BoundField DataField="SiglasCampo" HeaderText="Siglas" />
                                                                    <asp:BoundField DataField="NombreCampo" HeaderText="Campos" />
                                                                    <asp:BoundField DataField="Horas" HeaderText="Horas" />
                                                                </Columns>--%>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <PagerSettings NextPageText="Siguiente" PageButtonCount="15" PreviousPageText="Anterior" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <AlternatingRowStyle BackColor="White" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3 col-sm-offset-0">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg" title="Campos de Formación">
                                                <asp:GridView ID="gvCamposDeFormacion" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdCampo">
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <Columns>
                                                        <asp:BoundField DataField="SiglasCampo" HeaderText="Siglas" />
                                                        <asp:BoundField DataField="NombreCampo" HeaderText="Campos" />
                                                        <asp:BoundField DataField="Horas" HeaderText="Horas" />
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
                                        </div>
                                    </div>
                                    <div class="col-sm-3 col-sm-offset-0">
                                        <div class="form-group">
                                            <div class="input-group input-group-lg" title="Componente Práctico">
                                                <asp:GridView ID="gvUnidadesOrganizacion" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdUnidades">
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <Columns>

                                                        <asp:BoundField DataField="NombreUnidad" HeaderText="Unidades" />
                                                        <asp:BoundField DataField="Horas" HeaderText="Horas" />
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Pensum Vista Previa#########################################################################################-->
                        <!--Pensum Vista Previa#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="pea" visible="false">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="panel panel-default">
                                            <div class="panel-heading text-center modal-header">
                                                <asp:Button type="button" ID="btnCerrarPea" runat="server" class="close" data-dismiss="modal" Text="X" OnClick="btnCerrarPea_Click2" />

                                                <h3 class="modal-title">&nbsp;&nbsp;&nbsp;&nbsp;Plan de Estudios</h3>
                                                <h3 class="modal-title text-center" id="titulo" runat="server"></h3>

                                            </div>
                                            <div class="panel-body" style="background-color: aliceblue">

                                                <div class="col-sm-12 col-sm-offset-0 text-justify" style="color: azure">
                                                    <div runat="server" id="planestudios">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--fin pensum Vista Previa #########################################################################################-->
                        <%--<!-- The Modal -->
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Plan de Estudios</h4>
                                        <h4 class="modal-title" id="titulo" runat="server"></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body" id="planestudios" runat="server">
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                    </div>

                                </div>
                            </div>
                        </div>--%>



                        <%--<asp:Panel ID="pnlModal" runat="server" CssClass="modalPopup">
                            <div class="col-sm-8 col-sm-offset-2 text-justify" style="color: azure">
                                <div runat="server" id="p">
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <div class="col-md-12 text-right-md item-caption">
                                    <asp:Button ID="btnCerrarPea" runat="server" class="btn btn-warning" Text=" X " />
                                </div>
                            </div>
                        </asp:Panel>

                        <ajaxToolkit:ModalPopupExtender ID="pnlModal_ModalPopupExtender" runat="server" BehaviorID="pnlModal_ModalPopupExtender" TargetControlID="Test_AceptarClicked" Enabled="true" BackgroundCssClass="modalBackground" PopupControlID="pnlModal" CancelControlID="btnCerrarPea" DropShadow="true">
                        </ajaxToolkit:ModalPopupExtender>--%>



                        <!--fin pensum Vista Previa #########################################################################################-->
                        <%-- malla curricular ============================================================ --%>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--</ContentTemplate>
                  <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Nombre" EventName="AceptarClicked"/>
                    </Triggers>
                </asp:UpdatePanel>--%>
            </div>
        </form>
    </div>
</asp:Content>
