using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Net.Mail;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
      
      if (!IsPostBack)
      {
          //if (Request.Cookies["remPassLogin"] != null)
          //{
          //    HttpCookie getCookie = Request.Cookies.Get("remPassLogin");
          //    txtUserID.Text = getCookie.Values["userid"].ToString();
          //    string pass = getCookie.Values["password"].ToString();
          //    txtPassword.Text = pass;             
              
          //}
      }       

    }
    protected void imgBtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        oBll.EmailID = txtUserID.Text;
        oBll.LoginPassword = txtPassword.Text;
        
            string[] strMsg = oBll.CheckLogin().Split('-');
        oBll.GetEmail();
        if (oBll.oDsEmail.Tables[0].Rows.Count > 0)
        {
            Session["FromEmailID"] = oBll.oDsEmail.Tables[0].Rows[0]["From_Email"].ToString();
            Session["Pass"] = oBll.oDsEmail.Tables[0].Rows[0]["Password"].ToString();
            Session["SmtpHost"] = oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Host"].ToString();
            Session["SmtpPort"] = oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Port"].ToString();
            Session["ToEmail"] = oBll.oDsEmail.Tables[0].Rows[0]["To_Emails"].ToString().Replace("\r\n","");
        }
            if (strMsg[0] == "valid")
            {
                lblMsg.Text = "";
                Session["UserID"] = strMsg[1];
                Response.Redirect("~/HRMS.aspx");
            }
            else
            {
                string[] strMsg1 = oBll.CheckVendorLogin().Split(',');
                string[] strMsg2=strMsg1[0].Split('-');
                if (strMsg2[0] == "valid")
                {
                    lblMsg.Text = "";
                    Session["UserID"] = strMsg2[1];
                    Session["VendID"] = strMsg1[1];
                    Response.Redirect("~/VendorPage.aspx");
                }
                else
                    lblMsg.Text = strMsg1[0];
            }
        
    }

    protected void btnForgotPass_CLick(object sender, EventArgs e)
    {
        try
        {
            oBll.GetEmail();
            if (oBll.oDsEmail.Tables[0].Rows.Count > 0)
            {
                string strFromEmailID = oBll.oDsEmail.Tables[0].Rows[0]["From_Email"].ToString();
                string strPass = oBll.oDsEmail.Tables[0].Rows[0]["Password"].ToString();
                string strToEmailID = txtEmailID.Text;
                string strSmtpHost = oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Host"].ToString();
                int iSmtpPort = Convert.ToInt32(oBll.oDsEmail.Tables[0].Rows[0]["Smtp_Port"].ToString());
                Sendmail(strFromEmailID,strPass, strToEmailID,strSmtpHost,iSmtpPort);
            }
        }    
        

        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Display Error", "<script language=\"javascript\">alert(" + Ex.Message + ");</script>", true);

        }
    }

    #region "Methods"
    private void Sendmail(string strFromEmailID, string strPass, string strToEmailID, string strSmtpHost, int iSmtpPort)
    {
        try
        {

            oBll.EmailID = txtEmailID.Text;
            string strMsg = oBll.ChangeForgotPassword();
            if (strMsg != "NotValid")
            {
                string mailBody;


                mailBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +
                   "<tr align=\"center\" ><td colspan=\"2\">" +
               "<table >" +
                     "<tr align=\"left\"> <td align=\"center\" colspan=\"2\"><b> Request For Password</b> </td> </tr>" +
                     "<tr align=\"left\"> <td colspan=\"2\">Your password is: " + strMsg + " </td> </tr>" +
               "</table>";
                MailMessage Mail = new MailMessage();
                MailAddress MailAdd = new MailAddress(strFromEmailID, strFromEmailID);
                Mail.From = MailAdd;
                Mail.To.Add(strToEmailID);
                Mail.Body = mailBody;
                Mail.IsBodyHtml = true;
                Mail.Subject = "From Intellectbusiness.com";
                Mail.Priority = MailPriority.High;

                SmtpClient smtpmailobject = new SmtpClient(strSmtpHost, iSmtpPort);
                smtpmailobject.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpmailobject.UseDefaultCredentials = false;
                smtpmailobject.Credentials = new System.Net.NetworkCredential(strFromEmailID, strPass);

                smtpmailobject.Send(Mail);

                lblMsgPass.Text = "Password successfully sent to your email-Id";
            }
            else
                lblMsgPass.Text = "Sorry! Your entered e-mail ID doesn't match with the existing one";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "doclick", "javascript:document.getElementById('lnkForgotPass').onclick();", true);
        }
        catch (Exception Ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DisplayError", "javascript:alert('" + Ex.Message + "');", true);
        }

    }

    private string RandomPassword()
    {
        Random rand = new Random();
        string passwordString = "";
        string generatedPassword = "";
        string temp = "";

        //Taking Values from configuaration file


        char[] lowerChars = ConfigurationManager.AppSettings["lowerChars"].ToCharArray();
        char[] upperChars = ConfigurationManager.AppSettings["upperChars"].ToCharArray();
        char[] Numbers = ConfigurationManager.AppSettings["numbers"].ToCharArray();
        char[] specialChar = ConfigurationManager.AppSettings["specialChars"].ToCharArray();
        //It Takes the minimum number of lower characters
        int minLowerChars = Convert.ToInt32(ConfigurationManager.AppSettings["minLowerChars"]);
        //It Takes the minimum number of upper characters
        int minUpperChars = Convert.ToInt32(ConfigurationManager.AppSettings["minUpperChars"]);
        //It Takes the minimum number of numbers 
        int minNumbers = Convert.ToInt32(ConfigurationManager.AppSettings["minNumbers"]);
        //It Takes the minimum number of special characters
        int minSpecialChars = Convert.ToInt32(ConfigurationManager.AppSettings["minSpecialChars"]);
        //It Takes the minimum length of password
        int maxLength = Convert.ToInt32(ConfigurationManager.AppSettings["maxLength"]);
        //It Takes the maximun length of password
        int minLength = Convert.ToInt32(ConfigurationManager.AppSettings["minLength"]);

        //Generate two Random lower case letters  from all lower case letters 

        for (int i = 0; i < minLowerChars; i++)
        {

            temp = lowerChars[rand.Next(0, lowerChars.Length)].ToString();
            passwordString += temp;
        }

        //Generate two Random upper case letters  from all upper case letters 

        for (int i = 0; i < minUpperChars; i++)
        {
            temp = upperChars[rand.Next(0, upperChars.Length)].ToString();
            passwordString += temp;
        }

        //Generate two Special Characters from all special characters 

        for (int i = 0; i < minSpecialChars; i++)
        {
            temp = specialChar[rand.Next(0, specialChar.Length)].ToString();
            passwordString += temp;
        }

        //Generate two Random numbers   from all numbers 

        for (int i = 0; i < minNumbers; i++)
        {
            temp = Numbers[rand.Next(0, Numbers.Length)].ToString();
            passwordString += temp;
        }
        //Generate password in between range only
        for (int i = 0; i < rand.Next(minLength, maxLength); i++)
        {
            temp = passwordString[rand.Next(0, passwordString.Length)].ToString();
            generatedPassword += temp;

        }
        return generatedPassword;
    }

   
    #endregion
}
