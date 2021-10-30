<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Administracion.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Login - Tecnologías de la Información</title>
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
</head>

<!-- ======== @Region: body ======== -->

<body class="fullscreen-centered page-login">
    <!--Change the background class to alter background image, options are: benches, boots, buildings, city, metro -->
    <div id="background-wrapper" class="benches"  data-stellar-background-ratio="0.8">

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
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title">Inicio de Sesión
                            </h1>
                        </div>
                        <div class="panel-body">
                            <form accept-charset="UTF-8" role="form" runat="server">
                                <fieldset>
                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon"><i class="fa fa-fw fa-user"></i></span>
                                            <asp:TextBox ID="txtUsuario" class="form-control" placeholder="Usuario" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon"><i class="fa fa-fw fa-lock"></i></span>
                                            <asp:TextBox ID="txtContrasena" class="form-control" type="password" placeholder="Contraseña" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">
                                            Mantener la sesión iniciada
                                        </label>
                                    </div>
<%--                                    <input class="btn btn-lg btn-primary btn-block" type="submit" value="Iniciar Sesión">--%>
                                    <asp:Button ID="btnInicioSesion" runat="server" class="btn btn-lg btn-primary btn-block" Text="Iniciar Sesión" OnClick="btnInicioSesion_Click" />
                                </fieldset>
                            </form>
                            <p class="m-b-0 m-t">¿No estás registrado? <a href="Registro.aspx">Registrate aquí</a>.</p>
                            <div class="credits">
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
    </div>
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
