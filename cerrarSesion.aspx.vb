
Partial Class cerrarSesion
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session.Clear()
        Response.Redirect("Default.aspx")
    End Sub

End Class
