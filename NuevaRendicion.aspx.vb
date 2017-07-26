Imports System.Data
Imports System.Web.Services
Imports System.Configuration
Imports System.Data.SqlClient

Partial Class NuevaRendicion
    Inherits System.Web.UI.Page
    Dim query As String
    Dim fn As New Funciones

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
        query += " SELECT"
        query += " (SELECT TOP 1 ID FROM FARV2.FAR.A_RENDIR B WHERE A.ASIENTO_CONS=B.ASIENTO_CONS ) ID,"
        query += " REFERENCIA_CONS,"
        query += " SUM(IMPORTE)IMPORTE, "
        query += " (SELECT TOP 1 FECHA FROM FARV2.FAR.A_RENDIR C WHERE A.ASIENTO_CONS=C.ASIENTO_CONS ) FECHA"
        query += " FROM FARV2.FAR.A_RENDIR A"
        query += " WHERE ID_USUARIO='" & id & "'"
        query += " GROUP BY REFERENCIA_CONS,ASIENTO_CONS"
        query += " )VISTA"
        query += " WHERE IMPORTE - (SELECT SUM(E_IMPORTE) FROM FAR.DETALLE WHERE B_ID=VISTA.ID AND E_COD_CONTROL<>'B')>0"

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
    Public Shared Function llenarComboConcepto(id As String) As List(Of ListItem)
        Dim query As String
        query = " SELECT CONCEPTO_VALE ID,DESCRIPCION "
        query += " FROM FARV2.ERP.CONCEPTO_VALE"
        query += " WHERE CONCEPTO_VALE IN ("
        query += " SELECT CONCEPTO_VALE"
        query += " FROM FARV2.FAR.NIT_CONCEPTO_VALE"
        query += " WHERE ID_USUARIO='" & id & "'"
        query += " )"

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
                          .Text = sdr("DESCRIPCION").ToString()
                        })
                    End While
                End Using
                con.Close()
                Return customers
            End Using
        End Using
    End Function

    <WebMethod()>
    Public Shared Function llenarComboFase(id As String) As List(Of ListItem)
        Dim query As String
        Dim centroCosto As String
        Dim fn As New Funciones


        query = "SELECT CENTRO_COSTO FROM FARV2.ERP.CONCEPTO_VALE WHERE CONCEPTO_VALE='" + id + "'"
        centroCosto = fn.DevolverDatoQuery(query)

        query = "SELECT FASE,NOMBRE FROM FARV2.ERP.FASE_PY WHERE PROYECTO IN (SELECT PROYECTO FROM FARV2.ERP.PROYECTO_PY WHERE CENTRO_COSTO='" & centroCosto & "') AND ACEPTA_DATOS='S'"

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
                          .Value = sdr("FASE").ToString(),
                          .Text = sdr("NOMBRE").ToString()
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
        query = "SELECT CODIGO_RENDICION FROM FAR.RENDICION WHERE ID_A_RENDIR='" & id & "' AND ESTADO='N'"
        Try
            codigo = fn.DevolverDatoQuery(query)
        Catch ex As Exception
            Return "Error al acceder a la base de datos"
        End Try

        query = "SELECT REFERENCIA FROM FAR.RENDICION WHERE ID_A_RENDIR='" & id & "' AND ESTADO='N'"
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

    <WebMethod()>
    Public Shared Function obtenerRendidoAnterior(id As String, codigoRend As String) As String
        Dim query As String
        Dim fn As New Funciones
        Dim rendido As String
        query = " SELECT ISNULL(convert(numeric(9,2),round(SUM(A.IMPORTE),2,1)) ,0) RENDIDO "
        query += " FROM FAR.DOCS_FAR_LINEA A "
        query += " WHERE A.ID_DOCS_FAR In (Select B.ID FROM FAR.DOCS_FAR B "
        query += " WHERE B.ID_RENDICION In (Select C.ID FROM FAR.RENDICION C "
        query += " WHERE C.ID_A_RENDIR In (Select D.ID FROM FAR.A_RENDIR D WHERE D.ID='" & id & "') AND C.CODIGO_RENDICION<>'" & codigoRend & "'))"
        query += " AND A.COD_CONTROL<>'B'"
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

    <WebMethod()>
    Public Shared Function agregarComprobante(nit As String, razonSocial As String, factura As String, codControl As String, nroAutoriza As String, fecha As String, importe As Double, importeCredFisc As Double, codRend As String, idARendir As String) As String
        Dim query As String
        Dim fn As New Funciones
        Dim ref As String
        Dim idRend As String
        Dim excento As Double
        Dim idComp As String = ""
        'verificamos que el n[umero de rendicion exista, de lo contrario, creamos un nuevo numero de rendicion
        If codRend = "N/E" Then
            Dim numStr As String
            Dim nums As Integer
            Dim nroRen As String

            'OBTENEMOS EL CODIGO DE RENDICION
            query = "SELECT COUNT('A') FROM FAR.RENDICION"

            nums = CInt(fn.DevolverDatoQuery(query))
            nums += 1
            numStr = CStr(nums)

            While Len(numStr) < 5
                numStr = "0" & numStr
            End While
            nroRen = "FAR" + "-" + numStr

            'OBTENEMOS LA DESCRIPCION DE LA RENDICION
            query = " SELECT REFERENCIA_CONS FROM FAR.A_RENDIR WHERE ID='" & idARendir & "'"
            ref = fn.DevolverDatoQuery(query)

            query = " INSERT INTO FAR.RENDICION (ID_A_RENDIR,CODIGO_RENDICION,REFERENCIA) VALUES ('" & idARendir & "','" & nroRen & "','" & ref & "')"
            Try
                fn.ejecutarComandoSQL2(query)
            Catch ex As Exception
                Return ("error")
                Exit Function
            End Try
            codRend = nroRen
        End If

        excento = importe - importeCredFisc
        idRend = fn.DevolverDatoQuery(" SELECT ID FROM FAR.RENDICION WHERE CODIGO_RENDICION='" & codRend & "'")


        query = " INSERT INTO FAR.DOCS_FAR (ID_RENDICION,NRO_COMPROBANTE,CODIGO_CONTROL,PROVEEDOR,PROVEEDOR_ALIAS,NRO_AUTORIZA,FECHA,IMPORTE,ESTADO,EXCENTO,COD_CONTROL) "
        query += " VALUES ('" & idRend & "','" & factura & "','" & codControl & "','" & nit & "','" & razonSocial & "','" & nroAutoriza & "','" & CDate(fecha).ToString("yyyy/MM/dd") & "','" & importe & "','N','" & excento & "','C')"


        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return "error"
            Exit Function
        End Try
        query = " SELECT IDENT_CURRENT( 'FARV2.FAR.DOCS_FAR' )"
        Try
            idComp = fn.DevolverDatoQuery(query)
        Catch ex As Exception
            Return "error"
            Exit Function
        End Try
        Return idComp
    End Function

    <WebMethod()>
    Public Shared Function agregarLinea(idComp As String, concepto As String, fase As String, tipoCompra As String, detalle As String, importe As Double, importeComp As Double, importeCompCred As Double, idLinea As String) As List(Of ListItem)
        Dim fn As New Funciones
        Dim query As String
        ' Declaración de variables para llenar una nueva SUB_LINEA
        Dim customers As New List(Of ListItem)()

        Dim conceptoVale As String = concepto
        Dim cuentaContable As String = fn.DevolverDatoQuery("SELECT CUENTA_CONTABLE FROM FARV2.ERP.CONCEPTO_VALE WHERE CONCEPTO_VALE='" + concepto + "'")

        Dim centroCosto As String = fn.DevolverDatoQuery("SELECT CENTRO_COSTO FROM FARV2.ERP.CONCEPTO_VALE WHERE CONCEPTO_VALE='" + concepto + "'")
        Dim subImporte As Double = importe
        Dim subImporteR As Double = 0
        Dim imp As Double = 0
        Dim impCredFisc As Double = 0
        Dim subImporteAnt As Double = 0
        Dim ret1 As Double = 0
        Dim ret2 As Double = 0
        Dim ret3 As Double = 0
        Dim credFisc As Double = 0
        Dim RCiva As Double = 0
        Dim tipo As String
        Dim proyecto As String
        Dim excento As Double = 0
        'Dim idLinea As String = ""

        imp = importeComp
        impCredFisc = importeCompCred
        impCredFisc = imp - impCredFisc

        If tipoCompra <> "" Then
            If tipoCompra = "B" Then
                ret1 = CDbl(fn.DevolverDatoQuery("SELECT PORCENTAJE/100 PORCENTAJE FROM FAR.ERP.RETENCIONES WHERE CODIGO_RETENCION=(SELECT TOP 1 RETENCION_1 FROM FAR.FAR.GLOBALES)"))
                ret2 = CDbl(fn.DevolverDatoQuery("SELECT PORCENTAJE/100 PORCENTAJE FROM FAR.ERP.RETENCIONES WHERE CODIGO_RETENCION=(SELECT TOP 1 RETENCION_2 FROM FAR.FAR.GLOBALES)"))
                tipo = "B"
            Else
                If tipoCompra = "A" Then
                    ret1 = CDbl(fn.DevolverDatoQuery("SELECT PORCENTAJE/100 PORCENTAJE FROM FAR.ERP.RETENCIONES WHERE CODIGO_RETENCION=(SELECT TOP 1 RETENCION_1 FROM FAR.FAR.GLOBALES)"))
                    RCiva = CDbl(fn.DevolverDatoQuery("SELECT PORCENTAJE/100 PORCENTAJE FROM FAR.ERP.RETENCIONES WHERE CODIGO_RETENCION=(SELECT TOP 1 RETENCION_FISCAL FROM FAR.FAR.GLOBALES)"))
                    tipo = "A"
                Else
                    If tipoCompra = "E" Then
                        tipo = "E"
                        excento = subImporte
                    Else
                        ret1 = CDbl(fn.DevolverDatoQuery("SELECT PORCENTAJE/100 PORCENTAJE FROM FAR.ERP.RETENCIONES WHERE CODIGO_RETENCION=(SELECT TOP 1 RETENCION_1 FROM FAR.FAR.GLOBALES)"))
                        ret3 = CDbl(fn.DevolverDatoQuery("SELECT PORCENTAJE/100 PORCENTAJE FROM FAR.ERP.RETENCIONES WHERE CODIGO_RETENCION=(SELECT TOP 1 RETENCION_3 FROM FAR.FAR.GLOBALES)"))
                        tipo = "S"
                    End If
                End If
            End If

        Else
            credFisc = CDbl(fn.DevolverDatoQuery("SELECT PORCENTAJE/100 PORCENTAJE FROM FAR.ERP.RETENCIONES WHERE CODIGO_RETENCION=(SELECT TOP 1 RETENCION_FISCAL FROM FAR.FAR.GLOBALES)"))
            tipo = "F"
            excento = subImporte - (subImporte * impCredFisc / imp)

        End If

        If tipo = "A" Then
            subImporteR = subImporte / (1 - ret1 - ret2 - ret3 - RCiva)
            ret1 = subImporteR * ret1
            ret2 = subImporteR * ret2
            ret3 = subImporteR * ret3
            credFisc = subImporteR * credFisc
            RCiva = subImporteR * RCiva
        Else
            subImporteR = (subImporte - excento) / (1 - ret1 - ret2 - ret3)
            ret1 = subImporteR * ret1
            ret2 = subImporteR * ret2
            ret3 = subImporteR * ret3
            credFisc = subImporteR * credFisc
            RCiva = subImporteR * RCiva
        End If

        If fase <> "" Then
            proyecto = fn.DevolverDatoQuery(" SELECT TOP 1 PROYECTO FROM ERP.PROYECTO_PY WHERE CENTRO_COSTO='" & centroCosto & "'")
            fase = fase
        Else
            proyecto = ""
            fase = ""
        End If


        If idLinea = "" Then
            query = " INSERT INTO FAR.DOCS_FAR_LINEA(ID_DOCS_FAR,CENTRO_COSTO,CUENTA_CONTABLE ,IMPORTE,RETENCION_1,RETENCION_2,RETENCION_3,CREDITO_FISCAL,TIPO_COMPRA,ESTADO, PROYECTO, FASE, IMPORTE_R, EXCENTO,RC_IVA, DETALLE) VALUES"
            query += " ('" & idComp & "','" & centroCosto & "','" & cuentaContable & "'," & subImporte & "," & ret1 & "," & ret2 & "," & ret3 & ",'" & credFisc & "','" & tipo & "','N','" & proyecto & "','" & fase & "'," & subImporteR & "," & excento & "," & RCiva & ",'" & detalle & "')"


        Else
            query = " UPDATE FAR.DOCS_FAR_LINEA SET ID_DOCS_FAR='" & idComp & "',"
            query += " CENTRO_COSTO='" & centroCosto & "',"
            query += " CUENTA_CONTABLE='" & cuentaContable & "',"
            query += " IMPORTE='" & subImporte & "',"
            query += " RETENCION_1='" & ret1 & "',"
            query += " RETENCION_2='" & ret2 & "',"
            query += " RETENCION_3='" & ret3 & "',"
            query += " CREDITO_FISCAL='" & credFisc & "',"
            query += " TIPO_COMPRA='" & tipo & "',"
            query += " ESTADO='N',"
            query += " PROYECTO='" & proyecto & "',"
            query += " FASE='" & fase & "',"
            query += " IMPORTE_R='" & subImporteR & "',"
            query += " EXCENTO='" & excento & "',"
            query += " RC_IVA='" & RCiva & "',"
            query += " DETALLE='" & detalle & "'"
            query += " WHERE ID='" & idLinea & "'"
        End If




        Try

            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            customers.Add(New ListItem() With {
                          .Value = "error",
                          .Text = "error"
                        })


            Return customers
        End Try
        query = " SELECT IDENT_CURRENT( 'FARV2.FAR.DOCS_FAR_LINEA' )"
        Try
            idLinea = fn.DevolverDatoQuery(query)
        Catch ex As Exception
            customers.Add(New ListItem() With {
                          .Value = "error",
                          .Text = "error"
                        })


            Return customers
            Exit Function
        End Try

        If proyecto = "" Then
            proyecto = "-"
        End If

        customers.Add(New ListItem() With {
                          .Value = idLinea,
                          .Text = proyecto
                        })


        Return customers


    End Function

    <WebMethod()>
    Public Shared Function actualizarComprobante(idComp As String, nit As String, razonSocial As String, factura As String, codControl As String, nroAutoriza As String, fecha As String, importe As Double, importeCredFisc As Double, codRend As String, idARendir As String) As String
        Dim query As String
        Dim fn As New Funciones

        Dim excento As Double


        excento = importe - importeCredFisc


        query = " UPDATE FAR.DOCS_FAR SET NRO_COMPROBANTE='" & factura & "',CODIGO_CONTROL='" & codControl & "',PROVEEDOR='" & nit & "',PROVEEDOR_ALIAS='" & razonSocial & "'"
        query += ", NRO_AUTORIZA='" & nroAutoriza & "',FECHA='" & CDate(fecha).ToString("yyyy/MM/dd") & "',IMPORTE='" & importe & "',EXCENTO='" & excento & "',COD_CONTROL='M' WHERE ID = '" & idComp & "'"


        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return "error"
            Exit Function
        End Try

        Return "ok"
    End Function

    <WebMethod()>
    Public Shared Function actualizarLinea(idComp As String, nit As String, razonSocial As String, factura As String, codControl As String, nroAutoriza As String, fecha As String, importe As Double, importeCredFisc As Double, codRend As String, idARendir As String) As String
        Dim query As String
        Dim fn As New Funciones

        Dim excento As Double


        excento = importe - importeCredFisc


        query = " UPDATE FAR.DOCS_FAR SET NRO_COMPROBANTE='" & factura & "',CODIGO_CONTROL='" & codControl & "',PROVEEDOR='" & nit & "',PROVEEDOR_ALIAS='" & razonSocial & "'"
        query += ", NRO_AUTORIZA='" & nroAutoriza & "',FECHA='" & CDate(fecha).ToString("yyyy/MM/dd") & "',IMPORTE='" & importe & "',EXCENTO='" & excento & "',COD_CONTROL='M' WHERE ID = '" & idComp & "'"


        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return "error"
            Exit Function
        End Try

        Return "ok"
    End Function

    <WebMethod()>
    Public Shared Function borrarComprobante(id As String) As String
        Dim query As String
        Dim fn As New Funciones
        query = " UPDATE FAR.DOCS_FAR SET COD_CONTROL='B' WHERE ID='" & id & "'"

        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return query
        End Try

        query = " UPDATE FAR.DOCS_FAR_LINEA SET COD_CONTROL='B' WHERE ID_DOCS_FAR='" & id & "'"

        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return query
        End Try

        Return "ok"
    End Function

    <WebMethod()>
    Public Shared Function borrarLinea(id As String) As String
        Dim query As String
        Dim fn As New Funciones
        query = " UPDATE FAR.DOCS_FAR_LINEA SET COD_CONTROL='B' WHERE ID='" & id & "'"

        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return query
        End Try



        Return "ok"
    End Function

    <WebMethod()>
    Public Shared Function generarRendicion(codRend As String, saldo As String) As String
        Dim query As String
        Dim fn As New Funciones





        query = " UPDATE FAR.RENDICION SET ESTADO='G', FECHA_IMPRESION=GETDATE(), SALDO='" & saldo & "'  WHERE CODIGO_RENDICION='" & codRend & "'"

        Try
            fn.ejecutarComandoSQL2(query)
        Catch ex As Exception
            Return query
        End Try


        Return "ok"
    End Function

#End Region












    <WebMethod()>
    Public Shared Function obtenerTablaComprobantes(codRend As String) As List(Of comprobante)

        Dim query As String
        query = " SELECT * FROM (SELECT A.ID, NRO_COMPROBANTE,CODIGO_CONTROL,PROVEEDOR,PROVEEDOR_ALIAS,NRO_AUTORIZA,CONVERT(nvarchar(30), FECHA , 103)FECHA,convert(numeric(9,2),round(IMPORTE,2,1)) IMPORTE, convert(numeric(9,2),round(EXCENTO,2,1)) EXCENTO, "
        query += " convert(numeric(9,2),round(ISNULL((SELECT SUM(C.IMPORTE) FROM FAR.DOCS_FAR_LINEA C"
        query += " WHERE C.ID_DOCS_FAR=A.ID"
        query += " AND C.COD_CONTROL<>'B'"
        query += " ),0),2,1))LINEAS"
        query += " FROM FAR.DOCS_FAR A JOIN FAR.RENDICION B On A.ID_RENDICION=B.ID"
        query += " WHERE B.CODIGO_RENDICION='" & codRend & "'"
        query += " And B.ESTADO ='N'"
        query += " AND B.COD_CONTROL<>'B'"
        query += " AND A.COD_CONTROL<>'B')VISTA"
        query += " ORDER BY IMPORTE-LINEAS DESC"

        Dim constr As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                Dim comprobantes As New List(Of comprobante)()
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        comprobantes.Add(New comprobante() With {
                            .id = sdr("ID").ToString(),
                            .nit = sdr("PROVEEDOR").ToString(),
                            .razonSocial = sdr("PROVEEDOR_ALIAS").ToString(),
                            .factura = sdr("NRO_COMPROBANTE").ToString(),
                            .codControl = sdr("CODIGO_CONTROL").ToString(),
                            .nroAutoriza = sdr("NRO_AUTORIZA").ToString(),
                            .fecha = sdr("FECHA").ToString(),
                            .importe = sdr("IMPORTE").ToString(),
                            .importeCredFisc = sdr("EXCENTO").ToString(),
                            .sumaLineas = sdr("LINEAS").ToString})
                    End While
                End Using
                con.Close()
                Return comprobantes
            End Using
        End Using

    End Function


    <WebMethod()>
    Public Shared Function obtenerTablaLineas(codRend As String) As List(Of lineas)

        Dim query As String
        query = " Select ID ID_A,"
        query += " CENTRO_COSTO CCO,"

        query += " CUENTA_CONTABLE CUC,"

        query += " TIPO_COMPRA TC,"

        query += " (Select CONCEPTO_VALE Concepto"
        query += " FROM FARV2.ERP.CONCEPTO_VALE B "
        query += " WHERE A.CUENTA_CONTABLE=B.CUENTA_CONTABLE "
        query += " And A.CENTRO_COSTO=B.CENTRO_COSTO) CCO_CUC,"

        query += " (Select DESCRIPCION "
        query += " FROM FARV2.ERP.CONCEPTO_VALE B "
        query += " WHERE A.CUENTA_CONTABLE=B.CUENTA_CONTABLE "
        query += " And A.CENTRO_COSTO=B.CENTRO_COSTO)CCO_CUC_DESC,"

        query += " ISNULL ((Select DESCRIPCION FROM FARV2.ERP.PROYECTO_PY B WHERE a.PROYECTO=b.PROYECTO),'')PROY,"

        query += " ISNULL(FASE,'')FASE,"
        query += " ISNULL ((SELECT NOMBRE FROM FARV2.ERP.FASE_PY B WHERE B.FASE=A.FASE and a.PROYECTO=b.PROYECTO),'')FASE_DESC,"

        query += " convert(numeric(9,2),round(IMPORTE,2,1)) IMPORTE,"

        query += " (SELECT DESCRIPCION "
        query += " FROM FARV2.FAR.TIPO_COMPRA B"
        query += " WHERE B.TIPO_COMPRA=A.TIPO_COMPRA)TC_DESC,"

        query += " DETALLE DET"

        query += " FROM FARV2.FAR.DOCS_FAR_LINEA A"
        query += " WHERE ID_DOCS_FAR='" & codRend & "' AND COD_CONTROL<>'B'"

        Dim constr As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                Dim lineas As New List(Of lineas)()
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        lineas.Add(New lineas() With {
                            .id = sdr("ID_A").ToString(),
                            .CENTRO_COSTO = sdr("CCO").ToString(),
                            .CUENTA_CONTABLE = sdr("CUC").ToString(),
                            .TIPO_COMPRA = sdr("TC").ToString(),
                            .CONCEPTO_VALE = sdr("CCO_CUC").ToString(),
                            .CONCEPTO_VALE_DESC = sdr("CCO_CUC_DESC").ToString(),
                            .PROYECTO = sdr("PROY").ToString(),
                            .FASE = sdr("FASE").ToString(),
                            .FASE_DESC = sdr("FASE_DESC").ToString(),
                            .IMPORTE = sdr("IMPORTE").ToString(),
                            .TIPO_COMPRA_DESC = sdr("TC_DESC").ToString(),
                            .DETALLE = sdr("DET").ToString()})
                    End While
                End Using
                con.Close()
                Return lineas
            End Using
        End Using

    End Function

    <WebMethod()>
    Public Shared Function obtenerTablaReporte(codRend As String) As List(Of comprobante)

        Dim query As String
        query = " SELECT ROW_NUMBER() OVER(ORDER BY E_ID ASC) AS ID,"
        query += " CONVERT(nvarchar(30), D_FECHA , 103)D_FECHA,"
        query += " D_NRO_COMPROBANTE,"
        query += " D_NRO_AUTORIZA,"
        query += " D_CODIGO_CONTROL,"
        query += " D_PROVEEDOR_ALIAS,"
        query += " E_DETALLE,"
        query += " convert(numeric(9,2),round(E_IMPORTE,2,1)) E_IMPORTE"
        query += " FROM FAR.DETALLE"
        query += " WHERE C_CODIGO_RENDICION='" & codRend & "'"
        query += " AND B_COD_CONTROL<>'B'"
        query += " AND C_COD_CONTROL<>'B'"
        query += " AND D_COD_CONTROL<>'B'"
        query += " AND E_COD_CONTROL<>'B'"


        Dim constr As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(query)
                Dim comprobantes As New List(Of comprobante)()
                cmd.CommandType = CommandType.Text
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        comprobantes.Add(New comprobante() With {
                            .id = sdr("ID").ToString(),
                            .fecha = sdr("D_FECHA").ToString(),
                            .factura = sdr("D_NRO_COMPROBANTE").ToString(),
                            .nroAutoriza = sdr("D_NRO_AUTORIZA").ToString(),
                            .codControl = sdr("D_CODIGO_CONTROL").ToString(),
                            .razonSocial = sdr("D_PROVEEDOR_ALIAS").ToString(),
                            .nit = sdr("E_DETALLE").ToString(),
                            .importe = sdr("E_IMPORTE").ToString()})
                    End While
                End Using
                con.Close()
                Return comprobantes
            End Using
        End Using

    End Function

End Class
