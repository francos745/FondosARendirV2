
Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class imprimirRendicion
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
        query = " SELECT ID,CODIGO_RENDICION,FECHA_IMPRESION FROM FAR.RENDICION"
        query += " WHERE ESTADO='G'"
        query += " AND COD_CONTROL<>'B'"

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
                          .Text = sdr("CODIGO_RENDICION").ToString() & "----" & sdr("FECHA_IMPRESION").ToString()
                        })
                    End While
                End Using
                con.Close()
                Return customers
            End Using
        End Using
    End Function






#End Region
End Class
