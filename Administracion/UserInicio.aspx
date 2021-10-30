<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UserMaster.Master" CodeBehind="UserInicio.aspx.cs" Inherits="Administracion.UserInicio" %>

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
                           
                            <div class="item-slider" data-toggle="owlcarousel" data-owlcarousel-settings='{"singleItem":true, "navigation":true, "transitionStyle":"fadeUp"}'>
                                <!--Slideshow content-->

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
            
           
        </div>
        
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
                   
                </div>
            </div>
        </div>
        <!--datos importantes-->
       

    </form>
</asp:Content>