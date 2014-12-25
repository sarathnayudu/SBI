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

public partial class InsuranceCertificate : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindVendInsCert();
        }
        lblMsg.Visible = false;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (hdnInsID.Value != "")
            oBll.InsCertID = new Guid(hdnInsID.Value);
        else
            oBll.InsCertID = null;
        if (Session["VendID"] != null)
        {
            oBll.CustID = new Guid(Session["VendID"].ToString());
            oBll.EndDate = Convert.ToDateTime(txtEffectEndDate.Text);
            oBll.CertPath = UploadFile(FileUpload1);
            if (oBll.CertPath == "")
            {
                oBll.CertPath = hdnAttach.Value;
            }
            lblMsg.Text = oBll.InsOrUpdtVendInsCertificate();
            string strBody = null;
            if (Session["VendName"] != null)
            {
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"><b>Insurance Certificate has been submitted by the vendor: </b>" + Session["VendName"].ToString() + "</td> </tr>" +

                    "<tr align=\"left\"> <td width='150'>Effective End Date:</td> <td>" + txtEffectEndDate.Text + "</td></tr>" +                    
                    
                    "</table>";
            }

            if (Session["FromEmailID"] != null)
            {
                string strFromEmail = Session["FromEmailID"].ToString();
                string strToEmail = Session["ToEmail"].ToString();
                string strPass = Session["Pass"].ToString();
                string strSmtpHost = Session["SmtpHost"].ToString();
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                string strSubject = "Insurance Certificate submitted by the vendor:" + Session["VendName"].ToString();
                SendMail(strFromEmail, strToEmail, strPass, strBody, strSubject,strSmtpHost,iSmtpPort);
                
            }
            lblMsg.Visible = true;
            BindVendInsCert();
            Reset();
        }    
        
    }

    private string UploadFile(FileUpload flFile)
    {
        string strInsCertPath = "";
        if (flFile.HasFile)
        {
            try
            {
                string insCertFile = Session["VendID"].ToString() + "-" + flFile.FileName;
                oBll.CustID = new Guid(Session["VendID"].ToString());
                oBll.GetOrgVendors();
                Session["VendName"] = oBll.VendorName.ToString();                
                if (Session["VendName"] != null)
                {
                    if (!Directory.Exists(Server.MapPath("~/VendorDocs/" + Session["VendName"].ToString())))
                        Directory.CreateDirectory(Server.MapPath("~/VendorDocs/" + Session["VendName"].ToString()));
                    string SaveLocation = Server.MapPath("~/VendorDocs") + "/" + Session["VendName"].ToString() + "/" + insCertFile;
                    FileUpload1.SaveAs(SaveLocation);
                    strInsCertPath = "~/VendorDocs/" + Session["VendName"].ToString() + "/" + insCertFile;
                }
            }
            catch (Exception ex)
            {
            }

        }
       
        return strInsCertPath;
    }

    protected void gvInsCert_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {

            Label lblInsID = (Label)gvInsCert.Rows[e.NewSelectedIndex].FindControl("lblInsID");
            Label lblEndDate = (Label)gvInsCert.Rows[e.NewSelectedIndex].FindControl("lblEndDate");
            Label lblCertifpath = (Label)gvInsCert.Rows[e.NewSelectedIndex].FindControl("lblCertifpath");            
            hdnInsID.Value = lblInsID.Text;
            txtEffectEndDate.Text = lblEndDate.Text;
            hdnAttach.Value = lblCertifpath.Text;            
            btnSave.Text = "Update";
            btnSave.Visible = true;

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvInsCert_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblCertifpath = (Label)e.Row.FindControl("lblCertifpath");
                string[] strCertPath = lblCertifpath.Text.Split('-');
                lblCertifpath.Text = strCertPath[strCertPath.Length - 1];

            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private void BindVendInsCert()
    {
        oBll.InsCertID = null;
        if (Session["VendID"] != null)
            oBll.CustID = new Guid(Session["VendID"].ToString());
        
        oBll.GetVendInsCertificate();
        if (oBll.oDsVendInsCert.Tables[0].Rows.Count > 0)
        {
            btnSave.Visible = false;
            btnReset.Visible = false;
        }
        else
        {
            btnSave.Visible = true;
            btnReset.Visible = true;
        }
        gvInsCert.DataSource = oBll.oDsVendInsCert;
        gvInsCert.DataBind();
    }

    private void Reset()
    {
        txtEffectEndDate.Text = "";
    }

    private void SendMail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject, string strSmtpHost, int iSmtpPort)
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