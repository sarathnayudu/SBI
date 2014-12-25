Imports System.Net.Mail
Imports System.Data.OleDb

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        

    End Sub

  
    Private Sub btnSendMail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendMail.Click
        Dim strExcelConnectiuon As String
        Dim oledbConn As OleDbConnection
        Dim cmd As OleDbCommand
        Dim oleda As OleDbDataAdapter
        Dim ds As DataSet
        Dim dr As DataRow

        Try

        


            strExcelConnectiuon = ConfigurationManager.ConnectionStrings("xlsx").ConnectionString 'ConfigurationManager.ConnectionStrings["xls"].ConnectionString;
            ' Create the connection object 
            oledbConn = New OleDbConnection(strExcelConnectiuon)
            ' Open connection
            oledbConn.Open()

            ' Create OleDbCommand object and select data from worksheet Sheet1
            cmd = New OleDbCommand("SELECT * FROM [Sheet1$]", oledbConn)

            ' Create new OleDbDataAdapter 
            oleda = New OleDbDataAdapter()

            oleda.SelectCommand = cmd

            ' Create a DataSet which will hold the data extracted from the worksheet.
            ds = New DataSet()



            ' Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(ds, "EmailList")


            For i = 0 To ds.Tables(0).Rows.Count
                dr = ds.Tables(0).Rows(i)


                Dim MyMailMessage As New MailMessage()

                'Start by creating a mail message object


                'From requires an instance of the MailAddress type
                MyMailMessage.From = New MailAddress(txtfromemail.Text)

                'To is a collection of MailAddress types
                MyMailMessage.To.Add(dr.Item(0).ToString)

                MyMailMessage.Subject = txtsubject.Text
                MyMailMessage.Body = FreeTextBox1.Text '"This is the test text for Gmail email"
                MyMailMessage.IsBodyHtml = True



                'Create the SMTPClient object and specify the SMTP GMail server
                Dim SMTPServer As New SmtpClient("smtp.gmail.com")
                SMTPServer.Port = 587

                SMTPServer.Credentials = New System.Net.NetworkCredential(txtgmail.Text, txtgmailpwd.Text)
                SMTPServer.EnableSsl = True

                Try
                    SMTPServer.Send(MyMailMessage)

                Catch ex As SmtpException
                Finally
                    MyMailMessage = Nothing

                End Try
            Next
        Catch ex As Exception
        Finally
            If Not ds Is Nothing Then
                ds.Dispose()
            End If

            oledbConn.Close()

        End Try

    End Sub

    Private Sub btnTimeWarner_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTimeWarner.Click
        'Start by creating a mail message object
        Dim MyMailMessage As New MailMessage()

        'From requires an instance of the MailAddress type
        MyMailMessage.From = New MailAddress(txtfromemail.Text)

        'To is a collection of MailAddress types
        MyMailMessage.To.Add(txttoemail.Text)

        MyMailMessage.Subject = txtsubject.Text
        MyMailMessage.Body = FreeTextBox1.Text '"This is the test text for Gmail email"
        MyMailMessage.IsBodyHtml = True
        'Create the SMTPClient object and specify the SMTP GMail server
        Dim SMTPServer As New SmtpClient("smtp-server.tx.rr.com")
        SMTPServer.Port = 587

        SMTPServer.Credentials = New System.Net.NetworkCredential("intellectbusinesssol@tx.rr.com", "5445myen4491")
        'SMTPServer.EnableSsl = True

        Try
            SMTPServer.Send(MyMailMessage)

        Catch ex As SmtpException

        End Try
    End Sub
End Class