


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
        Dim cont As Integer
        Dim usuario As String = ""
        Dim idARendir As String = ""
        cmd.Connection = conexion
        cmd.CommandText = " SELECT ID,USUARIO,DEFPASS, {FN CONCAT({FN CONCAT (NOMBRE,{FN CONCAT (' ',{FN CONCAT (APELLIDO,' ')})})},APELLIDO_MAT)} NOMBRE FROM FAR.ACCESOS WHERE USUARIO= @usuario AND ESTADO='H'"
        cmd.Parameters.Add(New SqlParameter("usuario", txtUsuario.Text))

        dr = cmd.ExecuteReader
        If (dr.Read) Then

            id = CStr(dr(0))
            usuario = CStr(dr(3)).ToUpper
            Session.Add("usuario", CStr(dr(1)))
            Session.Add("defPass", CStr(dr(2)))
            Session.Add("nombreUsuario", usuario)
            Session.Add("id", id)
            query = "SELECT TOP 1 PASS FROM FAR.PASSWORD WHERE ID_USUARIO='" & id & "' ORDER BY ID DESC"

            pass = fn.DevolverDatoQuery(query)

            If (pass = fn.Encriptar(txtPass.Text)) Then
                query = "SELECT TOP 1 CONVERT (char(10), FECHA_EXP, 103) FECHA_EXP FROM FAR.PASSWORD WHERE ID_USUARIO='" & id & "' ORDER BY ID DESC"
                fechaExp = fn.DevolverDatoQuery(query)

                Session.Add("pass", pass)
                Session.Add("fechaExp", fechaExp)


                query = " SELECT COUNT('A') FROM FAR.ACCESOS WHERE ID='" & id & "' AND ID_SIN_FONDOS<>0"

                cont = CInt(fn.DevolverDatoQuery(query))
                If cont = 0 Then
                    query = " INSERT INTO FAR.A_RENDIR (ID_USUARIO,CUENTA_BANCO,TIPO_DOC,NUMERO,FECHA,PAGADERO_A,REFERENCIA,IMPORTE,ASIENTO,DETALLE,ESTADO,COD_CONTROL,ID_CONS,REFERENCIA_CONS,ASIENTO_CONS)"
                    query += " VALUES ('" & id & "','0','N/D',0,GETDATE(),'" & usuario & "','CUENTA PARA RENDICIONES SIN FONDOS ASIGNADOS PARA " & usuario & "',0,'AS" & id & "','','N','C',0,'CUENTA PARA RENDICIONES SIN FONDOS ASIGNADOS PARA " & usuario & "','AS" & id & "')"
                    Try
                        fn.ejecutarComandoSQL2(query)
                    Catch ex As Exception

                    End Try

                    query = " SELECT IDENT_CURRENT('FAR.A_RENDIR')"
                    Try
                        idARendir = fn.DevolverDatoQuery(query)
                    Catch ex As Exception
                        Exit Sub
                    End Try

                    query = " UPDATE FAR.ACCESOS SET ID_SIN_FONDOS='" & idARendir & "' WHERE ID='" & id & "'"
                    Try
                        fn.ejecutarComandoSQL2(query)
                    Catch ex As Exception
                        Exit Sub
                    End Try
                End If


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
