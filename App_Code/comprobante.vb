Imports Microsoft.VisualBasic

Public Class comprobante
    Public Property id() As String
        Get
            Return m_id
        End Get
        Set(value As String)
            m_id = value
        End Set
    End Property
    Private m_id As String

    Public Property nit() As String
        Get
            Return m_nit
        End Get
        Set(value As String)
            m_nit = value
        End Set
    End Property
    Private m_nit As String

    Public Property razonSocial() As String
        Get
            Return m_razonSocial
        End Get
        Set(value As String)
            m_razonSocial = value
        End Set
    End Property
    Private m_razonSocial As String

    Public Property factura() As String
        Get
            Return m_factura
        End Get
        Set(value As String)
            m_factura = value
        End Set
    End Property
    Private m_factura As String

    Public Property codControl() As String
        Get
            Return m_codControl
        End Get
        Set(value As String)
            m_codControl = value
        End Set
    End Property
    Private m_codControl As String

    Public Property nroAutoriza() As String
        Get
            Return m_nroAutoriza
        End Get
        Set(value As String)
            m_nroAutoriza = value
        End Set
    End Property
    Private m_nroAutoriza As String

    Public Property fecha() As String
        Get
            Return m_fecha
        End Get
        Set(value As String)
            m_fecha = value
        End Set
    End Property
    Private m_fecha As String

    Public Property importe() As String
        Get
            Return m_importe
        End Get
        Set(value As String)
            m_importe = value
        End Set
    End Property
    Private m_importe As String

    Public Property importeCredFisc() As String
        Get
            Return m_importeCredFisc
        End Get
        Set(value As String)
            m_importeCredFisc = value
        End Set
    End Property
    Private m_importeCredFisc As String

    Public Property sumaLineas() As String
        Get
            Return m_sumaLineas
        End Get
        Set(value As String)
            m_sumaLineas = value
        End Set
    End Property
    Private m_sumaLineas As String

End Class
