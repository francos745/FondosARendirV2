<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cambiarPass.aspx.vb" Inherits="cambiarPass" %>



<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Cambiar Contraseña</title>
       <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <meta charset="utf-8"/>
    <link rel="shortcut icon" href="img/clever.png" />
    <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    
    <script src="Scripts/jquery-1.10.2.min.js"></script>    
    <script src="Scripts/bootstrap.min.js"></script>
	<!--SIRVE PARA EL MENU DESPLEGABLE DEL USUARIO-->
    <script src="Scripts/bootstrap-hover-dropdown.js"></script>    
    <script src="Scripts/jquery.menu.js"></script>
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="Content/jquery-ui-1.10.4.custom.min.css">
    <link type="text/css" rel="stylesheet" href="Content/font-awesome.min.css">

    <link type="text/css" rel="stylesheet" href="Content/animate.css">    
    <link type="text/css" rel="stylesheet" href="Content/main.css">
    <link type="text/css" rel="stylesheet" href="Content/style-responsive.css">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet" />
    <link href="css/responsive.bootstrap.min.css" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/styles.css" rel="stylesheet"/>
   
    <link href="css/Estilos.css" rel="stylesheet" />
    <!-- Include Date Range Picker -->
    <link href="css/daterangepicker.css" rel="stylesheet"  />
    
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script> 
    
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/select2.full.js"></script>
    <script src="js/sum().js"></script>
    
    <!----generación de archivos pdf----->
    
    <script src="js/jspdf.debug.js"></script>
    <script src="js/jspdf.plugin.autotable.js"></script>

    <!-- Include Date Range Picker -->
    <script src="js/daterangepicker.js"></script>
    <script src="js/jquery.numeric.min.js"></script>
    <link href="css/alertify.core.css" rel="stylesheet" />
    <link href="css/alertify.bootstrap.css" rel="stylesheet" />    
    <script src="js/alertify.min.js"></script>
	<link href="css/select2.min.css" rel="stylesheet" />    


    

    <style type="text/css">
        body{font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;color:#444;font-size:13px;}
        p,div,ul,li{padding:0px; margin-right: 0px;
            margin-top: 0px;
            margin-bottom: 0px;
        }
    </style>


    <style type="text/css">
        body
        {
            margin: 0;
            padding: 0;
            font-family: Arial;
        }
        .modals
        {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }
        .centers
        {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }
        .center img
        {
            height: 128px;
            width: 128px;
        }
    </style>

</head>



<body>
    <form runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <div class="modals">
                            <div class="centers">
                                <img alt="" src="img/ajax_loader.gif" />
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <!--BEGIN BACK TO TOP-->
                <a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
                <!--END BACK TO TOP-->
		
                <!--BEGIN TOPBAR-->
                <div id="header-topbar-option-demo" class="page-header-topbar">
                    <nav id="topbar" role="navigation" style="margin-bottom: 0;" data-step="3" class="navbar navbar-default navbar-static-top">
                        <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target=".sidebar-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a id="logo" href="index.html" class="navbar-brand"><span class="fa fa-rocket"></span><span>Fondos a Rendir</span><span style="display: none" class="logo-text-icon">µ</span></a></div>
                      <div class="topbar-main"><a id="menu-toggle" href="#" class="hidden-xs"><i class="fa fa-bars"></i></a>
                
                <ul class="nav navbar navbar-top-links navbar-right mbn">
					<li class="dropdown topbar-user"><a data-hover="dropdown" href="#" class="dropdown-toggle"><img src="images/avatar/48.jpg" alt="" class="img-responsive img-circle"/>&nbsp;<span class="hidden-xs"><asp:Label ID="lblUsuario" runat="server" Text=""></asp:Label></span>&nbsp;<span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-user pull-right">
                            <li><a href="#"><i class="fa fa-user"></i><asp:Label ID="lblNombreUsuario" runat="server" Text=""></asp:Label></a></li>
                            <li><a href="datosPersonales.aspx"><i class="fa fa-list-alt"></i>Información Personal</a></li>

                            <li class="divider"></li>
                            <li><a href="cambiarPass.aspx"><i class="fa fa-key"></i>Cambiar Contraseña</a></li>
                            <li><a href="cerrarSesion.aspx"><i class="fa fa-sign-out"></i>Cerrar Sesión</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
                    </nav>
                </div>
                <!--END TOPBAR-->
                <div id="wrapper">
                    <!--BEGIN SIDEBAR MENU-->
                    <nav id="sidebar" role="navigation" data-step="2" data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;" data-position="right" class="navbar-default navbar-static-side">
                        <div class="sidebar-collapse menu-scroll">
                            <ul id="side-menu" class="nav">
                    
                                 <div class="clearfix"></div>
                                 <li><a href="NuevaRendicion.aspx"><i class="fa fa-money">
                                    <div class="icon-bg bg-orange"></div>
                                </i><span class="menu-title">Nueva Rendición con Fondos</span></a></li>
					
                                 <li><a href="NuevaRendicionSF.aspx"><i class="fa fa-file">
                                    <div class="icon-bg bg-pink"></div>
                                </i><span class="menu-title">Nueva Rendición sin Fondos</span></a>
                       
                                </li>

                                <li><a href="imprimirRendicion.aspx"><i class="fa fa-print">
                                    <div class="icon-bg bg-pink"></div>
                                </i><span class="menu-title">Reimprimir Rendición</span></a>
                       
                                </li>
                                <li class="active"><a href="cambiarPass.aspx"><i class="fa fa-key">
                                    <div class="icon-bg bg-blue"></div>
                                </i><span class="menu-title">Cambiar Contraseña</span></a>
                          
                                </li>
                                <li><a href="cerrarSesion.aspx"><i class="fa fa-sign-out">
                                    <div class="icon-bg bg-red"></div>
                                </i><span class="menu-title">Cerrar Sesión</span></a>
                      
                                </li>
                    
                            </ul>
                        </div>
                    </nav>
        
            
                    <div id="page-wrapper">

                        <!--BEGIN TITLE & BREADCRUMB PAGE-->
                        <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                            <div class="page-header pull-left">
                                <div class="page-title">
                                   Cambiar Contraseña</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Inicio</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                                <li class="hidden"><a href="#">cambiar Contraseña</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                                <li class="active">Cambiar Contraseña</li>
                            </ol>
                            <div class="clearfix">
                            </div>
                        </div>
                        <!--END TITLE & BREADCRUMB PAGE-->

                        <!--------------------------------------------------------------------------------BEGIN CONTENT--------------------------------------------------------------------------------->
                            <div class="page-content">
                                     <asp:Label ID="lblPass"  runat="server" style="display:none;" Text="Label"></asp:Label>
                                     <asp:Label ID="lblId"  runat="server" style="display:none;" Text="Label"></asp:Label>
                                    
                                    <div class="row" >
                                    <!-- Modal content-->
                                        <div class="col-sm-6" >
                                            
                                            <div class="modal-body form-horizontal">
                                                <div class="control-group">
                                                    <label for="actual" class="control-label">Contraseña Actual</label>
                                                    <div class="controls">
                                                        <input id="txtPassActual" type="password" name="actual" runat="server" onkeyup="checkPassAnterior(this.value)" class="form-control input-lg" placeholder="Contraseña Actual" />
                                                        <h4><span class="" id="password_same"><asp:Label ID="txtPassSame" runat="server" Text=""></asp:Label></span></h4>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="nueva" class="control-label">Nueva Contraseña</label>
                                                    <div class="controls">
                                                        <input id="txtPassNueva" type="password" name="nueva" runat="server" onkeyup="CheckPasswordStrength(this.value);comparePass();" class="form-control input-lg" placeholder="Nueva Contraseña" />
                                                        <h4><span class="" id="password_strength"><asp:Label ID="txtPassStrength" runat="server" Text=""></asp:Label></span></h4>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label for="confirm" class="control-label">Confirmar Contraseña</label>
                                                    <div class="controls">
                                                        <input id="txtPassConfirmar" name="confirm" type="password" runat="server" onkeyup="comparePass()" class="form-control input-lg" placeholder="Confirmar Contraseña"/>
                                                        <h4><span class="" id="password_compare"><asp:Label ID="txtPassCompare" runat="server" Text=""></asp:Label></span></h4>
                                                    </div>
                                                </div>
                    
                   
                                            </div>
                                            <div class="modal-footer">
                                                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                                    <div class="btn-group" role="group">
                                                        <input id="btnPassAceptar" type="button" value="Aceptar" runat="server" class="btn btn-primary btn-lg disabled" />
                                                    </div>
  
                                                   
                                                </div>
                                                <div class="text-center" >
                                                    <div runat="server" id="lblMensajeErrorS" class="">
                                                        <strong><asp:Label ID="lblMensajeError" runat="server" Text=""></asp:Label></strong>
                                                    </div>
                                                    <div runat="server" id="lblMensajeS" class="">
                                                        <strong><asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label></strong>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               
                                 

                            </div>
                        </div>
                        <!---------------------------------------------------------------------------------------------END CONTENT------------------------------------------------------------------------------------->


                        <!--BEGIN FOOTER-->
                        <div id="footer">
                            <div class="copyright">
                                <a href="http://clever.bo/">2017 © Clever LTDA</a>
						        </div>
                        </div>
                        <!--END FOOTER-->
                    </div>
                </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>


    </form>
     <script type="text/javascript">

               function checkPassAnterior(password){
                   var passAnt = document.getElementById('<%= lblPass.ClientID %>').innerHTML;
                   var pass = password;
                   if (pass == passAnt) {
                       document.getElementById("password_same").className = "label label-success";
                       document.getElementById('<%= txtPassSame.ClientID %>').innerHTML = "Las contraseñas coinciden"; 
                   }
                   else {
                       document.getElementById("password_same").className = "label label-danger";
                       document.getElementById('<%= txtPassSame.ClientID %>').innerHTML = "Las contraseñas no coinciden"; 
                   }
                   var classA = document.getElementById("password_same").className;
                   var classB = document.getElementById("password_strength").className;
                   var classC = document.getElementById("password_compare").className;
                   if (classA == "label label-success" && classB == "label label-success" && classC == "label label-success") {
                        document.getElementById("btnPassAceptar").className = "btn btn-primary btn-lg";
                   }
                   else {
                       document.getElementById("btnPassAceptar").className = "btn btn-primary btn-lg disabled";
                   }

               }

       function CheckPasswordStrength(password) {
            var password_strength = document.getElementById("password_strength");

            //TextBox left blank.
            if (password.length == 0) {
                document.getElementById('<%= txtPassStrength.ClientID %>').innerHTML = ""; 
                document.getElementById("password_strength").className = "";
                return;
            }

            

            //Regular Expressions.
            var regex = new Array();
            regex.push("[A-Z]"); //Uppercase Alphabet.
            regex.push("[a-z]"); //Lowercase Alphabet.
            regex.push("[0-9]"); //Digit.
            regex.push("[$@$!%*#?&]"); //Special Character.

            var passed = 0;

            //Validate for each Regular Expression.
            for (var i = 0; i < regex.length; i++) {
                if (new RegExp(regex[i]).test(password)) {
                    passed++;
                }
            }

            //Validate for length of Password.
            if (password.length < 5 && password.length > 0) {
                
                passed = 99;

            }
            else {
                passed++;
            }
            
           

            //Display status.
            var color = "";
            var strength = "";
            switch (passed) {
                case 0:
                    
                case 1:strength = "Muy débil: Combine mayúsculas, minúsculas y números ";
                    color = "label label-danger";
                    break;
                    
                case 2:strength = "Débil: Combine mayúsculas, minúsculas y números";
                    color = "label label-warning";
                    break;
                    
                case 3:  strength = "Fuerte";
                    color = "label label-success";
                    break;
                case 4:strength = "Muy Fuerte";
                    color = "label label-success";
                    break;
                   
                case 5:
                    
                case 99:
                    
                    cuenta = password.length;
                    cuenta = 5 - cuenta
                    strength = "Ingrese al menos " + cuenta +  " caracteres más";
                    color = "label label-danger";
                    break;
            }
            document.getElementById('<%= txtPassStrength.ClientID %>').innerHTML = strength; 
           document.getElementById("password_strength").className = color;

           var classA = document.getElementById("password_same").className;
           var classB = document.getElementById("password_strength").className;
           var classC = document.getElementById("password_compare").className;
           if (classA == "label label-success" && classB == "label label-success" && classC == "label label-success") {
               document.getElementById("btnPassAceptar").className = "btn btn-primary btn-lg";
           }
           else {
               document.getElementById("btnPassAceptar").className = "btn btn-primary btn-lg disabled";
           }
       }

               function comparePass() {
                    var passAnt = document.getElementById('<%= txtPassNueva.ClientID %>').value;
                   var pass = document.getElementById('<%= txtPassConfirmar.ClientID %>').value;
                   if (pass == passAnt) {
                       document.getElementById("password_compare").className = "label label-success";
                       document.getElementById('<%= txtPassCompare.ClientID %>').innerHTML = "Las contraseñas coinciden"; 
                   }
                   else {
                       document.getElementById("password_compare").className = "label label-danger";
                       document.getElementById('<%= txtPassCompare.ClientID %>').innerHTML = "Las contraseñas no coinciden"; 
                   }
                   var classA = document.getElementById("password_same").className;
                   var classB = document.getElementById("password_strength").className;
                   var classC = document.getElementById("password_compare").className;
                   if (classA == "label label-success" && classB == "label label-success" && classC == "label label-success") {
                       document.getElementById("btnPassAceptar").className = "btn btn-primary btn-lg";
                   }
                   else {
                       document.getElementById("btnPassAceptar").className = "btn btn-primary btn-lg disabled";
                   }

               }
    </script>
    <script src="Scripts/jquery-migrate-1.2.1.min.js"></script>   
    
</body>
</html>

