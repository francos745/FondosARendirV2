


Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim fn As New Funciones
    Dim query As String
    Dim cadena As String = fn.ObtenerCadenaConexion("conn")
    Dim conexion As New SqlConnection(cadena)

    Protected Sub btnIngresar_Click(sender As Object, e As System.EventArgs) Handles btnIngresar.Click
        conexion.Open()
        Dim cmd As New SqlCommand()
        Dim dr As SqlDataReader
        Dim id As String
        Dim pass, fechaExp As String
        cmd.Connection = conexion
        cmd.CommandText = " SELECT ID,USUARIO,DEFPASS, {FN CONCAT({FN CONCAT (NOMBRE,{FN CONCAT (' ',{FN CONCAT (APELLIDO,' ')})})},APELLIDO_MAT)} NOMBRE FROM FAR.ACCESOS WHERE USUARIO= @usuario AND ESTADO='H'"
        cmd.Parameters.Add(New SqlParameter("usuario", txtUsuario.Text))

        dr = cmd.ExecuteReader
        If (dr.Read) Then

            id = CStr(dr(0))
            Session.Add("usuario", CStr(dr(1)))
            Session.Add("defPass", CStr(dr(2)))
            Session.Add("nombreUsuario", CStr(dr(3)))
            Session.Add("id", id)
            query = "SELECT TOP 1 PASS FROM FAR.PASSWORD WHERE ID_USUARIO='" & id & "' ORDER BY ID DESC"

            pass = fn.DevolverDatoQuery(query)

            If (pass = fn.Encriptar(txtPass.Text)) Then
                query = "SELECT TOP 1 CONVERT (char(10), FECHA_EXP, 103) FECHA_EXP FROM FAR.PASSWORD WHERE ID_USUARIO='" & id & "' ORDER BY ID DESC"
                fechaExp = fn.DevolverDatoQuery(query)

                Session.Add("pass", pass)
                Session.Add("fechaExp", fechaExp)
                Response.Redirect("NuevaRendicion.aspx")
            Else
                alert.Attributes("class") = "alert alert-danger"
                lblMensaje.Text = "Contraseña Incorrecta"
            End If

        Else
            alert.Attributes("class") = "alert alert-warning"
            lblMensaje.Text = "Nombre de usuario inexistente"
        End If

    End Sub


End Class
