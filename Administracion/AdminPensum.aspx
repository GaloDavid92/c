<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPensum.aspx.cs" Inherits="Administracion.AdminPensum" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Pensum - Tecnologías de la Información</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Facebook Opengraph integration: https://developers.facebook.com/docs/sharing/opengraph -->
    <meta property="og:title" content="">
    <meta property="og:image" content="">
    <meta property="og:url" content="">
    <meta property="og:site_name" content="">
    <meta property="og:description" content="">

    <!-- Twitter Cards integration: https://dev.twitter.com/cards/  -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:site" content="">
    <meta name="twitter:title" content="">
    <meta name="twitter:description" content="">
    <meta name="twitter:image" content="">

    <!-- Fav and touch icons -->
    <link rel="shortcut icon" href="img/icons/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/icons/114x114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/icons/72x72.png">
    <link rel="apple-touch-icon-precomposed" href="img/icons/default.png">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900" rel="stylesheet">

    <!-- Bootstrap CSS File -->
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Libraries CSS Files -->
    <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/owl.theme.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/owl.transitions.min.css" rel="stylesheet">

    <!-- Main Stylesheet File -->
    <link href="css/style.css" rel="stylesheet">

    <!--Your custom colour override - predefined colours are: colour-blue.css, colour-green.css, colour-lavander.css, orange is default-->
    <link href="#" id="colour-scheme" rel="stylesheet">
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 2px;
        }
    </style>
</head>

<!-- ======== @Region: body ======== -->

<body class="fullscreen-centered page-login">
    <!--Change the background class to alter background image, options are: benches, boots, buildings, city, metro -->
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="background-wrapper" class="benches" data-stellar-background-ratio="0.8">

                    <!-- ======== @Region: #content ======== -->
                    <div id="content">
                        <div class="header">
                            <div class="header-inner">
                                <!--navbar-branding/logo - hidden image tag & site name so things like Facebook to pick up, actual logo set via CSS for flexibility -->
                                <a class="navbar-brand center-block" href="#" title="Tecnologías de la Información">
                                    <h1 class="hidden">
                                        <img src="images/tics.png" alt="">
                                        Tecnologías de la Información
                                    </h1>
                                </a>
                            </div>
                        </div>
                        <!-- ========Pensum ========================================================================= -->
                        <div runat="server" id="pensum" visible="true">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3">
                                    <div class="panel panel-pricing" style="background-color: transparent">
                                        <div class="panel-heading" style="color: orangered">
                                            <h3><b>Pensum Académico</b>
                                            </h3>
                                        </div>
                                        <div class="panel-body" style="background-color: transparent">
                                          
                                                <fieldset>
                                                    <div class="form-group">

                                                        <div class="col-md-12 text-right-md item-caption">
                                                            <asp:ImageButton ID="ibtnInicio" runat="server" class="btn btn-primary btn-hh-trigger" ImageUrl="~/images/home.png" OnClick="ibtnInicio_Click" />
                                                        </div>

                                                    </div>
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <br />
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <span class="input-group-addon" style="background-color: transparent"><i class="fa fa-fw fa-university"></i></span>
                                                            <asp:DropDownList ID="ddlPensum" AutoPostBack="true" runat="server" class="form-control" placeholder="Pensum" BackColor="Transparent" ForeColor="Orange" OnSelectedIndexChanged="ddlPensum_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <asp:Label ID="lblWarning" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <asp:Button ID="btnContinuar" runat="server" class="btn btn-lg btn-primary btn-block" Text="Continuar >>" OnClick="btnContinuar_Click" />
                                                    </div>
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <br />
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-md-6 text-right-md item-caption">
                                                            <asp:Button ID="btnAgregar" runat="server" class="btn btn-primary btn-hh-trigger" Text="Nuevo" OnClick="btnAgregar_Click" />
                                                        </div>
                                                        <div class="col-md-6 text-left-md item-caption">
                                                            <asp:Button ID="btnActualizar" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnActualizar_Click" />
                                                        </div>


                                                    </div>
                                                </fieldset>
                                         

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ========Pensum ========================================================================= -->
                        <!-- /agregar  -->
                        <!-- ========Pensum ========================================================================= -->
                        <div runat="server" id="agregar" visible="false">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3">
                                    <div class="panel panel-pricing" style="background-color: transparent">
                                        <div class="panel-heading" style="color: orangered">
                                            <h3><b>Nuevo Pensum Académico</b>
                                            </h3>
                                        </div>
                                        <div class="panel-body" style="background-color: transparent">
                                            
                                                <fieldset>
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <span class="input-group-addon"><i class="fa fa-fw fa-list-ul"></i></span>
                                                            <asp:TextBox ID="txtNombre" runat="server" class="form-control" placeholder="Nombre Malla Curricular"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <span class="input-group-addon"><i class="fa fa-fw fa-list-ul"></i></span>
                                                            <asp:TextBox ID="txtPensum" runat="server" class="form-control" placeholder="Pensum Académico"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <span class="input-group-addon"><i class="fa fa-fw fa-university"></i></span>
                                                            <asp:DropDownList ID="ddlEstado" AutoPostBack="true" runat="server" class="form-control" placeholder="Pensum">
                                                                <asp:ListItem>Vigente</asp:ListItem>
                                                                <asp:ListItem>Caducado</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <asp:Button ID="btnGuardar" runat="server" class="btn btn-lg btn-primary btn-block" Text="Guardar" OnClick="btnGuardar_Click" />
                                                    </div>
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <br />
                                                    </div>

                                                </fieldset>
                                            

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ========Pensum ========================================================================= -->
                        <!-- /agregar -->
                        <!-- ========actualizar ========================================================================= -->
                        <div runat="server" id="actualizar" visible="false">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3">
                                    <div class="panel panel-pricing" style="background-color: transparent">
                                        <div class="panel-heading" style="color: orangered">
                                            <h3><b>Actualizar Pensum Académico</b>
                                            </h3>
                                        </div>
                                        <div class="panel-body" style="background-color: transparent">
                                            
                                                <fieldset>
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <span class="input-group-addon"><i class="fa fa-fw fa-list-ul"></i></span>
                                                            <asp:TextBox ID="txtNombreActualizar" runat="server" class="form-control" placeholder="Nombre Malla Curricular"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <span class="input-group-addon"><i class="fa fa-fw fa-list-ul"></i></span>
                                                            <asp:TextBox ID="txtPensumActualizar" runat="server" class="form-control" placeholder="Pensum Académico"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="input-group input-group-lg">
                                                            <span class="input-group-addon"><i class="fa fa-fw fa-university"></i></span>
                                                            <asp:DropDownList ID="ddlActualizarEstado" AutoPostBack="true" runat="server" class="form-control" placeholder="Pensum">
                                                                <asp:ListItem>Vigente</asp:ListItem>
                                                                <asp:ListItem>Caducado</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <asp:Button ID="btnActualizarPensum" runat="server" class="btn btn-lg btn-primary btn-block" Text="Guardar" OnClick="btnActualizarPensum_Click" />
                                                    </div>
                                                    <div class="col-md-12 text-right-md item-caption">
                                                        <br />
                                                    </div>

                                                </fieldset>
                                       

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ========Actualizar ========================================================================= -->
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <!-- Required JavaScript Libraries -->
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/stellar/stellar.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="contactform/contactform.js"></script>

    <!-- Template Specisifc Custom Javascript File -->
    <script src="js/custom.js"></script>

    <!--Custom scripts demo background & colour switcher - OPTIONAL -->
    <script src="js/color-switcher.js"></script>

    <!--Contactform script -->
    <script src="contactform/contactform.js"></script>

</body>

</html>
