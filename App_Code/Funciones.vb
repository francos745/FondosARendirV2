Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Configuration
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports System.Text
Imports System

Public Class Funciones

#Region "VARIABLES"
    Public conexion As SqlConnection
    Public CN As String = Desencriptar(ObtenerCadenaConexion("conn"))
    Public enunciado As SqlCommand
    Public respuesta As SqlDataReader
    Public Con As String
#End Region

#Region "CIFRADO"
    'Esta función encripta una cadena de caracteres.
    Public Function Encriptar(ByVal Input As String) As String

        Dim IV() As Byte = ASCIIEncoding.ASCII.GetBytes("softland") 'La clave debe ser de 8 caracteres
        Dim EncryptionKey() As Byte = Convert.FromBase64String("CleverLimitadaLaPazBolivia2015V1") 'No se puede alterar la cantidad de caracteres pero si la clave
        Dim buffer() As Byte = Encoding.UTF8.GetBytes(Input)
        Dim des As TripleDESCryptoServiceProvider = New TripleDESCryptoServiceProvider
        des.Key = EncryptionKey
        des.IV = IV
        Return Convert.ToBase64String(des.CreateEncryptor().TransformFinalBlock(buffer, 0, buffer.Length()))

    End Function
    'Esta función desencripta una cadena encriptada, en caso de no encontrar una cadena válida, se retorna la cadena ingresada
    Public Function Desencriptar(ByVal Input As String) As String
        Dim IV() As Byte = ASCIIEncoding.ASCII.GetBytes("softland") 'La clave debe ser de 8 caracteres
        Dim EncryptionKey() As Byte = Convert.FromBase64String("CleverLimitadaLaPazBolivia2015V1") 'No se puede alterar la cantidad de caracteres pero si la clave
        Try
            Dim buffer() As Byte = Convert.FromBase64String(Input)
            Dim des As TripleDESCryptoServiceProvider = New TripleDESCryptoServiceProvider
            des.Key = EncryptionKey
            des.IV = IV
            Return Encoding.UTF8.GetString(des.CreateDecryptor().TransformFinalBlock(buffer, 0, buffer.Length()))
        Catch ex As System.Exception
            Return Input
        End Try
    End Function
#End Region

#Region "CONEXION A BASE DE DATOS"

    Sub conectar()
        Try
            conexion = New SqlConnection(CN)
            conexion.Open()
        Catch ex As Exception
            MesgBox("No se conecto debido a: " + ex.ToString)
        End Try
    End Sub
    Public Sub Desconectar()
        conexion.Close()
        conexion = Nothing
    End Sub
#End Region

#Region "FUNCIONES"


    'Funcion que llena el contenido de un combobox a partir de el objeto ComboBox, un query y dos columnas, columna 2 ID, columna 1 NOMBRE
    Sub llenarComboBox(ByVal cb As DropDownList, ByVal query As String, ByVal columna As String, ByVal columna2 As String)
        conectar()
        cb.Items.Clear()
        Try
            enunciado = New SqlCommand(query, conexion)

            respuesta = enunciado.ExecuteReader

            While respuesta.Read
                ' Crea un nuevo Item
                Dim oItem As New ListItem(respuesta.Item(columna), respuesta.Item(columna2))
                ' Lo agrega a la colección de Items del DropDownList

                cb.Items.Add(oItem)
            End While
            Dim UItem As New ListItem("Otro...", "Otro...")
            If cb.ID.ToString <> "cmbUM" And cb.ID.ToString <> "cmbCodigoProyecto" And cb.ID.ToString <> "cmbBodegaDestino" Then
                cb.Items.Add(UItem)
            End If

            respuesta.Close()
        Catch ex As System.Exception
        End Try
        Desconectar()
    End Sub

    'Funcion que llena el contenido de un combobox a partir de el objeto ComboBox, un query y dos columnas
    Sub llenarComboBoxOpciones(ByVal cb As DropDownList, ByVal query As String, ByVal columna As String, ByVal columna2 As String, ByVal columna3 As String)
        conectar()
        cb.Items.Clear()
        Try
            enunciado = New SqlCommand(query, conexion)

            respuesta = enunciado.ExecuteReader

            While respuesta.Read
                ' Crea un nuevo Item
                Dim oItem As New ListItem(respuesta.Item(columna) & " --- " & respuesta.Item(columna3), respuesta.Item(columna2))
                ' Lo agrega a la colección de Items del DropDownList

                cb.Items.Add(oItem)
            End While
            Dim UItem As New ListItem("Otro...", "Otro...")
            cb.Items.Add(UItem)
            respuesta.Close()
        Catch ex As System.Exception
        End Try
        Desconectar()
    End Sub

    Sub llenarComboBox2(ByVal cb As DropDownList, ByVal query As String, ByVal columna As String, ByVal columna2 As String)
        conectar()
        cb.Items.Clear()
        Try
            enunciado = New SqlCommand(query, conexion)

            respuesta = enunciado.ExecuteReader

            While respuesta.Read
                ' Crea un nuevo Item
                Dim oItem As New ListItem(respuesta.Item(columna), respuesta.Item(columna2))
                ' Lo agrega a la colección de Items del DropDownList

                cb.Items.Add(oItem)
            End While

            respuesta.Close()
        Catch ex As System.Exception
        End Try
        Desconectar()
    End Sub

    Sub llenarComboBoxOpciones2(ByVal cb As DropDownList, ByVal query As String, ByVal columna As String, ByVal columna2 As String, ByVal columna3 As String)
        conectar()
        cb.Items.Clear()
        Try
            enunciado = New SqlCommand(query, conexion)

            respuesta = enunciado.ExecuteReader

            While respuesta.Read
                ' Crea un nuevo Item
                Dim oItem As New ListItem(respuesta.Item(columna) & " --- " & respuesta.Item(columna3), respuesta.Item(columna2))
                ' Lo agrega a la colección de Items del DropDownList

                cb.Items.Add(oItem)
            End While
            respuesta.Close()
        Catch ex As System.Exception
        End Try
        Desconectar()
    End Sub

    Sub llenarComboBoxOpcionesList(ByVal cb As ListBox, ByVal query As String, ByVal columna As String, ByVal columna2 As String, ByVal columna3 As String)
        conectar()
        cb.Items.Clear()
        Try
            enunciado = New SqlCommand(query, conexion)

            respuesta = enunciado.ExecuteReader

            While respuesta.Read
                ' Crea un nuevo Item
                Dim oItem As New ListItem(respuesta.Item(columna) & " --- " & respuesta.Item(columna3), respuesta.Item(columna2))
                ' Lo agrega a la colección de Items del DropDownList

                cb.Items.Add(oItem)
            End While
            respuesta.Close()
        Catch ex As System.Exception
        End Try
        Desconectar()
    End Sub

    Public Function separarCadena(ByRef cad As String, ByRef posicion As Boolean, ByRef separador As String) As String '
        Dim b As String
        Dim pos As Integer
        Dim largo As Integer = cad.Length

        pos = InStr(cad, separador)
        If pos <> 0 Then
            If posicion = False Then
                b = cad.Substring(0, pos - 1)
            Else
                b = cad.Substring(pos, largo - pos)
                b = b.Substring(separador.Length - 1, b.Length - separador.Length + 1)
            End If
        Else
            b = "Otro..."
        End If
        Return b
    End Function

    Public Function limpiarComillas(ByVal palabra As String) As String
        palabra = palabra.Replace("'", "''")

        Return palabra
    End Function

    'Retorna el primer registro de una consulta, utilizando un query como parametro
    Public Function DevolverDatoQuery(ByVal query As String) As String
        Try
            conectar()
            enunciado = New SqlCommand(query, conexion)
            Dim Devolver As String = ""
            Devolver = enunciado.ExecuteScalar()
            enunciado = Nothing
            Desconectar()
            Return Devolver
        Catch ex As System.Exception

            Return ""
        End Try
    End Function

    'Funcion que ejecuta un comando sql, como: Insert,Update,Delete, Etc.
    Sub ejecutarComandoSQL(ByVal query As String, ByVal lblmens As Label, ByVal lblmensS As HtmlContainerControl)


        Try
            conectar()
            enunciado = New SqlCommand(query, conexion)
            enunciado.CommandTimeout = 6000
            Dim t As Integer = enunciado.ExecuteNonQuery()
            Desconectar()
        Catch ex As System.Exception
            lblmens.Text = "Error en el comando para el módulo: " & ex.Message
            lblmensS.Attributes("class") = "alert alert-danger"
        End Try


    End Sub

    'Funcion que ejecuta un comando sql, como: Insert,Update,Delete, Etc.
    Sub ejecutarComandoSQL2(ByVal query As String)
        Try
            conectar()
            enunciado = New SqlCommand(query, conexion)
            enunciado.CommandTimeout = 6000
            Dim t As Integer = enunciado.ExecuteNonQuery()
            Desconectar()
        Catch ex As System.Exception
            MesgBox(" No se pudo ejecutar la instrucción. " + query + ex.Message)
        End Try


    End Sub



#End Region

#Region "CONEXION XML"

    Public Function ObtenerCadenaConexion(ByVal nombreCon As String) As String
        Dim Cadena As String = ConfigurationManager.ConnectionStrings(nombreCon).ConnectionString()
        Return Cadena
    End Function

#End Region

#Region "Funciones Personalizadas"
    Public Sub MesgBox(ByVal sMessage As String)
        System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=""JavaScript"">alert('" & sMessage & "')</SCRIPT>")
    End Sub


#End Region



End Class
