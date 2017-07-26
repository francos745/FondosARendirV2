
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class NuevaRendicionSF
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
            lblUsuario.Text = Session("usuario")
            lblId.Text = Session("id")
            lblNombreUsuario.Text = Session("nombreUsuario")
        End If

    End Sub


#Region "Funciones Web"
    <WebMethod()>
    Public Shared Function llenarComboARendir(id As String) As List(Of ListItem)
        Dim query As String
        query = " SELECT ID,"
        query += " {FN CONCAT({FN CONCAT({FN CONCAT(CONVERT(VARCHAR(20), IMPORTE),' Bs.')},' --- ')},REFERENCIA_CONS)} IMPORTE,"
        query += " FECHA"
        query += "  FROM ("
        query += " SELECT ID,REFERENCIA_CONS,IMPORTE,FECHA FROM FAR.A_RENDIR WHERE ID=(SELECT ID_SIN_FONDOS FROM FAR.ACCESOS WHERE ID='" & id & "')"
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
    Public Shared Function obtenerRendido(id As String, codigoRend As String) As String
        Dim query As String
        Dim fn As New Funciones
        Dim rendido As String
        query = " SELECT ISNULL(convert(numeric(9,2),round(SUM(A.IMPORTE),2,1)) ,0) RENDIDO "
        query += " FROM FAR.DOCS_FAR_LINEA A "
        query += " WHERE A.ID_DOCS_FAR In (Select B.ID FROM FAR.DOCS_FAR B "
        query += " WHERE B.ID_RENDICION In (Select C.ID FROM FAR.RENDICION C "
        query += " WHERE C.ID_A_RENDIR In (Select D.ID FROM FAR.A_RENDIR D WHERE D.ID='" & id & "') AND C.CODIGO_RENDICION='" & codigoRend & "'))"
        query += " AND A.COD_CONTROL<>'B'"
        Try
            rendido = fn.DevolverDatoQuery(query)
        Catch ex As Exception
            Return "No se pudo acceder a la base de datos"
        End Try


        Return rendido
    End Function




#End Region
End Class
