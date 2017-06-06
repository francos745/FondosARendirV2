<%@ Page Title="Home Page" Language="VB" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
		<meta charset="utf-8"/>
		<title>Página Principal</title>
         <script language="javascript" type="text/javascript">
             javascript: window.history.forward(1);
        </script>
        <link rel="shortcut icon" href="images/icons/clever.png" />
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2"/>
		<link href="Content/bootstrap.min.css" rel="stylesheet"/>
        <link href="Content/Estilos.css" rel="stylesheet"/>
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="Content/styles.css" rel="stylesheet"/>
        
        <!-- script references -->
		<script type="text/jscript" src="Scripts/jquery.min.js"></script>
		<script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
</head>
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

                        <div runat="server" id="alert" class="">
                            <strong><asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label></strong>
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

		
</body>
</html>
