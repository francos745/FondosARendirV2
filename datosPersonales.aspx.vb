
Partial Class datosPersonales
    Inherits System.Web.UI.Page
    Sub verificarInicioSesion()

        Dim deshabilitado As Boolean = False

        'VALIDAMOS QUE EXISTA UN PROYECTO REGISTRADO
        If Session("usuario") = "" Then
            Response.Redirect("Default.aspx")
        End If

        'VALIDAMOS QUE LA CONTRASEÑA POR DEFECTO NO SE REPITA

        If Session("pass") = Session("defPass") Then
            Response.Redirect("cambiarPass.aspx")
        End If



        If DateTime.Now.ToShortDateString = Session("fechaExp") Then
            Response.Redirect("cambiarPass.aspx")
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            verificarInicioSesion()

        End If

    End Sub
End Class
