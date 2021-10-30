<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminInicio.aspx.cs" Inherits="Administracion.AdminInicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--Paso de imagenes-->
    <form runat="server">
        <!--Imagenes  s#########################################################################################-->
        <div id="background-wrapper" class="city" data-stellar-background-ratio="0.1">
            <div runat="server" id="imagenes" visible="true">

                <div class="hero" id="highlighted">
                    <div class="inner">
                        <!--Slideshow-->
                        <div id="highlighted-slider" class="container">
                            <div class="col-md-12 text-right-md item-caption">
                                <asp:Button ID="btnCambiar" runat="server" class="btn btn-primary btn-hh-trigger" Text="Actualizar" OnClick="btnCambiar_Click" />
                            </div>
                            <div class="item-slider" data-toggle="owlcarousel" data-owlcarousel-settings='{"singleItem":true, "navigation":true, "transitionStyle":"fadeUp"}'>
                                <!--Slideshow fotos  content-->

                                <!--Slide 1-->
                                <div class="item">

                                    <div class="row">
                                        <div class="col-md-12 text-right-md item-caption">
                                            <img src="images/slides/slide1.png" alt="" class="center-block img-responsive">
                                        </div>

                                    </div>
                                </div>
                                <!--Slide 2-->
                                <div class="item">
                                    <div class="row">
                                        <div class="col-md-12 text-right-md item-caption">
                                            <img src="images/slides/slide2.png" alt="" class="center-block img-responsive">
                                        </div>

                                    </div>
                                </div>
                                <!--Slide 3-->
                                <div class="item">
                                    <div class="row">
                                        <div class="col-md-12 text-right-md item-caption">
                                            <img src="images/slides/slide3.png" alt="" class="center-block img-responsive">
                                        </div>

                                    </div>
                                </div>
                                <!--Slide 4-->
                                <div class="item">
                                    <div class="row">
                                        <div class="col-md-12 text-right-md item-caption">
                                            <img src="images/slides/slide4.png" alt="" class="center-block img-responsive">
                                        </div>

                                    </div>
                                </div>
                                <!--Slide 5-->
                                <div class="item">
                                    <div class="row">
                                        <div class="col-md-12 text-right-md item-caption">
                                            <img src="images/slides/slide5.png" alt="" class="center-block img-responsive">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <!--Actualizar imagenes#########################################################################################-->
            <div class="row">
                <div class="col-lg-12 col-xs-12">
                    <div runat="server" id="actualizarimagenes" visible="false">
                        <div class="col-sm-6 col-sm-offset-3">
                            <div class="panel panel-pricing" style="background-color:transparent">
                                <div class="panel-heading text-center" style="color:white">
                                    <h2>Fotos</h2>
                                </div>
                                <div class="panel-body" style="background-color:transparent">

                                    <div class="form-group">
                                        <div class="input-group input-group-lg">
                                            <span class="input-group-addon"><i class="fa fa-fw fa-image"></i></span>
                                            <asp:FileUpload ID="filePea" class="form-control" runat="server" placeholder="Plan de Estudios" BackColor="Transparent" ForeColor="White" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                         <div class="col-md-12 text-center-md item-caption">
                                            <asp:Button ID="btnGuardar" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" OnClick="btnGuardar_Click" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%-- <div runat="server" id="actualizarimagenes" visible="false">
                <div class="form-group">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon"><i class="fa fa-fw fa-image"></i></span>
                        <asp:FileUpload ID="fileSlide" class="form-control" runat="server" placeholder="Slide" />
                    </div>
                </div>
                <div class="col-md-12 text-center-md item-caption">
                </div>
            </div>--%>
        </div>
        <!--fin actualizar imagenes#########################################################################################-->
        <!--Eventos noticias#########################################################################################-->
        <div runat="server" id="eventos" visible="true">
            <div class="testimonials block-contained">
                <div class="row">

                    <div class="col-md-6 m-b-lg">
                        <h3 class="block-title">Eventos - Noticias
                        </h3>
                        <blockquote>
                            <p>Lo que sabemos es una gota de agua; lo que ignoramos es el océano</p>
                            <%-- <img src="img/misc/charles-quote.png" alt="Charles Spencer Chaplin">--%>
                            <small>
                                <strong>Isaac Newton</strong>
                            </small>
                        </blockquote>
                    </div>
                    <!--Latest Blog posts-->
                    <div class="col-md-6 blog-roll">
                        <h3 class="block-title">Últimos eventos - noticias
                        </h3>
                        <!-- Blog post 1-->
                        <div class="media">
                            <div class="media-left hidden-xs">
                                <!-- Date desktop -->
                                <div class="date-wrapper"><span class="date-m">Abr</span> <span class="date-d">10</span> </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="#" class="text-weight-strong">tecnología MicroLED</a>
                                </h4>
                                <!-- Meta details mobile -->
                                <ul class="list-inline meta text-muted visible-xs">
                                    <li><i class="fa fa-calendar"></i><span class="visible-md">Creado:</span> Mar 10 Abr 2019</li>
                                    <li><i class="fa fa-user"></i><a href="#">Administrador</a></li>
                                </ul>
                                <p>
                                    <strong>Cómo es la tecnología MicroLED que permitió crear la pantalla mas grande del mundo con 20 metros</strong> Sony está instalando una colosal pantalla en una firma de cosméticos en Japón
                <a href="#">Leer más <i class="fa fa-angle-right"></i></a>
                                </p>
                            </div>
                        </div>
                        <!-- Blog post 2 -->
                        <div class="media">
                            <div class="media-left hidden-xs">
                                <!-- Date desktop -->
                                <div class="date-wrapper"><span class="date-m">Abr</span> <span class="date-d">6</span> </div>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">
                                    <a href="#" class="text-weight-strong">Seguridad en Internet</a>
                                </h4>
                                <!-- Meta details mobile -->
                                <ul class="list-inline meta text-muted visible-xs">
                                    <li><i class="fa fa-calendar"></i><span class="visible-md">Creado:</span> Vie 06 Abr 2019</li>
                                    <li><i class="fa fa-user"></i><a href="#">Admin</a></li>
                                </ul>
                                <p>
                                    Por qué la seguridad en internet debería ser más  como un camaleón que un rinoceronte.  
                <a href="#">Leer más <i class="fa fa-angle-right"></i></a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 text-center-md item-caption">
                        <asp:Button ID="btnActualizarEvento" runat="server" class="btn btn-primary btn-hh-trigger" Text="Agregar Evento-Noticia" />
                    </div>
                </div>
            </div>
        </div>
        <!--datos importantes-->
        <!--Actualizar eventos#########################################################################################-->
        <div runat="server" id="actualizarevento" visible="false">
            <div class="col-md-12 text-center-md item-caption">
                <asp:Button ID="btnGuardarEvento" runat="server" class="btn btn-primary btn-hh-trigger" Text="Guardar" />
            </div>
        </div>

        <!--fin actualizar eventos#########################################################################################-->

    </form>
    <!--Paso de imagenes-->
</asp:Content>
