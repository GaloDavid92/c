<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminMallaCurricular.aspx.cs" Inherits="Administracion.MallaCurricular1" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register Src="~/Asignatura.ascx" TagName="UC_Asig" TagPrefix="ucl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div id="page-wrapper">
        <form runat="server">
            <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <!--Malla Curricular====================================================================================================-->
                        <!--Pensum#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="pensum" visible="true">
                                    <div class="col-sm-8 col-sm-offset-2">
                                        <div class="panel panel-pricing">
                                            <div class="panel-heading text-center">

                                                <h2>Malla Curricular</h2>

                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <div class="form-group col-lg-6 text-right">
                                                        Pensum Académico:
                                                    </div>
                                                    <div class="form-group col-lg-1 text-left">
                                                        <asp:Label ID="lblPensum" runat="server" MaxLength="300" Text=""></asp:Label>
                                                    </div>
                                                    <div class="col-md-2 text-left-md item-caption">
                                                        <asp:Button ID="btnPensum" runat="server" class="btn btn-primary btn-hh-trigger" Text="Pensum" OnClick="btnPensum_Click" />
                                                    </div>
                                                    <div class="col-md-3 text-right-md item-caption">
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12 text-center-md item-caption">
                                                        <asp:Button type="button" ID="btnVista" runat="server" class="btn btn-primary btn-hh-trigger" Text="Vista Previa" OnClick="btnVista_Click" />
                                                    </div>
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <br />
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-12 text-center table-responsive">
                                                    <asp:GridView ID="gvAsignaturas" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdAsignatura" Width="440px" AllowPaging="True" OnPageIndexChanging="gvAsignaturas_PageIndexChanging1" OnRowCommand="gvAsignaturas_RowCommand1" OnRowDataBound="gvAsignaturas_RowDataBound">
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <Columns>
                                                            <asp:ButtonField CommandName="Select" Text="Actualizar" />
                                                            <%-- <asp:BoundField DataField="IdProducto" HeaderText="Id" />--%>
                                                            <asp:BoundField DataField="Codigo" HeaderText="Código" />
                                                            <asp:BoundField DataField="Nombre" HeaderText="Asignatura" />
                                                            <asp:BoundField DataField="CompDocenci" HeaderText="CD" />
                                                            <asp:BoundField DataField="CompPractico" HeaderText="CP" />
                                                            <asp:BoundField DataField="ApreAutonomo" HeaderText="AA" />
                                                            <asp:BoundField DataField="IdCampo" HeaderText="Campo" />
                                                            <asp:BoundField DataField="IdUnidad" HeaderText="Unidad" />
                                                            <asp:BoundField DataField="Pea" HeaderText="Pea" />
                                                            <asp:BoundField DataField="Semestre" HeaderText="Semestre" />
                                                            <asp:BoundField DataField="Columna" HeaderText="Columna" />
                                                            <asp:ButtonField CommandName="Eliminar" Text="Eliminar" />
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
                                                    <div class="col-md-12 text-center-md item-caption">
                                                        <asp:Button ID="btnAgregar" runat="server" class="btn btn-primary btn-hh-trigger" Text="Nueva Asignatura" OnClick="btnAgregar_Click" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--fin pensum #########################################################################################-->
                        <!--Pensum#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="agregar" visible="false">
                                    <div class="col-sm-10 col-sm-offset-1">
                                        <div class="panel panel-pricing">
                                            <div class="panel-heading text-center">
                                                <h2>Editar Asignatura</h2>
                                                <asp:Label ID="lblCodigoError" runat="server" Text="" Visible="false"></asp:Label>
                                            </div>
                                            <div class="panel-body">
                                                <div class="col-sm-4 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Ingrese el código de asignatura">
                                                            <asp:Label ID="Label1" runat="server" Text="Código:"></asp:Label>
                                                            <asp:TextBox ID="txtCodigo" runat="server" class="form-control" placeholder="Código" MaxLength="7" Style="left: 0px; top: 0px"></asp:TextBox>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Solo alfanumérico" ValidationExpression="^[A-Za-z-0-9]*$" ForeColor="#FF3300" ControlToValidate="txtCodigo" ValidationGroup="Guardar"></asp:RegularExpressionValidator>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-8 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Ingrese el nombre de la asignatura">
                                                            <asp:Label ID="Label2" runat="server" Text="Nombre de Asignatura:"></asp:Label>
                                                            <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre Asignatura" MaxLength="300"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Guardar" runat="server" ErrorMessage="Ingrese Nombre Asignatura " ControlToValidate="txtNombre" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="Guardar" runat="server" ErrorMessage="Ingrese solo letras" ControlToValidate="txtNombre" ForeColor="#FF3300" ValidationExpression="^[A-Za-zñÑáéíóúÁÉÍÓÚ ]*$"></asp:RegularExpressionValidator>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Componente de Docencia">
                                                            <asp:Label ID="Label3" runat="server" Text="Componente de Docencia:"></asp:Label>
                                                            <asp:TextBox ID="txtCompDocencia" runat="server" class="form-control" placeholder="CD" MaxLength="3"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Guardar" runat="server" ErrorMessage="Ingrese un Número" ControlToValidate="txtCompDocencia" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ValidationGroup="Guardar" ErrorMessage="Ingrese valores entre 1-10" ControlToValidate="txtCompDocencia" MaximumValue="10" MinimumValue="1" ForeColor="#FF3300" Type="Double"></asp:RangeValidator>


                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Componente Práctico">
                                                            <asp:Label ID="Label4" runat="server" Text="Componente Práctico:"></asp:Label>
                                                            <asp:TextBox ID="txtCompPractico" runat="server" class="form-control" placeholder="CP" MaxLength="3"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Guardar" runat="server" ErrorMessage="Ingrese un Número" ControlToValidate="txtCompPractico" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="RangeValidator2" runat="server" ValidationGroup="Guardar" ErrorMessage="Ingrese valores entre 1-10" ControlToValidate="txtCompPractico" MaximumValue="10" MinimumValue="1" ForeColor="#FF3300" Type="Double"></asp:RangeValidator>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg " title="Aprendizaje Autónomo">
                                                            <asp:Label ID="Label5" runat="server" Text="Aprendizaje Autónomo:"></asp:Label>
                                                            <asp:TextBox ID="txtApreAutonomo" runat="server" class="form-control" placeholder="AA" MaxLength="3"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Guardar" runat="server" ErrorMessage="Ingrese un Número" ControlToValidate="txtApreAutonomo" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="RangeValidator3" runat="server" ValidationGroup="Guardar" ErrorMessage="Ingrese valores entre 1-10" ControlToValidate="txtApreAutonomo" MaximumValue="10" MinimumValue="1" ForeColor="#FF3300" Type="Double"></asp:RangeValidator>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Campos de Formación">
                                                            <asp:Label ID="Label6" runat="server" Text="Campos de Formación:"></asp:Label>
                                                            <asp:DropDownList ID="ddlCampo" runat="server" class="form-control" placeholder="Campo de Formación">
                                                            </asp:DropDownList>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Campos de Formación">
                                                            <br />
                                                            <asp:Button ID="btnEditarCampos" runat="server" class="btn btn-primary btn-hh-trigger" Text="Editar Campos" OnClick="btnEditarCampos_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Unidad de Organización Curricular">
                                                            <asp:Label ID="Label7" runat="server" Text="Unidad de Organización Curricular:"></asp:Label>
                                                            <asp:DropDownList ID="ddlUnidad" runat="server" class="form-control" placeholder="Unidad">
                                                            </asp:DropDownList>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Unidad de Organización Curricular">
                                                            <br />
                                                            <asp:Button ID="btnEditarUnidades" runat="server" class="btn btn-primary btn-hh-trigger" Text="Editar Unidades" OnClick="btnEditarUnidades_Click" />

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Ingrese semestre o fila">
                                                            <asp:Label ID="Label8" runat="server" Text="Semestre:"></asp:Label>
                                                            <asp:TextBox ID="txtSemeste" runat="server" class="form-control" placeholder="Semestre" MaxLength="2"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Guardar" runat="server" ErrorMessage="Ingrese un Número" ControlToValidate="txtSemeste" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="RangeValidator4" runat="server" ValidationGroup="Guardar" ErrorMessage="Ingrese valores enteros entre 1-10" ControlToValidate="txtSemeste" MaximumValue="10" MinimumValue="1" ForeColor="#FF3300" Type="Integer"></asp:RangeValidator>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Ingrese columna">
                                                            <asp:Label ID="Label9" runat="server" Text="Columna:"></asp:Label>
                                                            <asp:TextBox ID="txtColumna" runat="server" class="form-control" placeholder="Columna" MaxLength="2"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="Guardar" runat="server" ErrorMessage="Ingrese un Número" ControlToValidate="txtColumna" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                                            <asp:RangeValidator ID="RangeValidator5" runat="server" ValidationGroup="Guardar" ErrorMessage="Ingrese valores enteros entre 1-10" ControlToValidate="txtColumna" MaximumValue="10" MinimumValue="1" ForeColor="#FF3300" Type="Integer"></asp:RangeValidator>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg" title="Ingrese el plan de estudios(PEA)">
                                                            <asp:Label ID="Label10" runat="server" Text="Plan de Estudios:"></asp:Label>
                                                            <CKEditor:CKEditorControl ID="ckePea" BasePath="/ckeditor/" runat="server"></CKEditor:CKEditorControl>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-12 text-center-md item-caption">
                                                        <h3>Prerrequisitos</h3>
                                                    </div>
                                                </div>
                                                <%-- nuevo prerrequisitos 
                                                <div class="form-group col-lg-8 col-lg-offset-2 text-center table-responsive">
                                                    <table border="0">
                                                        <tr>
                                                            <td>
                                                                <asp:GridView ID="gvArticulos" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None">
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSeleccion" runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Asignatura" HeaderText="Nombre" />
                                                                        <asp:BoundField DataField="Codigo" HeaderText="Código" />
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <EmptyDataTemplate>
                                                                        No hay registros
                                                                    </EmptyDataTemplate>
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                </asp:GridView>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnSeleccionar" runat="server" OnClick="btnSeleccionar_Click" Text="&gt;&gt;" />
                                                                <br />
                                                                <br />
                                                                <asp:Button ID="btnQuitar" runat="server" Text="&lt;&lt;" OnClick="btnQuitar_Click" />
                                                            </td>
                                                            <td>
                                                                <asp:GridView ID="gvSeleccion" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None">
                                                                    <RowStyle BackColor="#EFF3FB" />
                                                                    <Columns>
                                                                        <asp:TemplateField>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="chkSeleccion0" runat="server" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Asignatura" HeaderText="Codigo" />
                                                                        <asp:BoundField DataField="Codigo" HeaderText="Nombre" />
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                    <EmptyDataTemplate>
                                                                        Seleccione un item de la lista para agregar
                                                                    </EmptyDataTemplate>
                                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditRowStyle BackColor="#2461BF" />
                                                                    <AlternatingRowStyle BackColor="White" />
                                                                </asp:GridView>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div> --%>

                                                <div class="form-group col-lg-6 text-center table-responsive">
                                                    <asp:GridView ID="gvTodasAsignaturas" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdAsignatura" Width="440px" AllowPaging="True" OnRowCommand="gvTodasAsignaturas_RowCommand" OnPageIndexChanging="gvTodasAsignaturas_PageIndexChanging">
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <Columns>
                                                            <asp:ButtonField CommandName="Select" Text="Seleccionar" />
                                                            <asp:BoundField DataField="Codigo" HeaderText="Código" />
                                                            <asp:BoundField DataField="Nombre" HeaderText="Asignatura" />
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
                                                <div class="form-group col-lg-6 text-center table-responsive">
                                                    <asp:GridView ID="gvPrerrequisitos" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="Id" OnRowCommand="gvPrerrequisitos_RowCommand">
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <Columns>
                                                            <asp:BoundField DataField="Codigo" HeaderText="Código" />
                                                            <asp:BoundField DataField="Asignatura" HeaderText="Asignatura" />
                                                            <asp:ButtonField CommandName="Eliminar" Text="Eliminar" />
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
                                                <div class="col-sm-12 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="col-md-6 text-center-md item-caption">
                                                            <asp:Button ID="btnGuardar" runat="server" ValidationGroup="Guardar" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardar_Click" />
                                                            <asp:Button ID="btnActualizar" runat="server" ValidationGroup="Guardar" class="btn btn-primary btn-hh-trigger" Text="Actualizar" Visible="false" OnClick="btnActualizar_Click" />

                                                        </div>
                                                        <div class="col-md-6 text-center-md item-caption">
                                                            <asp:Button ID="btnCancelar" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelar_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="panel-footer">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--fin pensum #########################################################################################-->
                        <!--Campos de formacion#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="camposformacion" visible="false">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="panel panel-pricing">
                                            <div class="panel-heading text-center">
                                                <h2>Campos de Formación</h2>
                                            </div>
                                            <div class="panel-body">
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <asp:Label ID="Label11" runat="server" Text="Siglas:"></asp:Label>
                                                            <asp:TextBox ID="txtSiglasCampo" runat="server" class="form-control" placeholder="Siglas"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-sm-offset-0">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <asp:Label ID="Label12" runat="server" Text="Nombre de Campo de Formación:"></asp:Label>
                                                            <asp:TextBox ID="txtNombreCampo" runat="server" class="form-control" placeholder="Campo de Formación"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4 col-sm-offset-4">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <asp:Label ID="Label13" runat="server" Text="Color Campo de Formación:"></asp:Label>
                                                            <asp:DropDownList ID="ddlColorCampo" class="form-control" runat="server">
                                                                <asp:ListItem Value="black">Negro</asp:ListItem>
                                                                <asp:ListItem Value="red">Rojo</asp:ListItem>
                                                                <asp:ListItem Value="#0ca72e">Verde</asp:ListItem>
                                                                <asp:ListItem Value="#1a26cc">Azúl</asp:ListItem>
                                                                <asp:ListItem Value="#ffa110">Anaranjado</asp:ListItem>
                                                                <asp:ListItem Value="#ffe910">Amarillo</asp:ListItem>
                                                                <asp:ListItem Value="#ff10d1">Rosado</asp:ListItem>
                                                                <asp:ListItem Value="#00ecff">Celeste</asp:ListItem>
                                                                <asp:ListItem Value="#afb6b6">Plomo</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-12 text-center table-responsive">
                                                    <asp:GridView ID="gvCampos" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdCampo" Width="440px" AllowPaging="True" OnRowCommand="gvCampos_RowCommand">
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <Columns>
                                                            <asp:ButtonField CommandName="Select" Text="Editar" />

                                                            <asp:BoundField DataField="SiglasCampo" HeaderText="Siglas" />
                                                            <asp:BoundField DataField="NombreCampo" HeaderText="Nombre" />
                                                            <asp:BoundField DataField="Color" HeaderText="Color" />

                                                            <asp:ButtonField CommandName="Eliminar" Text="Eliminar" />
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
                                                        <asp:Button ID="btnGuardarCampo" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarCampo_Click" />
                                                    </div>
                                                    <div class="col-md-6 text-center-md item-caption">
                                                        <asp:Button ID="btnCancelarCampo" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarCampo_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--fin campos de formacion #########################################################################################-->
                        <!--Uniddes#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="unidades" visible="false">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="panel panel-pricing">
                                            <div class="panel-heading text-center">
                                                <h2>Unidades de Organización Curricular</h2>
                                            </div>
                                            <div class="panel-body">

                                                <div class="col-sm-8 col-sm-offset-2">
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <asp:Label ID="Label14" runat="server" Text="Nombre Unidad:"></asp:Label>
                                                            <asp:TextBox ID="txtNombreUnidad" runat="server" class="form-control" placeholder="Nombre Unidad"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-12 text-center table-responsive">
                                                    <asp:GridView ID="gvUnidades" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdUnidades" Width="440px" AllowPaging="True" OnRowCommand="gvUnidades_RowCommand">
                                                        <RowStyle BackColor="#EFF3FB" />
                                                        <Columns>
                                                            <asp:ButtonField CommandName="Select" Text="Editar" />

                                                            <asp:BoundField DataField="NombreUnidad" HeaderText="Nombre" />
                                                            <asp:ButtonField CommandName="Eliminar" Text="Eliminar" />
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
                                                        <asp:Button ID="btnGuardarUnidades" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardarUnidades_Click" />
                                                    </div>
                                                    <div class="col-md-6 text-center-md item-caption">
                                                        <asp:Button ID="btnCancelarUnidad" runat="server" class="btn btn-primary btn-hh-trigger" Text="Cancelar" OnClick="btnCancelarUnidad_Click" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--fin unidades #########################################################################################-->
                        <!--Pensum prerrequisitos#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="prerrequisitos" visible="false">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="panel panel-pricing">
                                            <div class="panel-heading text-center">
                                                <h2>Prerrequisitos</h2>
                                            </div>
                                            <div class="panel-body">

                                                <div class="form-group">
                                                    <div class="col-md-12 text-center-md item-caption">
                                                        <asp:Button ID="btnGuardarPre" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" />
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
                        <!--fin pensum prerrequisitos #########################################################################################-->
                        <!--Pensum Vista Previa#########################################################################################-->
                        <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                    <ContentTemplate>--%>
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="vistaprevis" visible="false">
                                    <div class="col-sm-12 col-sm-offset-0">
                                        <div class="panel panel-default" style="background-color: transparent">
                                            <div class="panel-heading text-center" style="background-color: transparent">
                                                <h3 style="color: white">ESCUELA POLITÉCNICA NACIONAL </h3>
                                                <asp:Button type="button" ID="btnCerrar" runat="server" class="btn btn-warning btn-hh-trigger close" data-dismiss="modal" Text="X" OnClick="btnCerrar_Click" />

                                                <h3 style="color: white">FACULTAD DE INGENIERÍA ELÉCTRICA Y ELECTRÓNICA</h3>
                                                <h3 style="color: white">MALLA CURRICULAR DE LA CARRERA DE TECNOLOGÍAS DE LA INFORMACIÓN</h3>
                                            </div>
                                            <div class="panel-body" style="background-color: transparent">
                                                <%-- <div class="form-group">
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <asp:Button ID="btnCerrar" runat="server" class="btn btn-primary btn-hh-trigger" Text=" X " OnClick="btnCerrar_Click" />
                                                    </div>
                                                </div>--%>
                                                <div class="col-sm-6 col-lg-12 col-sm-offset-0">
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <%-- <ucl:UC_Asig ID="Test" runat="server" OnAceptarClicked="Test_AceptarClicked" />--%>
                                                        <asp:Table ID="tblDesplegar" runat="server" HorizontalAlign="Center" GridLines="Both" BorderWidth="2px" CellPadding="6" CellSpacing="1" Font-Overline="False" Font-Underline="False" Font-Size="Smaller"></asp:Table>
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
                                                            <asp:GridView ID="gvComponentes" runat="server" HorizontalAlign="Center" AutoGenerateColumns="false" DataKeyNames="IdCampo" OnSelectedIndexChanged="gvComponentes_SelectedIndexChanged" Font-Size="Smaller">
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
                                </div>
                            </div>
                        </div>
                        <!--fin pensum Vista Previa #########################################################################################-->
                        <!--Pensum Vista Previa#########################################################################################-->
                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div runat="server" id="pea" visible="false">
                                    <div class="col-sm-6 col-sm-offset-3">
                                        <div class="panel panel-default">
                                            <div class="panel-heading text-center">
                                                <h3>ESCUELA POLITÉCNICA NACIONAL</h3>
                                                <asp:Button ID="btnCerrarPea" runat="server" class="btn btn-warning close" Text=" X " OnClick="btnCerrarPea_Click" />

                                                <asp:Label ID="lblTituto" runat="server" Font-Names="Arial" Font-Size="12px"></asp:Label>
                                            </div>
                                            <div class="panel-body">
                                                <div class="form-group">
                                                    <div class="col-md-12 text-right-md item-caption">
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 col-sm-offset-0 text-justify" style="color: azure">
                                                    <div runat="server" id="p">
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--fin pensum Vista Previa #########################################################################################-->

                        <!--fin Malla Curricular====================================================================================================-->
                    </ContentTemplate>

                </asp:UpdatePanel>
            </div>
        </form>
    </div>
</asp:Content>
