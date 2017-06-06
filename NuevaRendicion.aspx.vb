
Imports System.Web.Services

Partial Class NuevaRendicion
    Inherits System.Web.UI.Page
    Dim query As String
    Dim fn As New Funciones

    Sub llenarTitulos()

        query = " SELECT REFERENCIA FROM FAR.FAR.A_RENDIR WHERE ID='" & Session("Rid") & "'"
        lblSubtitulo.Text = obtenerSubtitulo("")


    End Sub

    Function obtenerSubtitulo(ByVal def As String) As String
        lblSubtitulo.Text = cmbRendicion.SelectedItem.ToString
        Return lblSubtitulo.Text
    End Function



    Sub llenarComboARendir()
        'query = " SELECT ID,{FN CONCAT({FN CONCAT({FN CONCAT(CONVERT(VARCHAR(20), IMPORTE),' Bs.')},' --- ')},REFERENCIA)} IMPORTE,FECHA"
        'query += " FROM FAR.FAR.A_RENDIR A"
        'query += " WHERE ID_USUARIO=" & CInt(Session("id"))
        'query += " AND ESTADO IN ('N','G')"

        query = " SELECT ID,IMPORTE,FECHA FROM ("
        query += " SELECT ID,ID_USUARIO,{FN CONCAT({FN CONCAT({FN CONCAT(CONVERT(VARCHAR(20), IMPORTE),' Bs.')},' --- ')},REFERENCIA)} IMPORTE,FECHA,ISNULL((SELECT A.ESTADO FROM FAR.FAR.A_RENDIR B"
        query += " WHERE A.APLICA=B.ASIENTO),ISNULL((SELECT B.ESTADO FROM FAR.FAR.A_RENDIR B"
        query += " WHERE B.APLICA=A.ASIENTO),A.ESTADO))ESTADO"
        query += " FROM FAR.FAR.A_RENDIR A"
        query += " )VISTA"
        query += " WHERE ID_USUARIO=" & CInt(Session("id"))
        query += " AND ESTADO IN ('N','G')"

        fn.llenarComboBoxOpciones(cmbRendicion, query, "IMPORTE", "ID", "FECHA")
        'If cmbPrueba.Items.Count = 0 Then
        '    btnNuevaRendicion.Attributes("class") = "btn btn-primary btn-lg disabled"
        'Else
        '    btnNuevaRendicion.Attributes("class") = "btn btn-primary btn-lg active"
        'End If


    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lblUsuario.Text = Session("usuario")

        If Not Page.IsPostBack Then
            llenarComboARendir()
        End If
        llenarTitulos()


    End Sub










#Region "Funciones Web"
    <WebMethod()>
    Public Shared Function obtenerRazonSocial(nit As String) As String
        Dim query As String
        Dim razonSocial As String
        Dim fn As New Funciones
        query = "SELECT RAZON_SOCIAL FROM FAR.ERP.NIT WHERE NIT='" & nit & "'"
        razonSocial = fn.DevolverDatoQuery(query)
        If nit = "" Then
            razonSocial = "NULL"

        End If


        Return razonSocial
    End Function
#End Region

End Class
