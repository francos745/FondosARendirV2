<%@ Page Language="VB" AutoEventWireup="false" CodeFile="imprimirRendicion.aspx.vb" Inherits="imprimirRendicion" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <title>Imprimir Rendición</title>
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

                                <li class="active"><a href="imprimirRendicion.aspx"><i class="fa fa-print">
                                    <div class="icon-bg bg-pink"></div>
                                </i><span class="menu-title">Reimprimir Rendición</span></a>
                       
                                </li>
                                <li><a href="cambiarPass.aspx"><i class="fa fa-key">
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
                                    Imprimir Rendición</div>
                            </div>
                            <ol class="breadcrumb page-breadcrumb pull-right">
                                <li><i class="fa fa-home"></i>&nbsp;<a href="dashboard.html">Inicio</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                                <li class="hidden"><a href="#">Imprimir Rendición</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                                <li class="active">Imprimir Rendición</li>
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
                                                
                                                <div class="alert alert-info" style="display:none;"><asp:Label ID="lblId" runat="server" Text=""></asp:Label><asp:Label ID="lblIdComp" runat="server" Text=""></asp:Label></div>
                                                <div class="alert alert-info" style="display:none;"><asp:Label ID="lblIdLinea" runat="server" Text=""></asp:Label><asp:Label ID="Label2" runat="server" Text=""></asp:Label></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-8" >
                                        <fieldset class="row" id="contTextos" runat="server"  >
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
                                                        <input id="btnGenerar" type="button" value="Generar" data-target="#modalConfirmarGuardar" class="btn btn-primary btn-md" data-toggle="modal" data-backdrop="static" />
                                                    </div>                        
                                                    <div class="btn-group" role="group">
                                                        <input id="btnDescartar" type="button" value="Descartar" data-target="#modalConfirmarDescartar" class="btn btn-default btn-md" runat="server" data-toggle="modal" data-backdrop="static" />
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
                                                        <input id="btnAgregar" type="button" value="Agregar Comprobante (+)" runat="server" data-target="#modalComprobante" class="btn btn-info btn-md" data-toggle="modal" data-backdrop="static" />
                                                       
                                                    </div>                        
                                                   
                                                </div>
                                    </div>

                                    <div class="col-sm-8" >
                                        
                                    </div>
                                </div>
                                <div class="row" id="pdf">
                                     <div class="table-responsive" >
                                        <div class="control-group" id="dtgFacturaS" runat="server">
                                            <table id="dtgComprobante" class="testgrid2" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>NIT</th>
                                                        <th>NOMBRE PROVEEDOR</th>
                                                        <th>NRO. COMPROBANTE</th>
                                                        <th>NRO. AUTORIZACIÓN</th>
                                                        <th>CÓDIGO DE CONTROL</th>
                                                        <th>FECHA</th>
                                                        <th>IMPORTE</th>
                                                        <th>EXCENTO</th>
                                                        <th>SUMA LINEAS</th>
                                                        <th>ACCIONES</th>
                                                    </tr>
                                                </thead>
                                                
                                               
                                            </table>
                                         </div>
                                         <div style="display:none">
                                             <table id="dtgReporte" style="display:none" >
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>FECHA</th>
                                                        <th>COMPROBANTE</th>
                                                        <th>NÚMERO DE AUTORIZACIÓN</th>
                                                        <th>CÓDIGO DE CONTROL</th>
                                                        <th>PROVEEDOR</th>
                                                        <th>DETALLE</th>
                                                        <th>IMPORTE</th>
                                                        
                                                    </tr>
                                                </thead>
                                                
                                               
                                            </table>
                                        </div> 
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
        

    <div class="modal fade bs-example-modal-lg" tabindex="-1"  id="modalComprobante" aria-labelledby="myLargeModalLabel" data-backdrop="static" data-keyboard=”false”>
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
                                     <asp:TextBox ID="txtCodControl" maxlength="25" runat="server" class="form-control input-sm" placeholder=""></asp:TextBox>                                    
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
                     <br/>
                     <div class="row">
                         <div class="col-sm-8" >
                        </div>
                        <div class="col-sm-4" >
                             <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                <div class="btn-group" role="group">    
                                                    
                                    <input id="btnAceptarComp" type="button" value="Aceptar" runat="server" dismiss="modal" class="btn btn-primary btn-md" />
                                </div>
  
 

                                <div class="btn-group" role="group">
                                    <input id="btnVolverComp" type="button" value="Cancelar" runat="server" data-dismiss="modal" class="btn btn-default btn-md" />
                                </div>
                            </div>
                        </div>
                    </div>
                    
                   
                </div>
                <div class="modal-footer">
                    <div class="row">
                        <div class="col-sm-4" >
                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                <div class="btn-group" role="group">                            
                                    <input id="btnAgregarLineaComp" type="button" value="Agregar Línea (+)" runat="server" data-target="#modalLineas" class="btn btn-info btn-md" data-toggle="modal" data-backdrop="static" />
                                </div>                        
                            </div>
                        </div>
                        <div class="col-sm-8" >
                        </div>
                    </div>
                   <div class="row">
                                    
                                     <div class="table-responsive" >
                                        <div class="control-group" id="Div8" runat="server">
                                            <table id="dtgLineas" class="testgrid2" cellspacing="0" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>CONCEPTO</th>
                                                        <th>PROYECTO</th>
                                                        <th>FASE</th>
                                                        <th>IMPORTE</th>
                                                        <th>TIPO COMPRA</th>
                                                        <th>DETALLE</th>
                                                        <th>CONC</th>
                                                        <th>FASE</th>
                                                        <th>TC</th>
                                                        <th>ACCIONES</th>
                                                       
                                                    </tr>
                                                </thead>
                                                
                                               
                                            </table>
                                        </div> 

                                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ProviderName="System.Data.SqlClient" >
                                             <SelectParameters>
                                                <asp:ControlParameter ControlID="lblFac" DefaultValue="ninguno" Name="DETALLE_FACTURA" PropertyName="text" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
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
   
   
<div class="modal" id="modalLineas" data-backdrop="static">
	<div class="modal-dialog">
      <div class="modal-content">
           <div class="modal-header text-center">
                      <h4 class="modal-title">Detalles Línea de Comprobante</h4>
            </div>
        <div class="container"></div>
        <div class="modal-body form-horizontal">
                    
                        <div class="form-group">
                            <label for="nueva" class="col-lg-4 control-label"> Concepto: </label>
                                <div class="col-lg-8" style="text-align:left;">                                    
                                    <asp:DropDownList ID="cmbConcepto" runat="server" class="mySelect" Width="100%"></asp:DropDownList>
                                </div>
                        </div>

                        <fieldset id="cmbFaseS" runat="server">
                            <div class="form-group">
                                <label for="nueva" class="col-lg-4 control-label"> Fase: </label>
                                    <div class="col-lg-8">
                                        <asp:DropDownList ID="cmbFase" runat="server" class="mySelect" Width="100%"></asp:DropDownList>
                                    </div>
                            </div>
                        </fieldset>

                        <fieldset id="cmbTipoCompraS" runat="server">
                            <div class="form-group">
                                <label for="nueva" class="col-lg-4 control-label">Tipo Compra: </label>
                                    <div class="col-lg-8" style="text-align:left;">                                        
                                        <asp:DropDownList ID="cmbTipoCompra" runat="server" class="mySelect" Width="50%"></asp:DropDownList>
                                    </div>
                            </div>
                        </fieldset>
                        
                        <fieldset id="txtDetalleS" runat="server">
                            <div class="form-group">
                                <label for="nueva" class="col-lg-4 control-label">Detalle: </label>
                                <div class="col-lg-8">
                                    <asp:TextBox ID="txtDetalle" runat="server" class="form-control input-sm " maxlength="200" placeholder="Detalle del gasto" TextMode="MultiLine" ></asp:TextBox>
                                </div>
                            </div>
                        </fieldset>

                        <fieldset id="txtSubImporteS" runat="server">
                            <div class="form-group">
                                <label for="nueva" class="col-lg-4 control-label">Importe Parcial: </label>
                                <div class="col-lg-4">
                                    <asp:TextBox ID="txtSubImporte" runat="server" class="form-control input-sm " placeholder="Importe Parcial" ></asp:TextBox>
                                </div>
                            </div>
                        </fieldset>
                    
                    
                    
                    
                   
                </div>
        <div class="modal-footer">
         <div class="row">
                         <div class="col-sm-8" >
                        </div>
                        <div class="col-sm-4" >
                             <div class="btn-group btn-group-justified" role="group" aria-label="...">
                                <div class="btn-group" role="group">    
                                                    
                                    <input id="btnAceptarLinea" type="button" value="Aceptar" runat="server" dismiss="modal" class="btn btn-primary btn-md" />
                                </div>
  
 

                                <div class="btn-group" role="group">
                                    <input id="Button2" type="button" value="Cancelar" runat="server" data-dismiss="modal" class="btn btn-default btn-md" />
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
      </div>
    </div>
</div>

    <!-- FIN MODAL LINEAS -->
        <!------------------FIN MODALS--------------------------------------->

    </form>
   

    <script type="text/javascript">
        function pageLoad(sender, args) {
            //declaramos una variable global que hace referencia a la tabla
            var currentTr = null;
            var currentTr1 = null;
            var validator = true;
            $(".mySelect").select2();
            //$('#modalComprobante').modal({ backdrop: 'static', keyboard: false, show: false });
            $('#dtgComprobante').css('cursor', 'pointer');

            $('input[name="txtFecha"]').daterangepicker(
              {
                  locale: {
                      format: 'DD-MM-YYYY'
                  },
                  showDropdowns: true,
                  singleDatePicker: true
             }
            );

            var table;
            var table1;
             ///////////////////////////////////////////////////////////////////////////
            //*****************FUNCIONES PARA VALIDAR LA GENERACIÓN DE LA RENDICION**************
            //ACCIONES DEL BOTON GENERAR

            $('#btnGenerar').on('click', function () {
                if (validator == true) {
                    generarReporte();
                } else {
                    alertify.error("Uno o mas comprobantes requieren ser revisados");
                }

            });
           
            $(document).ready(function () {
                var tRep = $('#dtgReporte').DataTable({ "lengthMenu": [[-1], ["Todos"]] });

               table=$('#dtgComprobante').DataTable({

                    "lengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
                    "responsive": true,
                    //"stateSave": true,
                    "paging": true,
                    "ordering": true,
                    "info": true,
                    "searching": true,
                    "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                            if (aData[9] != aData[7]) {
                            $('td', nRow).css('background-color', '#d9534f');
                            $('td', nRow).css('color', '#fff');
                            $('td', nRow).css('font-weight', 'bold');
                            validator *= false;
                        }

                      },

                    "columnDefs": [
                         {
                            "visible": false,
                             "targets": [0]
                         }, {
                             "className": 'text-left',
                             "visible": true,
                             "targets": [1]
                         }, {
                             "className": 'text-left',
                             "visible": true,
                             "targets": [2]
                         }, {
                             "className": 'text-left',
                             "visible": true,
                             "targets": [3]
                         }, {
                             "className": 'text-left',
                             "visible": true,
                             "targets": [4]
                         }, {
                             "className": 'text-right',
                             "visible": true,
                             "targets": [5]
                         }, {
                             "className": 'text-right',
                             "visible": true,
                             "targets": [6]
                         }, {
                             "className": 'text-right',
                             "visible": true,
                             "targets": [7]
                         }, {
                             "className": 'text-right',
                             "visible": true,
                             "targets": [8]
                         }, {
                             "className": 'text-right',
                             "visible": true,
                             "targets": [9]
                         }, {
                             "targets": -1,
                             "data": null,
                             "defaultContent": "<span class='btn-xs btn btn-primary edit'  data-toggle='modal'><i class='fa fa-edit'></i></span>&nbsp;<span class='btn-xs btn btn-danger delete'><i class='fa fa-times'></i></span>"
                         }
                    ],
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

               




               table1 = $('#dtgLineas').DataTable({

                   "lengthMenu": [[10, 15, 20, -1], [10, 15, 20, "Todos"]],
                   "responsive": true,
                   //"stateSave": true,
                   "paging": true,
                   "ordering": true,
                   "info": true,
                   "searching": true,
                   "columnDefs": [
                        {
                            "visible": false,
                            "targets": [0]
                        }, {
                            "className": 'text-left',
                            "visible": true,
                            "targets": [1]
                        }, {
                            "className": 'text-left',
                            "visible": true,
                            "targets": [2]
                        }, {
                            "className": 'text-left',
                            "visible": true,
                            "targets": [3]
                        }, {
                            "className": 'text-right',
                            "visible": true,
                            "targets": [4]
                        }, {
                            "className": 'text-left',
                            "visible": true,
                            "targets": [5]
                        }, {
                            "className": 'text-left',
                            "visible": true,
                            "targets": [6]
                        }, {
                            "className": 'text-left',
                            "visible": false,
                            "targets": [7]
                        }, {
                            "className": 'text-left',
                            "visible": false,
                            "targets": [8]
                        }, {
                            "className": 'text-left',
                            "visible": false,
                            "targets": [9]
                        }, {
                            "targets": -1,
                            "data": null,
                            "defaultContent": "<span class='btn-xs btn btn-primary edit'  data-toggle='modal'><i class='fa fa-edit'></i></span>&nbsp;<span class='btn-xs btn btn-danger delete'><i class='fa fa-times'></i></span>"
                        }
                   ],
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
               llenarComboConcepto();
               llenarComboTipoCompra();

            }          

            );

            //función para el botón de edición de comprobante
            $('#dtgComprobante tbody').on('click', 'span.edit', function () {
                currentTr = this;
                var data = table.row($(this).parents('tr')).data();
                
                $('#<%= lblIdComp.ClientID %>').val(data[0]);
               
                var importe = 0;
                var excento = 0;
                importe = data[7];
                excento = data[8];
                MostrarRazonSocial(data[1], data[2]);
                $('#<%= txtNit.ClientID %>').val(data[1]);
                $('#<%= txtNitAdicional.ClientID %>').val(data[2]);
                $('#<%= txtFactura.ClientID %>').val(data[3]);
                $('#<%= txtAutoriza.ClientID %>').val(data[4]);
                $('#<%= txtCodControl.ClientID %>').val(data[5]);
                $('#<%= txtFecha.ClientID %>').val(data[6]);
                $('#<%= txtImporte.ClientID %>').val(importe);
                $('#<%= txtImporteCredFisc.ClientID %>').val(importe-excento);

               
                $("#modalComprobante").modal('show');
                $('#<%= btnAgregarLineaComp.ClientID %>').prop('disabled', false);
                var nit = $('#txtNit').val();
                if (nit == 'nd' || nit=="ND") {
                    document.getElementById("cmbTipoCompraS").style = "";
                   
                } else {
                    document.getElementById("cmbTipoCompraS").style = "display:none;";
                    
                }

                llenarTablaLineas();
            });

             //función para el botón de borrado de comprobante
            $('#dtgComprobante tbody').on('click', 'span.delete', function () {
                currentTr = this;
                var data = table.row($(this).parents('tr')).data();
               
                var id=data[0];
               
               
                alertify.set({ labels: { ok: "Si", cancel: "No" } });
                alertify.set({ buttonReverse: true });
               
                alertify.confirm("¿Seguro que desea borrar el comprobante? Se borrarán las líneas asociadas al mismo", function (e) {
                    if (e) {
                       
                        $.ajax({
                            type: "POST",
                            url: "NuevaRendicion.aspx/borrarComprobante",
                            data: '{id: "' + id + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: quitarRegistro,
                            failure: function (response) {
                                
                            }
                        });
                    } else {
                        alertify.error("Operación cancelada");
                    }
                });
               
                
            });


            //funcion para quitar un registro de la tabla de comprobantes
             function quitarRegistro(response) {
                
                if (currentTr != null) {
                    
                    $(currentTr).closest('tr').empty();
                    alertify.success("Comprobante eliminado exitosamente");
                }
                else {
                    alertify.success("Sucedió un problema al eliminar el registro.");
                }
                mostrarRendido($('#cmbRendicion').val());
                    
                }
            

            /////////////////////////////////////////////////////////////////////
            //Funciones para llenar el combo box de rendiciones**********************

            $('#cmbRendicion').on('change', function () {
                
                mostrarCodigoRendicion($(this).val());
                validator = true;
               
                //alert($('#cmbRendicion option:selected').text());
            });
            
            //funcion para llenar el combo box de rendiciones
            function llenarComboARendir() {
                var id = document.getElementById('<%= lblId.ClientID %>').innerHTML;
                $.ajax({
                    type: "POST",
                    url: "imprimirRendicion.aspx/llenarComboARendir",
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

            //FUNCION QUE MUESTRA EL CODIGO DE RENDICION, Y CARGA LAS DEMÁS TAREAS ASOCIADAS AL COMBO BOX DE RENDICION
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
                        llenarTablaComprobantes();
                        llenarTablaReportes();
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            //MUESTRA LA CANTIDAD RENDIDA
            function mostrarRendido(id) {
                console.log("id> " + id);
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
                        console.log("__________________________________");
                        console.log("asignado> " + asignado);
                        console.log("rendido> " + rendido);
                        console.log("porRendir> " + porRendir);
                        console.log("__________________________________");
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

             //LLENAR TABLA DE COMPROBANTES

             function llenarTablaComprobantes() {
                 var codRend = document.getElementById('<%= lblCodigoRend.ClientID %>').innerHTML;
                 var t = $('#dtgComprobante').DataTable();
                 t.clear().draw();
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/obtenerTablaComprobantes",
                    data: "{codRend:'" + codRend + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                       
                        $.each(response.d, function () {

                            
                            t.row.add([
                            this['id'],
                            this['nit'],
                            this['razonSocial'],
                            this['factura'],                            
                            this['nroAutoriza'],
                            this['codControl'],
                            this['fecha'],
                            this['importe'],
                            this['importeCredFisc'],
                            this['sumaLineas'],
                            ""
                            
                            ]).draw(false);
                           
                           
                           
                           
                        });
                        
                        
                    }
                });
                validator = true;
             }
           

            //LLENAR TABLA DE REPORTES

             function llenarTablaReportes() {
                 var codRend = document.getElementById('<%= lblCodigoRend.ClientID %>').innerHTML;
                 var t = $('#dtgReporte').DataTable();
                 t.clear().draw();
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/obtenerTablaReporte",
                    data: "{codRend:'" + codRend + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                       
                        $.each(response.d, function () {

                            
                            t.row.add([
                            this['id'],
                            this['fecha'],
                            this['factura'],
                            this['nroAutoriza'],
                            this['codControl'],
                            this['razonSocial'],
                            this['nit'],
                            this['importe'],
                            
                            ]).draw(false);
                           
                           
                           
                           
                        });
                        
                        
                    }
                });
             }

    
            /////////////////////////////////////////////////////////////////////////////////////
            //*****************FUNCIONES PARA VALIDAR EL CAMBIO EN TXTNIT************************
            //DISPARA LA FUNCION "MOSTRARRAZONSOCIAL MEDIANTE EL EVENTO KEYUP"
            $("#txtNit").on('change keyup paste', function () {
                MostrarRazonSocial($(this).val(),"");
            });
            var rSoc="";
            //FUNCIÓN PARA MOSTRAR EL NIT A PARTIR DE UN EVENTO EN EL CUADRO DE TEXTO DE NIT *** rS = Razon Social= parametro para no dejar en blanco el campo de nit adicional
            function MostrarRazonSocial(nit,rS) {
                rSoc = rS;
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
                    if (razonSocial == "NO DEFINIDO") {
                        
                        document.getElementById("txtNitAdicionalS").style = "";
                        document.getElementById("txtImporteCredFiscS").style = "display:none;";
                        document.getElementById('<%= lblFac.ClientID %>').innerHTML = "Número de Recibo";
                        $('#<%= txtFactura.ClientID %>').val("0");
                        $('#<%= txtNitAdicional.ClientID %>').val(rSoc);
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

            $('#btnAgregar').on('click', function () {
                $('#<%= lblIdComp.ClientID %>').val("");
                $('#<%= btnAgregarLineaComp.ClientID %>').prop('disabled', true);
                llenarTablaLineas();
            });
          
            $('#btnAceptarComp').on('click', function () {
                
                validarComprobantes();
               
            });

            $('#btnVolverComp').on('click', function () {
                llenarTablaComprobantes();
                llenarTablaReportes();
                console.log("btnVolver");
                $("#txtNit").val("");
                document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = "";
                $("#txtFactura").val("");
                $("#txtCodControl").val("");
                $("#txtAutoriza").val("");
                   
                $("#txtImporte").val("");
                $("#txtImporteCredFisc").val("");

                
                $('.modal.in').modal('hide');
                $('.modal-backdrop').remove();
            });

            $("#txtCodControl").on('keyup', function () {
                mascaraCodControl(this);
            });

            $("#txtImporte").on('change keyup paste keydown', function () {
                copiarImporte($(this).val());              
            });

            $("#txtImporte").numeric('.'); // números con separador decimal
            $("#txtImporteCredFisc").numeric('.'); // números con separador decimal
            $("#txtSubImporte").numeric('.'); // números con separador decimal
            
            //FUNCION PARA GUARDAR UN NUEVO COMPROBANTE
                       
            
            function validarComprobantes() {
                
                
                var nit = $("#txtNit").val();
                var razonSocial = $("#txtNitAdicional").val();
                 var factura = $("#txtFactura").val();
                 var codControl = $("#txtCodControl").val();
                 var nroAutoriza = $("#txtAutoriza").val();
                 var fecha = $("#txtFecha").val();
                 var importe = 0;
                 importe = parseFloat($("#txtImporte").val());
                 var importeCredFisc = 0;
                 importeCredFisc=parseFloat($("#txtImporteCredFisc").val());
                
                 if (nit == "" || factura == "" || codControl == "" || nroAutoriza == "" || fecha == "" || importe == "" || importeCredFisc == "") {
                    
                     alertify.error("No se guardó el COMPROBANTE. No deje ningún espacio en blanco e intente nuevamente.");
                     
                 } else {
                     
                     if (importe < importeCredFisc) {                    

                        alertify.error("No se guardó el COMPROBANTE. El monto del importe no puede ser menor al monto del importe para crédito fiscal.");
                     
                    } else {
                         
                         agregarComprobante(nit, razonSocial, factura, codControl, nroAutoriza, fecha, importe, importeCredFisc);
                         $('.modal.in').modal('hide');
                         $('.modal-backdrop').remove();
                         mostrarCodigoRendicion($('#cmbRendicion').val());
                     }
                 }
                
            }

            function agregarComprobante(nit,razonSocial,factura, codControl, nroAutoriza, fecha, importe, importeCredFisc) {
                var t = $('#dtgComprobante').DataTable();
                var codRend = document.getElementById('<%= lblCodigoRend.ClientID %>').innerHTML;
                var id = $('#cmbRendicion').val();
                var idComp = $('#<%= lblIdComp.ClientID %>').val();
                
                if (idComp == "") {
                     $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/agregarComprobante",
                    data: '{nit: "' + nit + '", razonSocial: "' + razonSocial + '", factura: "' + factura + '", codControl: "' + codControl + '", nroAutoriza: "' + nroAutoriza + '", fecha: "' + fecha + '", importe: "' + importe + '", importeCredFisc: "' + importeCredFisc + '", codRend: "' + codRend + '", idARendir: "' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var idComp = response.d;
                        
                        if (response.d != "error") {
                            
                         //   t.row.add([
                         //   idComp,
                         //   nit,
                         //   razonSocial,
                         //   factura,
                         //   codControl,
                         //   nroAutoriza,
                         //   fecha,
                         //   importe,
                         //   importe-importeCredFisc
            
                            //]).draw(false);
                            llenarTablaComprobante();
                         $("#txtNit").val("");
                         document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = "";
                         $("#txtFactura").val("");
                         $("#txtCodControl").val("");
                         $("#txtAutoriza").val("");
                   
                         $("#txtImporte").val("");
                         $("#txtImporteCredFisc").val("");
                         alertify.success("COMPROBANTE guardado exitosamente.");
                        }
                        else {
                            
                            alertify.error("Error. Hubo un problema con el acceso a la base de datos.");
                        }
                        
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                }
                else {
                    
                     $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/actualizarComprobante",
                    data: '{idComp:"' + idComp + '", nit: "' + nit + '", razonSocial: "' + razonSocial + '", factura: "' + factura + '", codControl: "' + codControl + '", nroAutoriza: "' + nroAutoriza + '", fecha: "' + fecha + '", importe: "' + importe + '", importeCredFisc: "' + importeCredFisc + '", codRend: "' + codRend + '", idARendir: "' + id + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                       
                       
                        if (response.d != "error") {
                            
                            if (currentTr != null) {
                                $(currentTr).find('td').eq(1).html(nit);
                               
                                $(currentTr).find('td').eq(2).html(razonSocial);
                                $(currentTr).find('td').eq(3).html(factura);
                                $(currentTr).find('td').eq(4).html(nroAutoriza);
                                $(currentTr).find('td').eq(5).html(codControl);
                                $(currentTr).find('td').eq(6).html(fecha);
                                $(currentTr).find('td').eq(7).html(importe);
                                $(currentTr).find('td').eq(8).html(parseFloat(importe-importeCredFisc));
                               
                                
                            }
                         $("#txtNit").val("");
                         document.getElementById('<%= lblRazonSocial.ClientID %>').innerHTML = "";
                         $("#txtFactura").val("");
                         $("#txtCodControl").val("");
                         $("#txtAutoriza").val("");
                   
                         $("#txtImporte").val("");
                         $("#txtImporteCredFisc").val("");
                         alertify.success("COMPROBANTE actualizado exitosamente.");
                         $('.modal.in').modal('hide');
                         $('.modal-backdrop').remove();
                        }
                        else {
                           
                            alertify.error("Error. Hubo un problema con el acceso a la base de datos.");
                        }
                        
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                }
        
            }


            function mascaraCodControl(d) {
                var patron = new Array(2, 2, 2, 2, 2);
                
                var pat = patron;
                var sep = "-";
                var nums = true;
               
                if (d.valant != d.value) {
                    val = d.value
                    largo = val.length
                    val = val.split(sep)
                    val2 = ''
                    for (r = 0; r < val.length; r++) {
                        val2 += val[r]
                    }
                    if (nums) {
                        for (z = 0; z < val2.length; z++) {
                            if (isNaN(val2.charAt(z)) & val2.charAt(z).toUpperCase() != "A" & val2.charAt(z).toUpperCase() != "B" & val2.charAt(z).toUpperCase() != "C" & val2.charAt(z).toUpperCase() != "D" & val2.charAt(z).toUpperCase() != "E" & val2.charAt(z).toUpperCase() != "F") {
                                letra = new RegExp(val2.charAt(z), "g")
                                val2 = val2.replace(letra, "")
                            }
                        }
                    }
                    val = ''
                    val3 = new Array()
                    for (s = 0; s < pat.length; s++) {
                        val3[s] = val2.substring(0, pat[s])
                        val2 = val2.substr(pat[s])
                    }
                    for (q = 0; q < val3.length; q++) {
                        if (q == 0) {
                            val = val3[q]
                        }
                        else {
                            if (val3[q] != "") {
                                val += sep + val3[q]
                            }
                        }
                    }
                    d.value = val.toUpperCase()
                    d.valant = val.toUpperCase()
                }
            }

            function copiarImporte(importe) {
                
                $("#txtImporteCredFisc").val(importe);
            }
            function validarImporteCredFisc(importe) {

                $("#txtImporteCredFisc").val(importe);
            }
            ///////////////////////////////////////////////////////////////////////////
            //*****************FUNCIONES PARA VALIDAR EL GUARDADO DE UNA LINEA DE COMPROBANTE (DETALLE DE FACTURA)**************
            //FUNCION PARA CARGAR EL COMBO BOX DE CONCEPTOS
            


            $('#cmbConcepto').on('change', function () {
                llenarComboFase($(this).val());               
            });

            $('#btnAceptarLinea').on('click', function () {
                validarLineas();

            });

            $('#btnAgregarLineaComp').on('click', function () {
                $('#<%= lblIdLinea.ClientID %>').val("");
               

            });
            function llenarComboConcepto() {
                var id = document.getElementById('<%= lblId.ClientID %>').innerHTML;
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/llenarComboConcepto",
                    data: "{id:'" + id + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var count = 0;
                        var actual = "";
                        $.each(response.d, function () {
                            if (count == 0) {
                                $('#cmbConcepto').append($("<option selected></option>").val(this['Value']).html(this['Text']));
                                actual = this['Value'];
                            } else {
                                $('#cmbConcepto').append($("<option></option>").val(this['Value']).html(this['Text']));
                            }
                            count++;
                        });
                        llenarComboFase($('#cmbConcepto').val());
                        
                    }
                });
            }

            function llenarComboFase(id) {
                //var id = document.getElementById('<%= lblId.ClientID %>').innerHTML;

                $("#cmbFase").empty().append('');
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/llenarComboFase",
                    data: "{id:'" + id + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var count = 0;
                        $.each(response.d, function () {
                            if (count == 0) {
                                $('#cmbFase').append($("<option selected></option>").val(this['Value']).html(this['Text']));
                            } else {
                                $('#cmbFase').append($("<option></option>").val(this['Value']).html(this['Text']));
                            }
                            count++;
                        });
                        if (count == 0) {
                            document.getElementById("cmbFaseS").style = "display:none;";
                        } else {
                            document.getElementById("cmbFaseS").style = "";
                        }
                        
                        
                    }
                });
            }

            function llenarComboTipoCompra() {
                $('#cmbTipoCompra').append($("<option selected></option>").val('B').html('BIENES'));
                $('#cmbTipoCompra').append($("<option></option>").val('S').html('SERVICIOS'));
                $('#cmbTipoCompra').append($("<option></option>").val('E').html('EXCENTO'));
                $('#cmbTipoCompra').append($("<option></option>").val('A').html('ALQUILERES'));

            }


            function validarLineas() {

                var idComp = $('#<%= lblIdComp.ClientID %>').val();
                var concepto = $('#cmbConcepto').val();
                var fase = $('#cmbFase').val();
                
                var tipoCompra = "";
                var detalle = $("#txtDetalle").val();
              
                var importe = 0;
                var importeComp = 0;
                var importeCompCred = 0;

                importe = parseFloat($("#txtSubImporte").val());
                importeComp = parseFloat($("#txtImporte").val());                
                importeCompCred = parseFloat($("#txtImporteCredFisc").val());

                if (fase == "null") {
                    fase = "";
                }

                var nit = $('#txtNit').val();
                if (nit == 'nd' || nit == "ND") {
                    tipoCompra = $('#cmbTipoCompra').val();
                } else {
                    tipoCompra = "";

                }

                

                if (detalle == "" || importe == "" ) {
                    alertify.error("No se guardó la LÍNEA. No deje ningún espacio en blanco e intente nuevamente.");

                } else {
                    agregarLinea(idComp, concepto, fase, tipoCompra, detalle, importe, importeComp, importeCompCred,'');
                   
                 }
            }


            function agregarLinea(idComp, concepto, fase, tipoCompra, detalle, importe, importeComp, importeCompCred,idLinea) {
                var t = $('#dtgLineas').DataTable();
                var tc = "";
                var idLinea;
                var proyecto;
                var idLinea = $('#<%= lblIdLinea.ClientID %>').val();
                var conceptoDesc = $("#cmbConcepto option:selected").text();
                var faseDesc = $("#cmbFase option:selected").text();
                if (idLinea == "") {

                   
                     $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/agregarLinea",
                    data: '{idComp: "' + idComp + '", concepto: "' + concepto + '", fase: "' + fase + '", tipoCompra: "' + tipoCompra + '", detalle: "' + detalle + '", importe: "' + importe + '", importeComp: "' + importeComp + '", importeCompCred: "' + importeCompCred + '", idLinea: "' + idLinea + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $.each(response.d, function () {
                            idLinea = this['Value'];
                            proyecto = this['Text'];
                                                          
                        });

                        console.log("***"+ proyecto + "***"+ idLinea);
                        
                       
                        if (proyecto != "ERROR") {
                            if (tipoCompra == "") {
                                tipoCompra = 'F'
                                tc = "FACTURA";
                            } else {
                                tc = $("#cmbTipoCompra option:selected").text();
                            }


                          
                            t.row.add([
                            idLinea,
                            conceptoDesc,
                             proyecto,
                            faseDesc,
                            importe,                            
                            tc,
                            detalle,
                            concepto,
                            fase,
                            tipoCompra

                         ]).draw(false);
                        
                            alertify.success("Línea guardada exitosamente.");
                            $('#modalLineas.in').modal('hide');
                            $('#modalLineas-backdrop').remove();
                        }
                        else {
                            
                            alertify.error("Error. Hubo un problema con el acceso a la base de datos.");
                        }
                        
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                     });
                     $("#txtDetalle").val("");
                     $("#txtSubImporte").val("");
                   
                }
                else{
                    
                     $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/agregarLinea",
                    data: '{idComp: "' + idComp + '", concepto: "' + concepto + '", fase: "' + fase + '", tipoCompra: "' + tipoCompra + '", detalle: "' + detalle + '", importe: "' + importe + '", importeComp: "' + importeComp + '", importeCompCred: "' + importeCompCred + '", idLinea: "' + idLinea + '"}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                       
                       
                        if (response.d != "error") {
                            
                            if (currentTr1 != null) {
                                
                                llenarTablaLineas();
                               
                                alertify.success("Línea guardada exitosamente.");
                                $('#modalLineas.in').modal('hide');
                                $('#modalLineas-backdrop').remove();
                                
                            }
                         $("#txtDetalle").val("");
                         $("#txtSubImporte").val("");
                        }
                        else {
                           
                            alertify.error("Error. Hubo un problema con el acceso a la base de datos.");
                        }
                        
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                }
                mostrarRendido($('#cmbRendicion').val());
            }


             //LLENAR TABLA DE COMPROBANTES

             function llenarTablaLineas() {
                 var idComp = $('#<%= lblIdComp.ClientID %>').val();
                 var t1 = $('#dtgLineas').DataTable();
                 t1.clear().draw();
                $.ajax({
                    type: "POST",
                    url: "NuevaRendicion.aspx/obtenerTablaLineas",
                    data: "{codRend:'" + idComp + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                       
                        $.each(response.d, function () {
                                                        
                            t1.row.add([
                            this['id'],
                            this['CONCEPTO_VALE_DESC'],
                            this['PROYECTO'],
                            this['FASE_DESC'],                            
                            this['IMPORTE'],
                            this['TIPO_COMPRA_DESC'],
                            this['DETALLE'],
                            this['CONCEPTO_VALE'],
                            this['FASE'],
                            this['TIPO_COMPRA'],
                            ""


                                                        
                            ]).draw(false);
                                
                        });
                        
                        
                    }
                });
             }
           

             //función para el botón de edición de comprobante
            $('#dtgLineas tbody').on('click', 'span.edit', function () {
                currentTr1 = this;
                var data = table1.row($(currentTr1).parents('tr')).data();
               
                $('#<%= lblIdLinea.ClientID %>').val(data[0]);
               
                var importe = 0;
                
                importe = data[4];
                
                $('#<%= txtDetalle.ClientID %>').val(data[6]);
                $('#<%= txtSubImporte.ClientID %>').val(importe);
                $('#cmbConcepto').val(data[7]).trigger('change');
                
                try {
                    
                    $('#cmbTipoCompra').val(data[9]).trigger('change');
                    $('#cmbFase').val(data[8]).trigger('change');
                  
                }
                catch (err) {
                    var a = "";
                }

                              

               
                $("#modalLineas").modal('show');
               
                var nit = $('#txtNit').val();
                if (nit == 'nd' || nit=="ND") {
                    document.getElementById("cmbTipoCompraS").style = "";
                   
                } else {
                    document.getElementById("cmbTipoCompraS").style = "display:none;";
                    
                }

               
            });

             //función para el botón de borrado de comprobante
            $('#dtgLineas tbody').on('click', 'span.delete', function () {
                currentTr1 = this;
                var data = table1.row($(this).parents('tr')).data();
               
                var id=data[0];
               
               
                alertify.set({ labels: { ok: "Si", cancel: "No" } });
                alertify.set({ buttonReverse: true });
               
                alertify.confirm("¿Seguro que desea borrar la línea? ", function (e) {
                    if (e) {
                       
                        $.ajax({
                            type: "POST",
                            url: "NuevaRendicion.aspx/borrarLinea",
                            data: '{id: "' + id + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: quitarLinea,
                            failure: function (response) {
                                console.log("error");
                            }
                        });
                    } else {
                        alertify.error("Operación cancelada");
                    }
                });
                mostrarRendido($('#cmbRendicion').val());
                
            });

            //funcion para quitar un registro de la tabla de comprobantes
            function quitarLinea(response) {

                if (currentTr1 != null) {

                    $(currentTr1).closest('tr').empty();
                    alertify.success("Linea eliminada exitosamente");
                }
                else {
                    alertify.success("Sucedió un problema al eliminar el registro.");
                }


            }

            function generarReporte() {
              
                var codRend = document.getElementById('<%= lblCodigoRend.ClientID %>').innerHTML;
                var saldo = document.getElementById('<%= lblPorRendir.ClientID %>').innerHTML;
               
               
                alertify.set({ labels: { ok: "Si", cancel: "No" } });
                alertify.set({ buttonReverse: true });
               
                alertify.confirm("¿Seguro que desea generar la Rendición? ", function (e) {
                    if (e) {
                       
                        $.ajax({
                            type: "POST",
                            url: "NuevaRendicion.aspx/generarRendicion",
                            data: '{codRend: "' + codRend + '", saldo:"' + saldo + '"}',
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: generarPDF,
                            failure: function (response) {
                                console.log("error");
                            }
                        });
                    } else {
                        alertify.error("Operación cancelada");
                    }
                });
               
                
                }

            function generarPDF() {
                var responsable = document.getElementById('<%= lblNombreUsuario.ClientID %>').innerHTML;
                console.log(responsable + " responsable");
                var fecha= moment().format("DD/MM/YYYY");

                var concepto= document.getElementById('<%= lblSubtitulo.ClientID %>').innerHTML;
                var codRend = document.getElementById('<%= lblCodigoRend.ClientID %>').innerHTML;
                var importe = document.getElementById('<%= lblAsignado.ClientID %>').innerHTML;
                var saldo = document.getElementById('<%= lblPorRendir.ClientID %>').innerHTML;
                var doc = new jsPDF('l');
    
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('bold');
                    doc.text("Responsable: ", 15, 25);
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('normal');
                    doc.text(responsable, 15 + 38, 25);
	
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('bold');
                    doc.text("Fecha: ", 15 , 29);
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('normal');
                    doc.text(fecha, 15 + 38, 29);
		
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('bold');
                    doc.text("Concepto: ", 15 , 33);
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('normal');
                    doc.text(concepto, 15 + 38, 33);
						
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('bold');
                    doc.text("Importe Recibido: ", 15 , 37);
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('normal');
                    doc.text(importe, 15 + 38, 37);

                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('bold');
                    doc.text("Saldo por Rendir: ", 15 , 41);
                    doc.setFontSize(10);
                    doc.setTextColor(0);
                    doc.setFontStyle('normal');
                    doc.text(saldo, 15 + 38, 41);
	
		
                    var totalPagesExp = "{total_pages_count_string}";
                    //Definimos el contenido adicional en la variable pageContent
                    var pageContent = function (data) {
                        // HEADER
        
                        doc.setFontSize(10);
                        doc.setTextColor(40);
                        doc.setFontStyle('bold');
                        doc.text("RENDICIÓN DE CUENTAS NRO: " + codRend, (doc.internal.pageSize.width/2)-25 , 18);
		
		


		
                        // FOOTER
                        var str = "Página " + data.pageCount;
                        // Total page number plugin only available in jspdf v1.0+
                        if (typeof doc.putTotalPages === 'function') {
                            str = str + " de " + totalPagesExp;
                        }
                        doc.setFontSize(10);
                        doc.text(str, doc.internal.pageSize.width - 35, doc.internal.pageSize.height - 10);
                    };
                    //obtenermos el id	de la tabla a renderizar
                    var elem = document.getElementById("dtgReporte");
                    var res = doc.autoTableHtmlToJson(elem);
                    //doc.autoTable es la variable encargada de escribir los datos.
                    doc.autoTable(res.columns, res.data, {startY: 45,
                        styles: {fontSize: 8, columnWidth: 'auto', overflow: 'linebreak'},
                        margin: {top: 20},
                        columnStyles: {text: {columnWidth: 'auto'}},
                        //theme: 'grid',
                        addPageContent: pageContent
                    });

                    // Total page number plugin only available in jspdf v1.0+
                    if (typeof doc.putTotalPages === 'function') {
                        doc.putTotalPages(totalPagesExp);
                    }
	
                    doc.text("---------------------------------------", 74, doc.autoTable.previous.finalY + 10);
                    doc.text("Fabiola Gomez", 84, doc.autoTable.previous.finalY + 15);
                    doc.text("Administración y Finanzas", 74, doc.autoTable.previous.finalY + 20);

	
                    doc.text("----------------------------------------", 194, doc.autoTable.previous.finalY + 10);
                    doc.text("Zandy Rojas", 204, doc.autoTable.previous.finalY + 15);
                    doc.text("Custodio", 207, doc.autoTable.previous.finalY + 20);

	
	
	
                    doc.output("dataurlnewwindow");
                    location.reload();

                }
                
            



           
        }



    </script>

    <script src="Scripts/jquery-migrate-1.2.1.min.js"></script>   
    
</body>
</html>

