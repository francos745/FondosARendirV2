
Partial Class cambiarPass
    Inherits System.Web.UI.Page
    Dim fn As New Funciones
    Dim query As String


    Sub validarInicioSesion()
        Dim deshabilitado As Boolean = False
        Dim cont As Integer = 0
        'VALIDAMOS QUE EXISTA UN PROYECTO REGISTRADO
        If Session("usuario") = "" Then
            Response.Redirect("Default.aspx")
        End If

        'VALIDAMOS QUE LA CONTRASEÑA POR DEFECTO NO SE REPITA

        If Session("pass") = Session("defPass") Then
            lblMensajeError.Text += "- Debe cambiar la contraseña para continuar."
            lblMensajeErrorS.Attributes("style") = ""
            lblMensajeErrorS.Attributes("class") = "alert alert-danger"
            cont += 1

        End If



        If DateTime.Now.ToShortDateString = Session("fechaExp") Then
            lblMensajeError.Text += "- El periodo de su contraseña a expirado. Debe cambiar la contraseña para continuar."
            lblMensajeErrorS.Attributes("style") = ""
            lblMensajeErrorS.Attributes("class") = "alert alert-danger"
            cont += 1
        End If
        If cont = 0 Then
            lblMensajeError.Text += ""
            lblMensajeErrorS.Attributes("style") = "display:none;"
            lblMensajeErrorS.Attributes("class") = "alert alert-danger"
        End If

    End Sub




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            validarInicioSesion()
            lblUsuario.Text = Session("usuario")
            lblId.Text = Session("id")
            lblNombreUsuario.Text = Session("nombreUsuario")
            lblPass.Text = fn.Desencriptar(Session("pass"))
        End If

    End Sub

    Protected Sub btnPassAceptar_click(sender As Object, e As System.EventArgs) Handles btnPassAceptar.ServerClick

        Dim passDef As String = Session("defPass").ToString

        Dim passAnt As String = fn.Encriptar(lblPass.Text)
        If fn.Encriptar(txtPassActual.Value.ToString) = passAnt Then
            If txtPassNueva.Value.ToString = txtPassConfirmar.Value.ToString Then
                If fn.Encriptar(txtPassNueva.Value.ToString) <> passDef Then
                    Dim cont As Integer
                    query = " SELECT COUNT('A') FROM ("
                    query += " SELECT TOP 5 PASS FROM FAR.PASSWORD"
                    query += " WHERE ID_USUARIO='" & Session("id").ToString & "'"
                    query += " ORDER BY FECHA_EXP DESC"
                    query += " )VISTA"
                    query += " WHERE PASS = '" & fn.Encriptar(txtPassNueva.Value.ToString) & "'"

                    cont = CInt(fn.DevolverDatoQuery(Query))
                    If cont = 0 Then
                        query = " INSERT INTO FAR.PASSWORD (ID_USUARIO,PASS) VALUES ('" & Session("id").ToString & "','" & fn.Encriptar(txtPassConfirmar.Value.ToString) & "')"

                        fn.ejecutarComandoSQL(Query, lblMensaje, lblMensajeS)
                        lblMensaje.Attributes("class") = "alert alert-success"
                        lblPass.Text = txtPassConfirmar.Value.ToString
                        Session.Remove("defPass")
                        Session.Add("defPass", DateTime.Now.AddDays(90).ToShortDateString)
                        Session.Remove("pass")
                        Session.Add("pass", txtPassConfirmar.Value.ToString)
                        Session.Remove("fechaExp")
                        Session.Add("fechaExp", DateTime.Now.AddDays(90).ToShortDateString)
                        lblMensaje.Text = "Contraseña cambiada exitosamente"
                        validarInicioSesion()
                    Else
                        lblMensaje.Attributes("class") = "alert alert-danger"
                        lblMensaje.Text = "No se pudo cambiar la contraseña, ya utilizó esta contraseña."
                    End If

                Else
                    lblMensaje.Attributes("class") = "alert alert-danger"
                    lblMensaje.Text = "No se pudo cambiar la contraseña. Seleccione una contraseña distinta e intente nuevamente."
                End If
            Else
                lblMensaje.Attributes("class") = "alert alert-danger"
                lblMensaje.Text = "No se pudo cambiar la contraseña, las contraseñas ingresadas no coinciden."

            End If
        Else
            lblMensaje.Attributes("class") = "alert alert-danger"
            lblMensaje.Text = "No se pudo cambiar la contraseña, la contraseña actual no coincide con la ingresada."
        End If
    End Sub

End Class
