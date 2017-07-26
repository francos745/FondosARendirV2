<%@ Page Title="Home Page" Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Fondos A Rendir</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
        <meta charset="utf-8"/>
        <link rel="shortcut icon" href="img/clever.png" />
        <meta name="generator" content="Bootply" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <!-- CSS -->
    

         <link href="css/bootstrap.min.css" rel="stylesheet"/>
         <link href="Content/font-awesome.min.css" rel="stylesheet"/>	
         <link href="css/style2.css" rel="stylesheet"/>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    
    </head>
        <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3">
                        	<div class="form-top">
							 <div class="form-top-right">
                        			
                                 <img src="images/icons/clever.png" class="" alt="Cinque Terre" width="70%" height="70%"/>
                        		</div>
                        		<div class="form-top-left">
								<h1 style="text-align:center;"><strong>Fondos a Rendir</strong></h1>   
                        			
                            		<h5>Ingrese su nombre de Usuario y Contraseña para acceder:</h5>
                        		</div>
                        		
                            </div>
                            <div class="form-bottom">
			                    
                                <form class="login-form" id="form1" runat="server" >
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Nombre de Usuario></label>
			                        	<asp:TextBox ID="txtUsuario" runat="server" class="form-control input-lg text-center" placeholder="Usuario"></asp:TextBox>
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Contraseña</label>
                                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" class="form-control input-lg text-center" placeholder="Contraseña" ></asp:TextBox>
			                        	
			                        </div>
			                       <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btn btn-primary btn-lg btn-block" />
                                    <div runat="server" id="alert" class="">
                                        <strong><asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label></strong>
                                    </div>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>




<%--
<body>


    <!--login modal-->
		<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-header text-center" >
					
				
                    
                   <h2 class="text-center">FONDOS A RENDIR</h2>
                    <h4 class="text-center">Ingrese su nombre de usuario y contraseña.</h4>
				</div>
				<div class="modal-body text-center">
					<form class="form col-md-12 center-block" id="form1" runat="server">
						<div class="form-group">
							<h4><strong>USUARIO</strong> </h4>
							<asp:TextBox ID="txtUsuario" runat="server" class="form-control input-lg text-center" placeholder="Usuario"></asp:TextBox>
						</div>
						<div class="form-group">
							
                            <h4><strong>CONTRASEÑA</strong> </h4>
                            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" class="form-control input-lg text-center" placeholder="Contraseña" ></asp:TextBox>
						</div>
						<div class="form-group">
		                    
                            
                        </div>

                        <div class="btn-group btn-group-justified" role="group" aria-label="...">
                            <div class="btn-group" role="group">
                                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" class="btn btn-primary btn-lg btn-block" />
                            </div>
  
                        </div>

                        
				  </form>
				</div>
				<div class="modal-footer">
					<div class="col-md-12">
					</div>	
				</div>
			</div>
            
            <div id="footer">
                <div class="container">
                   <div class="modal-header text-right" >
					<img src="images/icons/clever.png" class="" alt="Cinque Terre" width="5%" height="5%"/>
					
				    </div>
                </div>
            </div>
		</div>

		
</body>--%>
</html>
