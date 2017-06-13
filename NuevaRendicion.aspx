<%@ Page Language="VB" AutoEventWireup="true" CodeFile="NuevaRendicion.aspx.vb" Inherits="NuevaRendicion" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Solicitudes Aprobadas</title>
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
                            <li><a href="#"><i class="fa fa-user"></i>My Profile</a></li>
                            <li><a href="#"><i class="fa fa-calendar"></i>My Calendar</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i>My Inbox<span class="badge badge-danger">3</span></a></li>
                            <li><a href="#"><i class="fa fa-tasks"></i>My Tasks<span class="badge badge-success">7</span></a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-lock"></i>Lock Screen</a></li>
                            <li><a href="Login.html"><i class="fa fa-key"></i>Log Out</a></li>
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
                                 <li class="active"><a href="dashboard.html"><i class="fa fa-money">
                                    <div class="icon-bg bg-orange"></div>
                                </i><span class="menu-title">Nueva Rendición con Fondos</span></a></li>
					
                                 <li><a href="Layout.html"><i class="fa fa-file">
                                    <div class="icon-bg bg-pink"></div>
                                </i><span class="menu-title">Nueva Rendición sin Fondos</span></a>
                       
                                </li>

                                <li><a href="Layout.html"><i class="fa fa-print">
                                    <div class="icon-bg bg-pink"></div>
                                </i><span class="menu-title">Reimprimir Rendición</span></a>
                       
                                </li>
                                <li><a href="Tables.html"><i class="fa fa-key">
                                    <div class="icon-bg bg-blue"></div>
                                </i><span class="menu-title">Cambiar Contraseña</span></a>
                          
                                </li>
                                <li><a href="DataGrid.html"><i class="fa fa-sign-out">
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
                                    Nueva Rendición con Fondos</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Inicio</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                                <li class="hidden"><a href="#">Nueva Rendición con Fondos</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                                <li class="active">Nueva Rendición con Fondos</li>
                            </ol>
                            <div class="clearfix">
                            </div>
                        </div>
                        <!--END TITLE & BREADCRUMB PAGE-->

                        <!--------------------------------------------------------------------------------BEGIN CONTENT--------------------------------------------------------------------------------->
                        <div class="page-content">
                            <div id="tab-general">
                                <div class="row">
                                    <div class="col-sm-4" >
                                        <div class="control-group">
                                            <label for="nueva" class="control-label"> Número de Solicitud: </label>
                                            <div class="controls" style="text-align:left;">
                                                
                                                <asp:DropDownList ID="cmbRendicion" runat="server" class="mySelect" Width="100%"></asp:DropDownList>
                                                
                                                <div class="alert alert-info" style="display:none;"><asp:Label ID="lblId" runat="server" Text=""></asp:Label></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-8" >
                                        <fieldset class="row" id="contTextos" runat="server" disabled="disabled" >
                                            <div class="col-sm-6" >
                                                <div class="control-group">
                                           
                                                    <div class="controls" style="text-align:left;">
                                                        <h5><span class=""><asp:Label ID="lblSubtitulo" runat="server" Text=""></asp:Label></span></h5>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6" >
                                                <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                                    <div class="btn-group" role="group">
                                                        <input id="btnGuardar" type="button" value="Generar" data-target="#modalConfirmarGuardar" class="btn btn-primary btn-md" runat="server" data-toggle="modal" data-backdrop="static" />
                                                    </div>                        
                                                    <div class="btn-group" role="group">
                                                        <input id="btnDescarta" type="button" value="Descartar" data-target="#modalConfirmarDescartar" class="btn btn-default btn-md" runat="server" data-toggle="modal" data-backdrop="static" />
                                                    </div>
                                                </div>
                                            </div>             
                                        </fieldset>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col-sm-8" >
                                       <div class="col-sm-3" >
                                                 <div class="control-group">                                                    
                                                    <div class="controls" style="text-align:left;">
                                                         <h5><span class="label label-default" runat="server" id="lblCodigoRendS">Código: <asp:Label ID="lblCodigoRend" runat="server" Text="400"></asp:Label>  </span></h5>
                                                    </div>
                                                </div>
                                            </div>
                                   
                                        
                                            <div class="col-sm-3" >
                                                 <div class="control-group">                                                    
                                                    <div class="controls" style="text-align:left;">
                                                         <h5><span class="label label-primary" runat="server" id="lblAsignadoS">Asignado: <asp:Label ID="lblAsignado" runat="server" Text="250000.06"></asp:Label>  </span></h5>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-sm-3" >
                                                 <div class="control-group">
                                                    
                                                    <div class="controls" style="text-align:left;">
                                                         <h5><span class="label label-info" runat="server" id="lblRendidoS">Rendido:  <asp:Label ID="lblRendido" runat="server" Text="250.06"></asp:Label>  </span></h5>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-sm-3" >
                                                 <div class="control-group">
                                                    
                                                    <div class="controls" style="text-align:left;">
                                                         <h5><span class="label label-info" runat="server" id="lblPorRendirS">Por rendir:  <asp:Label ID="lblPorRendir" runat="server" Text="250000.06"></asp:Label>  </span></h5>
                                                    </div>
                                                </div>
                                            </div>     
                                                 
                                        
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-sm-4" >
                                        <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                                    <div class="btn-group" role="group">
                                                        <button id="btnAgregar" runat="server" class="btn btn-primary btn-md" data-backdrop="static" data-target="#modalComprobante" data-toggle="modal" type="button">Agregar Comprobante (+)</button>
                                                    </div>                        
                                                   
                                                </div>
                                    </div>

                                    <div class="col-sm-8" >
                                        
                                    </div>
                                </div>
                                <div class="row">
                                    
                                     <div class="table-responsive" >
                                        <div class="control-group" id="dtgFacturaS" runat="server">
                                            <table id="dtgComprobante" class="testgrid1" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>NIT</th>
                                                        <th>NOMBRE PROVEEDOR</th>
                                                        <th>NRO. COMPROBANTE</th>
                                                        <th>NRO. AUTORIZACIÓN</th>
                                                        <th>CÓDIGO DE CONTROL</th>
                                                        <th>FECHA</th>
                                                        <th>IMPORTE</th>
                                                        <th>IMPORTE CRÉDITO FISCAL</th>
                                                    </tr>
                                                </thead>
                                                
                                               
                                            </table>
                                        </div> 

                                         <asp:SqlDataSource ID="dsFactura" runat="server" ProviderName="System.Data.SqlClient" >
                                             <SelectParameters>
                                                <asp:ControlParameter ControlID="lblFac" DefaultValue="ninguno" Name="DETALLE_FACTURA" PropertyName="text" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
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


        <!------------------INICIO MODALS-------------------------------------->

                                



    <!--INICIO MODAL COMPROBANTE-->

    <div class="modal fade bs-example-modal-lg" tabindex="-1"  id="modalComprobante"  role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                       <h2>Detalles del Comprobante: <span class="extra-title muted"></span></h2>
                </div>
                <div class="modal-body form-horizontal">
                    
                    <div class="btn-group btn-group-justified">
                        
                        
                        <div class="row">
                             <div class="col-sm-3" id="txtNitS" runat="server">   
                                <label for="nueva" class="control-label">Nit Proveedor:</label>
                                <div class="controls">
                                     <asp:TextBox ID="txtNit" maxlength="50"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div> 
                                                                                   
                            </div> 
                            <div class="col-sm-3">  
                                <div runat="server" id="lblRazonSocialS" class="alert alert-info" style="display:none;"><asp:Label ID="lblRazonSocial" runat="server"></asp:Label></div>
                                                     
                            </div> 
                            <div class="col-sm-3" id="txtNitAdicionalS" runat="server" style="display:none;">    

                                <label for="nueva" class="control-label">Nombre Proveedor:</label>
                                <div class="controls">
                                    <asp:TextBox ID="txtNitAdicional" runat="server" class="form-control input-sm" placeholder="Nombre del proveedor"></asp:TextBox>                               
                                </div> 
                                         
                            </div> 
                            <div class="col-sm-3" id="btnNitS" runat="server" style="display:none;">
                               <button id="btnNitSi" runat="server" class="btn btn-info btn-md" data-backdrop="static" data-target="#modalNuevoNit" data-toggle="modal" type="button">Si</button>
                               <button id="btnNitNo" runat="server" class="btn btn-info btn-md" type="button">No</button>
                            </div> 
                           
                           
                        </div>
                       
                    <fieldset id="fsImporte" runat="server">
                        <div class="row">
                            
                            <div class="col-sm-3" id="txtFacturaS" runat="server">  
                                 <label for="nueva" class="control-label"><asp:Label ID="lblFac" runat="server" Text="Número de Factura:"></asp:Label></label>
                                <div class="controls">
                                     <asp:TextBox ID="txtFactura" maxlength="50"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div>                                                      
                            </div> 
                            <div class="col-sm-3" id="txtCodControlS" runat="server">    
                                <label for="nueva" class="control-label">Código de Control:</label>
                                <div class="controls">
                                     <asp:TextBox ID="txtCodControl" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div>                            
                            </div> 
                            <div class="col-sm-3" id="txtAutorizaS" runat="server">
                                <label for="nueva" class="control-label">No. de Autorización:</label>
                                <div class="controls">
                                     <asp:TextBox ID="txtAutoriza" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div>
                            </div> 
                       
                                
                                <div class="col-sm-3" id="txtFechaS" runat="server">  
                                     <label for="nueva" class="control-label">Fecha:</label>
                                    <div class="controls">
                                         <asp:TextBox ID="txtFecha" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                    </div>                                                      
                                </div> 
                                <div class="col-sm-3" id="txtImporteS" runat="server">    
                                    <label for="nueva" class="control-label">Importe:</label>
                                    <div class="controls">
                                         <asp:TextBox ID="txtImporte" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                    </div>                            
                                </div> 
                                <div class="col-sm-3" id="txtImporteCredFiscS" runat="server">
                                    <label for="nueva" class="control-label">Importe para crédito Fiscal:</label>
                                    <div class="controls">
                                         <asp:TextBox ID="txtImporteCredFisc" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                    </div>
                                </div> 
                            
                            
                        </div>
                       
                       
                       
                        </fieldset>
                        
                        
                        
                        
                    </div>
                    
                    
                    
                    
                   
                </div>
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="...">
                        <div class="btn-group" role="group">    
                                                    
                            <input id="btnAceptarComp" type="button" value="Aceptar" runat="server" dismiss="modal" class="btn btn-primary btn-md" />
                        </div>
  
                        <div class="btn-group" role="group">                            
                            <input id="btnAgregarLineaComp" type="button" value="Agregar Línea (+)" runat="server" data-target="#myModal2" class="btn btn-info btn-md" data-toggle="modal" data-backdrop="static" />
                        </div>

                        <div class="btn-group" role="group">
                            <input id="btnEliminarComp" type="button" value="Eliminar Comprobante" runat="server" data-dismiss="modal" class="btn btn-danger btn-md" />
                        </div>
                        <div class="btn-group" role="group">
                            <input id="btnVolverComp" type="button" value="Cancelar" runat="server" data-dismiss="modal" class="btn btn-default btn-md" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- FIN MODAL COMPROBANTE -->


   <!-- INICIO REGISTRO DE NUEVO NIT-->
    <div class="modal fade" id="modalNuevoNit" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header text-center">
                   <h2>Registro de Nuevo Nit <span class="extra-title muted"></span></h2>
                </div>
                <div class="modal-body form-horizontal">
                    
                    <div class="control-group">
                        <label for="nueva" class="control-label">Razón Social:</label>
                        <div class="controls">
                            <input id="txtRazonSocial2" type="text" runat="server" class="form-control input-md" placeholder="Razón Social" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label for="nueva" class="control-label">Rótulo Comercial: </label>
                        <div class="controls">
                            <input id="txtAlias2" type="text" runat="server" class="form-control input-md" placeholder="Alias" />
                        </div>
                    </div>
                    
                    
                   
                </div>
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="...">
                        <div class="btn-group" role="group">
                            <input id="btnNitAceptar" type="button" value="Aceptar" runat="server" dismiss="modal" class="btn btn-primary btn-md" />
                        </div>
  
                        <div class="btn-group" role="group">
                            <input id="btnNitCancelar" type="button" value="Cancelar" runat="server" data-dismiss="modal" class="btn btn-default btn-md" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- INICIO REGISTRO DE NUEVO NIT-->

    <!--INICIO MODAL LINEAS-->
    <div class="modal fade bs-example-modal-lg" tabindex="-1"  id="modalLineas"  role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                   <h2>Detalles del Comprobante: <span class="extra-title muted"></span></h2>
                </div>
                <div class="modal-body form-horizontal">
                    
                    <div class="btn-group btn-group-justified">
                        <fieldset class="row" id="Fieldset3" runat="server" >
                        
                        <div class="row">
                             <div class="col-sm-3" id="Div1" runat="server">   
                                 <label for="nueva" class="control-label">Nit Proveedor:</label>
                                <div class="controls">
                                     <asp:TextBox ID="TextBox1" maxlength="50"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div>                                                     
                            </div> 
                            <div class="col-sm-3" id="Div2" runat="server">  
                                 <label for="nueva" class="control-label">Número de Factura:</label>
                                <div class="controls">
                                     <asp:TextBox ID="TextBox2" maxlength="50"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div>                                                      
                            </div> 
                            <div class="col-sm-3" id="Div3" runat="server">    
                                <label for="nueva" class="control-label">Código de Control:</label>
                                <div class="controls">
                                     <asp:TextBox ID="TextBox3" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div>                            
                            </div> 
                            <div class="col-sm-3" id="Div4" runat="server">
                                <label for="nueva" class="control-label">No. de Autorización:</label>
                                <div class="controls">
                                     <asp:TextBox ID="TextBox4" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                </div>
                            </div> 
                           
                            </div>
                            <div class="row">
                                
                                 <div class="col-sm-3">  
                                                                                       
                                </div> 
                                <div class="col-sm-3" id="Div5" runat="server">  
                                     <label for="nueva" class="control-label">Fecha:</label>
                                    <div class="controls">
                                         <asp:TextBox ID="TextBox5" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                    </div>                                                      
                                </div> 
                                <div class="col-sm-3" id="Div6" runat="server">    
                                    <label for="nueva" class="control-label">Importe:</label>
                                    <div class="controls">
                                         <asp:TextBox ID="TextBox6" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                    </div>                            
                                </div> 
                                <div class="col-sm-3" id="Div7" runat="server">
                                    <label for="nueva" class="control-label">Importe para crédito Fiscal:</label>
                                    <div class="controls">
                                         <asp:TextBox ID="TextBox7" maxlength="25"  runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
                                    </div>
                                </div> 
                            
                            
                        </div>
                       
                       
                       
                        </fieldset>
                        
                        
                        
                        
                    </div>
                    
                    
                    
                    
                   
                </div>
                <div class="modal-footer">
                    <div class="btn-group btn-group-justified" role="group" aria-label="...">
                        <div class="btn-group" role="group">                            
                            <input id="Button1" type="button" value="Aprobar" runat="server" data-dismiss="modal" class="btn btn-primary btn-md" />
                        </div>
  
                        <div class="btn-group" role="group">                            
                            <input id="Button2" type="button" value="Agregar Línea" runat="server" data-target="#myModal2" class="btn btn-primary btn-md" data-toggle="modal" data-backdrop="static" />
                        </div>

                        <div class="btn-group" role="group">
                            <input id="Button3" type="button" value="Eliminar Comprobante" runat="server" data-dismiss="modal" class="btn btn-default btn-md" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- FIN MODAL LINEAS -->
       
<div class="modal" id="myModal">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title">Modal title</h4>
        </div><div class="container"></div>
        <div class="modal-body">
          Content for the dialog / modal goes here.
          <br>
          <br>
          <br>
          <br>
          <br>
          <a data-toggle="modal" href="#myModal2" class="btn btn-primary">Launch modal</a>
        </div>
        <div class="modal-footer">
          <a href="#" data-dismiss="modal" class="btn">Close</a>
          <a href="#" class="btn btn-primary">Save changes</a>
        </div>
      </div>
    </div>
</div>
<div class="modal" id="myModal2" data-backdrop="static">
	<div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h4 class="modal-title">Second Modal title</h4>
        </div><div class="container"></div>
        <div class="modal-body">
          Content for the dialog / modal goes here.
        </div>
        <div class="modal-footer">
          <a href="#" data-dismiss="modal" class="btn">Close</a>
          <a href="#" class="btn btn-primary">Save changes</a>
        </div>
      </div>
    </div>
</div>

        <!------------------FIN MODALS--------------------------------------->

    </form>
   

    <script type="text/javascript">
        function pageLoad(sender, args) {
               
            $(".mySelect").select2();


            $('input[name="txtFecha"]').daterangepicker(
              {
                  locale: {
                      format: 'DD-MM-YYYY'
                  },
                  showDropdowns: true,
                  singleDatePicker: true
             }
            );


            $(document).ready(function () {
                $('#dtgComprobante').dataTable({

                    "lengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
                    "responsive": true,
                    "stateSave": true,
                    "paging": true,
                    "ordering": true,
                    "info": true,
                    "searching": true,
                    "language": {
                        "emptyTable": "Sin información disponible",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                        "infoEmpty": "Mostrando 0 to 0 de 0 registros",
                        "infoFiltered": "(filtered from _MAX_ total entries)",
                        "lengthMenu": "Mostrar _MENU_ registros",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "No se encontraron registros",
                        "paginate": {
                            "first": "Primera",
                            "last": "Última",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        },
                    }
                });

                llenarComboARendir();
            }          

            );

            /////////////////////////////////////////////////////////////////////
            //Funciones para llenar el combo box de rendiciones**********************

            $('#cmbRendicion').on('change', function () {
                
                mostrarCodigoRendicion($(this).val());
               
                //alert($('#cmbRendicion option:selected').text());
            });
            //funcion para llenar el combo box de rendiciones
            function llenarComboARendir() {
                var id = document.getElementById('<%= lblId.ClientID %>').innerHTML;
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/llenarComboARendir",
                    data: "{id:'" + id + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var count = 0;
                        $.each(response.d, function () {
                            if (count == 0) {
                                $('#cmbRendicion').append($("<option selected></option>").val(this['Value']).html(this['Text']));
                            } else {
                                $('#cmbRendicion').append($("<option></option>").val(this['Value']).html(this['Text']));
                            }
                            count++;
                        });
                        mostrarCodigoRendicion($('#cmbRendicion').val());
                        
                    }
                });
            }


            function mostrarCodigoRendicion(id) {
                
                $.ajax({
                    
                    type: "POST",
                    url: "NuevaRendicion.aspx/obtenerCodigoRendicion",
                    data: '{id: "' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var texto = response.d;
                        var codigo = "";
                        var referencia = "";
                        var porRendir = "**";
                        console.log(porRendir);
                        codigo = texto.substring(0, texto.indexOf('***'));
                        referencia = texto.substring(texto.indexOf('***')+3,texto.length);
                        porRendir = $('#cmbRendicion option:selected').text();

                        if (codigo == 'N/E') {
                            document.getElementById('<%= lblCodigoRendS.ClientID %>').className = "label label-danger";
                        }
                        else {
                            document.getElementById('<%= lblCodigoRendS.ClientID %>').className = "label label-default";
                        }
                       
                        document.getElementById('<%= lblCodigoRend.ClientID %>').innerHTML = codigo;
                        document.getElementById('<%= lblSubtitulo.ClientID %>').innerHTML = referencia;
                        document.getElementById('<%= lblAsignado.ClientID %>').innerHTML = porRendir.substring(0, porRendir.indexOf(' Bs.'));

                        mostrarRendido(id);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }

            function mostrarRendido(id) {
                
                $.ajax({
                    
                    type: "POST",
                    url: "NuevaRendicion.aspx/obtenerRendido",
                    data: '{id: "' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var asignado = parseFloat(document.getElementById('<%= lblAsignado.ClientID %>').innerHTML);
                        var rendido = parseFloat(response.d);
                        var porRendir = 0;

                        porRendir = asignado - rendido;

                        if (rendido == 0) {
                            document.getElementById('<%= lblRendidoS.ClientID %>').className = "label label-warning";
                        }
                        else {
                            document.getElementById('<%= lblRendidoS.ClientID %>').className = "label label-info";
                        }

                        if (porRendir < 0) {
                            document.getElementById('<%= lblPorRendirS.ClientID %>').className = "label label-danger";
                        }
                        else {
                            document.getElementById('<%= lblPorRendirS.ClientID %>').className = "label label-success";
                        }
                                                
                        document.getElementById('<%= lblPorRendir.ClientID %>').innerHTML = porRendir;
                        document.getElementById('<%= lblRendido.ClientID %>').innerHTML = rendido;
                       
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }

    
            /////////////////////////////////////////////////////////////////////////////////////
            //*****************FUNCIONES PARA VALIDAR EL CAMBIO EN TXTNIT************************
            //DISPARA LA FUNCION "MOSTRARRAZONSOCIAL MEDIANTE EL EVENTO KEYUP"
            $("#txtNit").on('change keyup paste', function () {
                MostrarRazonSocial($(this).val());
            });

            //FUNCIÓN PARA MOSTRAR EL NIT A PARTIR DE UN EVENTO EN EL CUADRO DE TEXTO DE NIT
            function MostrarRazonSocial(nit) {
               
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/obtenerRazonSocial",
                    data: '{nit: "' + nit + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: escribirRazonSocial,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }

           //FUNCION QUE ESCRIBE LA RAZON SOCIAL EN BASE A LA RESPUESTA OBTENIDA DE LA BASE DE DATOS. cAMBIA LOS FORMATOS DE LOS BOTONES
             function escribirRazonSocial(response) {
                var razonSocial = response.d;
               
                 if (razonSocial != "NULO") {
                    document.getElementById("btnNitS").style = "display: none;";
                    document.getElementById("lblRazonSocialS").style = "";
                    document.getElementById("lblRazonSocialS").className = "alert alert-success";
                    document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = razonSocial;
           
                    document.getElementById("fsImporte").disabled = false;
                    if (razonSocial== "NO DEFINIDO") {
                        document.getElementById("txtNitAdicionalS").style = "";
                        document.getElementById("txtImporteCredFiscS").style = "display:none;";
                        document.getElementById('<%= lblFac.ClientID %>').innerHTML = "Número de Recibo";
                        $('#<%= txtFactura.ClientID %>').val("0");
                        $('#<%= txtNitAdicional.ClientID %>').val("");
                        $('#<%= txtCodControl.ClientID %>').val("-");
                        $('#<%= txtAutoriza.ClientID %>').val("-");
                        document.getElementById("txtCodControlS").style = "display:none;";
                        document.getElementById("txtAutorizaS").style = "display:none;";
                    }
                    else {
                         if (razonSocial != "N/E") {
                             document.getElementById('<%= lblFac.ClientID %>').innerHTML = "Número de Factura";    
                             document.getElementById("txtCodControlS").style = "";
                             document.getElementById("txtAutorizaS").style = "";
                             document.getElementById("txtNitAdicionalS").style = "display:none;";
                             $('#<%= txtNitAdicional.ClientID %>').val(razonSocial);
                            document.getElementById("txtImporteCredFiscS").style = "";
                            if (document.getElementById('txtAutoriza').value == "-") {
                                document.getElementById('txtCodControl').value = "";
                                document.getElementById('txtAutoriza').value = "";
                            }
                         } else {
                        // si no ha encontrado ninguna coincidencia, esconde la
                        // fila de la tabla
                        //tableReg.rows[i].style.display = 'none';
                         document.getElementById("lblRazonSocialS").style = "";
                         document.getElementById("lblRazonSocialS").className = "alert alert-warning";
                        document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = "El NIT no existe.¿Desea agregarlo?";
                             document.getElementById("txtNitAdicionalS").style = "display:none;";
                             $('#<%= txtNitAdicional.ClientID %>').val(razonSocial);
                        document.getElementById("btnNitS").style = "";
                       
                        document.getElementById("fsImporte").disabled=true;
                        }
                        
                    }


                 } else {
                    
                     document.getElementById("lblRazonSocialS").style = "";
                     document.getElementById("lblRazonSocialS").className = "alert alert-danger";
                        document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = "Ingrese un NIT. De no conocerlo escriba 'ND'";
                
                        document.getElementById("btnNitS").style = "display:none;";
                       
                        document.getElementById("fsImporte").disabled=true;

                    
                 }
             }
          
            ///////////////////////////////////////////////////////////////////////////
            //*****************FUNCIONES PARA VALIDAR EL GUARDADO DE NIT**************
            //FUNCION PARA VALIDAR QUE ESTEN EXCRITOS TODOS LOS CAMPOS PARA INGRESAR UN NUEVO NIT

            $('#btnNitAceptar').on('click', function () {
                insertarNit();
            });
            $('#btnNitNo').on('click', function () {
                document.getElementById("lblRazonSocialS").className = "alert alert-danger";
                document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = "Debe ingresar un NIT para continuar.¿Desea Ingresarlo? ";
                
             });

            //FUNCION PARA GUARDAR UN NUEVO NIT
             function insertarNit() {
                 var razonSocial = $("#txtRazonSocial2").val();
                 var alias = $("#txtAlias2").val();
                 var nit = $("#txtNit").val();
                 if (razonSocial == "" || alias == "") {

                     alertify.error("No deje ningún espacio en blanco para guardar el NIT");
                 } else {
                     $("#modalNuevoNit").modal('hide');
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/insertarNuevoNit",
                    data: '{nit: "' + nit + '", razonSocial: "' + razonSocial + '", aliasNit: "' + alias + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: escribirRazonSocial,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                $('#<%= txtRazonSocial2.ClientID %>').val("");
                $('#<%= txtAlias2.ClientID %>').val("");
                alertify.success("Nit guardado exitosamente");
                
                }
             }
            ///////////////////////////////////////////////////////////////////////////
            //*****************FUNCIONES PARA VALIDAR EL GUARDADO DE UN COMPROBANTE (FACTURA)**************
            //FUNCION PARA VALIDAR QUE ESTEN EXCRITOS CORRECTAMENTE TODOS LOS CAMPOS PARA INGRESAR UN NUEVO COMPROBANTE

          
          
            $('#btnAceptarComp').on('click', function () {
                validarComprobantes();
            });

            $("#txtImporte").on('change keyup paste keydown', function () {
                copiarImporte($(this).val());              
            });
            $("#txtImporte").numeric('.'); // números con separador decimal
            $("#txtImporteCredFisc").numeric('.'); // números con separador decimal
            //FUNCION PARA GUARDAR UN NUEVO COMPROBANTE
                       
            
            function validarComprobantes() {
                var t = $('#dtgComprobante').DataTable();
                
                var nit = $("#txtNit").val();
                var razonSocial = $("#txtNitAdicional").val();
                 var factura = $("#txtFactura").val();
                 var codControl = $("#txtCodControl").val();
                 var nroAutoriza = $("#txtAutoriza").val();
                 var fecha = $("#txtFecha").val();
                 var importe = $("#txtImporte").val();
                 var importeCredFisc = $("#txtImporteCredFisc").val();
                
                 if (nit == "" || factura == "" || codControl == "" || nroAutoriza == "" || fecha == "" || importe == "" || importeCredFisc == "") {
                     console.log(nit);
                     console.log(factura);
                     console.log(codControl);
                     console.log(nroAutoriza);
                     console.log(fecha);
                     console.log(importe);
                     console.log(importeCredFisc);

                     alertify.error("No se guardó el COMPROBANTE. No deje ningún espacio en blanco e intente nuevamente.");
                     
                 } else {
                     
                     $('.modal.in').modal('hide');
                     $('.modal-backdrop').remove();
                     t.row.add([
                     nit,
                    razonSocial,
                     factura,
                     codControl,
                    nroAutoriza,
                     fecha,
                      importe,
                     importeCredFisc
            
                     ]).draw(false);
                     $("#txtNit").val("");
                     document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = "";
                     $("#txtFactura").val("");
                     $("#txtCodControl").val("");
                     $("#txtAutoriza").val("");
                   
                     $("#txtImporte").val("");
                     $("#txtImporteCredFisc").val("");
                     alertify.success("COMPROBANTE guardado exitosamente.");
                 }
                
            }

             function mascara(d)
                {
                    val = d.val

                    cuenta = 0;
                    posicion = val.indexOf(".");
                    while (posicion != -1) {
                        cuenta++;
                        posicion = val.indexOf(".", posicion + 1);
                    }

                    if (cuenta > 1) {
                        d.value = d.value.substring(0, d.value.length - cuenta+1);                       
                    }                
      
                }

            function copiarImporte(importe) {
                
                $("#txtImporteCredFisc").val(importe);
            }

           
        }



    </script>

    <script src="Scripts/jquery-migrate-1.2.1.min.js"></script>   
    
</body>
</html>
