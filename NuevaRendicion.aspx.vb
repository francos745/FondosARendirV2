Imports System.Data
Imports System.Web.Services
Imports System.Configuration
Imports System.Data.SqlClient

Partial Class NuevaRendicion
    Inherits System.Web.UI.Page
    Dim query As String
    Dim fn As New Funciones

    Sub verificarInicioSesion()
        If Session("usuario") = "" Then
            Response.Redirect("Default.aspx")
        End If
    End Sub




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        verificarInicioSesion()
        lblUsuario.Text = Session("usuario")
        lblId.Text = Session("id")


    End Sub


#Region "Funciones Web"
    <WebMethod()>
    Public Shared Function llenarComboARendir(id As String) As List(Of ListItem)
        Dim query As String
        query = " SELECT ID,"
        query += " {FN CONCAT({FN CONCAT({FN CONCAT(CONVERT(VARCHAR(20), IMPORTE),' Bs.')},' --- ')},REFERENCIA_CONS)} IMPORTE,"
        query += " FECHA"
        query += "  FROM ("
        query += " SELECT"
        query += " (SELECT TOP 1 ID FROM FARV2.FAR.A_RENDIR B WHERE A.ASIENTO_CONS=B.ASIENTO_CONS ) ID,"
        query += " REFERENCIA_CONS,"
        query += " SUM(IMPORTE)IMPORTE, "
        query += " (SELECT TOP 1 FECHA FROM FARV2.FAR.A_RENDIR C WHERE A.ASIENTO_CONS=C.ASIENTO_CONS ) FECHA"
        query += " FROM FARV2.FAR.A_RENDIR A"
        query += " WHERE ID_USUARIO='" & id & "'"
        query += " GROUP BY REFERENCIA_CONS,ASIENTO_CONS"
        query += " )VISTA"
        Dim constr As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                Dim customers As New List(Of ListItem)()
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        customers.Add(New ListItem() With {
                          .Value = sdr("ID").ToString(),
                          .Text = sdr("IMPORTE").ToString() & "----" & sdr("FECHA").ToString()
                        })
                    End While
                End Using
                con.Close()
                Return customers
            End Using
        End Using
    End Function

    <WebMethod()>
    Public Shared Function obtenerCodigoRendicion(id As String) As String
        Dim query As String
        Dim codigo As String = ""
        Dim referencia As String = ""
        Dim monto As String = ""
        Dim fn As New Funciones
        query = "SELECT CODIGO_RENDICION FROM FAR.RENDICION WHERE ID_A_RENDIR='" & id & "'"
        Try
            codigo = fn.DevolverDatoQuery(query)
        Catch ex As Exception
            Return "Error al acceder a la base de datos"
        End Try

        query = "SELECT REFERENCIA FROM FAR.RENDICION WHERE ID_A_RENDIR='" & id & "'"
        Try
            referencia = fn.DevolverDatoQuery(query)
        Catch ex As Exception
            Return "Error al acceder a la base de datos"
        End Try


        If id = "" Then
            codigo = "NULO"
        Else
            If codigo = "" Then
                codigo = "N/E"
            End If
        End If

        If id = "" Then
            referencia = "NULO"
        Else
            If referencia = "" Then
                query = "SELECT REFERENCIA FROM FAR.A_RENDIR WHERE ID='" & id & "'"
                Try
                    referencia = fn.DevolverDatoQuery(query)
                Catch ex As Exception
                    Return "Error al acceder a la base de datos"
                End Try

                If referencia = "" Then
                        referencia = "N/E"
                    End If

            End If
        End If


        Return codigo & "***" & referencia
    End Function

    <WebMethod()>
    Public Shared Function obtenerRendido(id As String) As String
        Dim query As String
        Dim fn As New Funciones
        Dim rendido As String
        query = " SELECT ISNULL(convert(numeric(9,2),round(SUM(A.IMPORTE),2,1)) ,0) RENDIDO"
        query += " FROM FAR.DOCS_FAR_LINEA A JOIN FAR.DOCS_FAR B On A.ID_DOCS_FAR=A.ID"
        query += " JOIN FAR.RENDICION C ON B.ID_RENDICION=C.ID "
        query += " JOIN FAR.A_RENDIR D On C.ID_A_RENDIR=D.ID"
        query += " WHERE D.ID='" & id & "'"

        Try
            rendido = fn.DevolverDatoQuery(query)
        Catch ex As Exception
            Return "No se pudo acceder a la base de datos"
        End Try


        Return rendido
    End Function

    <WebMethod()>
    Public Shared Function obtenerRazonSocial(nit As String) As String
        Dim query As String
        Dim razonSocial As String = ""
        Dim fn As New Funciones
        query = "Select RAZON_SOCIAL FROM ERP.NIT WHERE NIT='" & nit & "'"
        razonSocial = fn.DevolverDatoQuery(query)
        If nit = "" Then
            razonSocial = "NULO"
        Else
            If razonSocial = "" Then
                razonSocial = "N/E"
            End If
        End If
        Return razonSocial
    End Function

    <WebMethod()>
    Public Shared Function insertarNuevoNit(nit As String, razonSocial As String, aliasNit As String) As String
        Dim query As String
        Dim fn As New Funciones
        query = " INSERT INTO ERP.NIT (NIT,RAZON_SOCIAL,ALIAS,TIPO) VALUES ('" & nit & "','" & razonSocial & "','" & aliasNit & "','ND')"

        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return query
        End Try

        Return razonSocial
    End Function
#End Region

End Class
