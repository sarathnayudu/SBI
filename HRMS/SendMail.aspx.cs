using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data.OleDb;
using System.Data;
using System.Configuration;
using BusinessLogic;

public partial class SendMail : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        string strExcelConnectiuon = null;
        OleDbConnection oledbConn = default(OleDbConnection);
        OleDbCommand cmd = default(OleDbCommand);
        OleDbDataAdapter oleda = default(OleDbDataAdapter);
        DataSet ds = null;
        DataRow dr = null;


        try
        {

            strExcelConnectiuon = ConfigurationManager.ConnectionStrings["xlsx"].ConnectionString;
            //ConfigurationManager.ConnectionStrings["xls"].ConnectionString;
            // Create the connection object 
            oledbConn = new OleDbConnection(strExcelConnectiuon);
            // Open connection
            oledbConn.Open();

            // Create OleDbCommand object and select data from worksheet Sheet1
            cmd = new OleDbCommand("SELECT * FROM [Sheet1$]", oledbConn);

            // Create new OleDbDataAdapter 
            oleda = new OleDbDataAdapter();

            oleda.SelectCommand = cmd;

            // Create a DataSet which will hold the data extracted from the worksheet.
            ds = new DataSet();



            // Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(ds, "EmailList");
            if (txttoemail.Text != "")
            {
                DataTable oDt=ds.Tables[0].Clone();
                oDt.Rows.Add();
                oDt.Rows[0][0] = txttoemail.Text;
                DataRow oDr = oDt.Rows[0];
                ds.Tables[0].ImportRow(oDr);
            }

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                dr = ds.Tables[0].Rows[i];

                if (dr[0].ToString() != "")
                {
                    MailMessage MyMailMessage = new MailMessage();

                    //Start by creating a mail message object


                    //From requires an instance of the MailAddress type
                    MyMailMessage.From = new MailAddress(txtfromemail.Text);

                    //To is a collection of MailAddress types
                    MyMailMessage.To.Add(dr[0].ToString());

                    MyMailMessage.Subject = txtsubject.Text;
                    MyMailMessage.Body = FreeTextBox1.Text;
                    //"This is the test text for Gmail email"
                    MyMailMessage.IsBodyHtml = true;



                    //Create the SMTPClient object and specify the SMTP GMail server
                    SmtpClient SMTPServer = new SmtpClient("smtp.gmail.com");
                    SMTPServer.Port = 587;

                    SMTPServer.Credentials = new System.Net.NetworkCredential(txtgmail.Text, txtgmailpwd.Text);
                    SMTPServer.EnableSsl = true;

                    try
                    {
                        SMTPServer.Send(MyMailMessage);

                    }
                    catch (SmtpException ex)
                    {
                    }
                    finally
                    {
                        MyMailMessage = null;

                    }
                }
            }
        }
        catch (Exception ex)
        {
        }
        finally
        {
            if ((ds != null))
            {
                ds.Dispose();
            }

            oledbConn.Close();

        }
    }
    protected void btnSendMailEmp_Click(object sender, EventArgs e)
    {
        
         oBll.GetEmail();
         if (oBll.oDsEmail.Tables[0].Rows.Count > 0)
         {
             string strFromEmail = oBll.oDsEmail.Tables[0].Rows[0]["From_Email"].ToString();
             string strPass = oBll.oDsEmail.Tables[0].Rows[0]["Password"].ToString();
             string strSmtpHost = oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Host"].ToString();
             int iSmtpPort = Convert.ToInt32(oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Port"].ToString());
             string strSubject = txtsubject.Text;
             
             SendEmail(strFromEmail, "", strPass, FreeTextBox1.Text, strSubject,strSmtpHost,iSmtpPort);
         }
        
    }

    private void SendEmail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject, string strSmtpHost, int iSmtpPort)
    {
        oBll.OrgEmpId = null;
        oBll.GetOrgEmpDetails();
        string strBCC = "";
        MailMessage Mail = new MailMessage();
        MailAddress MailAdd = new MailAddress(strFromEmail, strFromEmail, System.Text.Encoding.UTF8);
        Mail.From = MailAdd;
        //Mail.To.Add("");
        for (int iRowCount = 0; iRowCount < oBll.oDsOrgEmpDetails.Tables[0].Rows.Count; iRowCount++)
        {
            if (oBll.oDsOrgEmpDetails.Tables[0].Rows[iRowCount]["Emp_EmailID"].ToString() != "")
            {
                if (strBCC == "")
                    strBCC = oBll.oDsOrgEmpDetails.Tables[0].Rows[iRowCount]["Emp_EmailID"].ToString();
                else
                    strBCC = strBCC + "," + oBll.oDsOrgEmpDetails.Tables[0].Rows[iRowCount]["Emp_EmailID"].ToString();
            }
        }
        if (txtCC.Text != "")
            Mail.CC.Add(txtCC.Text);     
        Mail.Bcc.Add(strBCC);
        Mail.Subject = strSubject;
        Mail.SubjectEncoding = System.Text.Encoding.UTF8;
        Mail.Body = strBody;
        Mail.BodyEncoding = System.Text.Encoding.UTF8;
        Mail.IsBodyHtml = true;
        Mail.Priority = MailPriority.High;        

        SmtpClient smtpmailobject = new SmtpClient(strSmtpHost,iSmtpPort);
        smtpmailobject.DeliveryMethod = SmtpDeliveryMethod.Network;
        //smtpmailobject.EnableSsl = true;

        smtpmailobject.UseDefaultCredentials = false;
        smtpmailobject.Credentials = new System.Net.NetworkCredential(strFromEmail, strPass);
        try
        {
            smtpmailobject.Send(Mail);
            lblMsg.Text = "Mail has been successfully sent to the employees";
            lblMsg.Visible = true;
        }
        catch (Exception exc)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>" + exc.Message + "</script>");
        }
    }
}
