using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Configuration;
using BusinessLogic;

public partial class EmailSetting : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            oBll.GetEmail();
            if (oBll.oDsEmail.Tables[0].Rows.Count > 0)
            {
                txtFrmEmailID.Text = oBll.oDsEmail.Tables[0].Rows[0]["From_Email"].ToString();
                txtPassword.Attributes["value"] = oBll.oDsEmail.Tables[0].Rows[0]["Password"].ToString();
                txtMultipleEmails.Text = oBll.oDsEmail.Tables[0].Rows[0]["To_Emails"].ToString();
                txtSmtpHost.Text = oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Host"].ToString();
                txtSmtpPort.Text = oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Port"].ToString();
                hdnID.Value = oBll.oDsEmail.Tables[0].Rows[0]["ID"].ToString();
                Session["fromemail"] = "true";
            }
            else
                Session["fromemail"] = null;
        }

    }
    protected void btnSaveEmails_Click(object sender, EventArgs e)
    {
        //Configuration connectionConfiguration = WebConfigurationManager.OpenWebConfiguration("~");
        //connectionConfiguration.AppSettings.Settings.Remove("FromEmail");
        //connectionConfiguration.AppSettings.Settings.Remove("Password");
        //connectionConfiguration.AppSettings.Settings.Add("FromEmail", txtFrmEmailID.Text);
        //connectionConfiguration.AppSettings.Settings.Add("Password", txtPassword.Text);
        //connectionConfiguration.Save(ConfigurationSaveMode.Modified);
        //ConfigurationManager.RefreshSection("connectionStrings");
        if (hdnID.Value != "")
            oBll.ID = new Guid(hdnID.Value);
        else
            oBll.ID = null;
        oBll.FrmEmail = txtFrmEmailID.Text;
        oBll.Password = txtPassword.Text;
        oBll.ToEmails = txtMultipleEmails.Text;
        oBll.SmtpHost = txtSmtpHost.Text;
        oBll.SmtpPort = Convert.ToInt32(txtSmtpPort.Text);
        oBll.InsOrUpdtEmail("fromemail");
        lblMsg.Visible = true;
        lblMsg.Text = "From email details updated successfully";
    }
    protected void btnToEmail_Click(object sender, EventArgs e)
    {
        //Configuration connectionConfiguration = WebConfigurationManager.OpenWebConfiguration("~");
        //connectionConfiguration.AppSettings.Settings.Remove("ToEmail");
        //connectionConfiguration.AppSettings.Settings.Add("ToEmail",txtMultipleEmails.Text);
        //connectionConfiguration.Save(ConfigurationSaveMode.Modified);
        //ConfigurationManager.RefreshSection("connectionStrings");
        if (Session["fromemail"] != null)
        {
            if (Session["fromemail"] == "true")
            {
                if (hdnID.Value != "")
                    oBll.ID = new Guid(hdnID.Value);
                else
                    oBll.ID = null;
                oBll.FrmEmail = txtFrmEmailID.Text;
                oBll.Password = txtPassword.Text;
                oBll.ToEmails = txtMultipleEmails.Text;
                oBll.InsOrUpdtEmail("toemail");
                lblMsg.Visible = true;
                lblMsg.Text = "To email details updated successfully";
            }
            else
                lblMsg.Text = "Please set from email details first";
        }
       
    }
    protected void btnResetEmails_Click(object sender, EventArgs e)
    {
        txtFrmEmailID.Text = "";
        txtPassword.Text = "";
        lblMsg.Text = "";
    }

    protected void btnResetToEmail_Click(object sender, EventArgs e)
    {
        txtMultipleEmails.Text = "";
        lblMsg.Text = "";
    }
   
}