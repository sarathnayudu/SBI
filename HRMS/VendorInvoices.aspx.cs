using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using BusinessLogic;
using System.Configuration;
using System.Net.Mail;


public partial class VendorInvoices : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindVendInvoice();
        }
        lblMsg.Visible = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (hdnInvID.Value != "")
            oBll.InvoiceID = new Guid(hdnInvID.Value);
        else
            oBll.InvoiceID = null;
        if (Session["VendID"] != null)
        {
            oBll.CustID = new Guid(Session["VendID"].ToString());
            oBll.InvAmnt = Convert.ToDecimal(txtInvAmnt.Text);
            oBll.ConsultName = txtConsultName.Text;
            oBll.StartDate = Convert.ToDateTime(txtStartDate.Text);
            oBll.EndDate = Convert.ToDateTime(txtEndDate.Text);
            oBll.InvPath = UploadFile(FileUpload1);
            if (oBll.InvPath == "")
            {
                oBll.InvPath = hdnAttach.Value;
            }
            lblMsg.Text = oBll.InsOrUpdtVendInvoice();
            string strBody = null;
            if (Session["VendName"] != null)
            {
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"><b>Invoice has been submitted by the vendor:</b>" + Session["VendName"].ToString() + "</td> </tr>" +

                    "<tr align=\"left\"> <td >Invoice Amount:</td> <td>" +txtInvAmnt.Text  + "</td></tr>" +
                    "<tr align=\"left\"> <td >Consultant Name:</td> <td>" +txtConsultName.Text  + "</td></tr>" +
                    "<tr align=\"left\"> <td >Start Date:</td> <td>" + txtStartDate.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >End Date:</td> <td>" + txtEndDate.Text + "</td></tr>" +
                    "</table>";
            }


            if (Session["FromEmailID"] != null)
            {
                string strFromEmail = Session["FromEmailID"].ToString();
                string strToEmail = Session["ToEmail"].ToString();
                string strPass = Session["Pass"].ToString();
                string strSmtpHost = Session["SmtpHost"].ToString();
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                string strSubject = "Invoice submitted by the vendor:" + Session["VendName"].ToString();
                SendMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);
               
            }
            lblMsg.Visible = true;
            BindVendInvoice();
            Reset();
        }

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private string UploadFile(FileUpload flFile)
    {
        string strVendInvPath = "";
        if (flFile.HasFile)
        {
            try
            {
                string vendInvFile = Session["VendID"].ToString() + "-" + flFile.FileName;
                oBll.CustID = new Guid(Session["VendID"].ToString());
                oBll.GetOrgVendors();
                Session["VendName"] = oBll.VendorName.ToString();
                if (Session["VendName"] != null)
                {
                    if (!Directory.Exists(Server.MapPath("~/VendorDocs/" + Session["VendName"].ToString())))
                        Directory.CreateDirectory(Server.MapPath("~/VendorDocs/" + Session["VendName"].ToString()));
                    string SaveLocation = Server.MapPath("~/VendorDocs") + "/" + Session["VendName"].ToString() + "/" + vendInvFile;
                    FileUpload1.SaveAs(SaveLocation);
                    strVendInvPath = "~/VendorDocs/" + Session["VendName"].ToString() + "/" + vendInvFile;
                }
            }
            catch (Exception ex)
            {
            }

        }        
        return strVendInvPath;
    }

    protected void gvVendInvoice_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {

            Label lblInvID = (Label)gvVendInvoice.Rows[e.NewSelectedIndex].FindControl("lblInvID");
            Label lblInvAmnt = (Label)gvVendInvoice.Rows[e.NewSelectedIndex].FindControl("lblInvAmnt");
            Label lblConsultName = (Label)gvVendInvoice.Rows[e.NewSelectedIndex].FindControl("lblConsultName");
            Label lblStartDate = (Label)gvVendInvoice.Rows[e.NewSelectedIndex].FindControl("lblStartDate");
            Label lblEndDate = (Label)gvVendInvoice.Rows[e.NewSelectedIndex].FindControl("lblEndDate");
            Label lblInvPath = (Label)gvVendInvoice.Rows[e.NewSelectedIndex].FindControl("lblInvPath");
            hdnInvID.Value = lblInvID.Text;
            txtInvAmnt.Text = lblInvAmnt.Text;
            txtConsultName.Text = lblConsultName.Text;
            txtStartDate.Text = lblStartDate.Text;
            txtEndDate.Text = lblEndDate.Text;
            hdnAttach.Value = lblInvPath.Text;
            btnSave.Text = "Update";

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvVendInvoice_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblInvPath = (Label)e.Row.FindControl("lblInvPath");
                string[] strInvPath = lblInvPath.Text.Split('-');
                lblInvPath.Text = strInvPath[strInvPath.Length-1];

            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }

    }

    private void BindVendInvoice()
    {
        oBll.InsCertID = null;
        if (Session["VendID"] != null)
            oBll.CustID = new Guid(Session["VendID"].ToString());

        oBll.GetVendInvoice();
        gvVendInvoice.DataSource = oBll.oDsVendInvoice;
        gvVendInvoice.DataBind();
    }

    private void Reset()
    {
        txtStartDate.Text = "";
        txtEndDate.Text = "";
        txtInvAmnt.Text = "";
        txtConsultName.Text = "";
    }

    private void SendMail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject,string strSmtpHost,int iSmtpPort)
    {
        MailMessage Mail = new MailMessage();
        MailAddress MailAdd = new MailAddress(strFromEmail, strFromEmail, System.Text.Encoding.UTF8);
        Mail.From = MailAdd;
        Mail.To.Add(strToEmail);

        Mail.Subject = strSubject;
        Mail.SubjectEncoding = System.Text.Encoding.UTF8;
        Mail.Body = strBody;
        Mail.BodyEncoding = System.Text.Encoding.UTF8;
        Mail.IsBodyHtml = true;
        Mail.Priority = MailPriority.High;

        if (FileUpload1.HasFile)
        {
            Mail.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileUpload1.FileName));
        }

        SmtpClient smtpmailobject = new SmtpClient(strSmtpHost, iSmtpPort);
        smtpmailobject.DeliveryMethod = SmtpDeliveryMethod.Network;
        //smtpmailobject.EnableSsl = true;

        smtpmailobject.UseDefaultCredentials = false;
        smtpmailobject.Credentials = new System.Net.NetworkCredential(strFromEmail, strPass);
        try
        {
            smtpmailobject.Send(Mail);
        }
        catch (Exception exc)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>" + exc.Message + "</script>");
        }
    }

}