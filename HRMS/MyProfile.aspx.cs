using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using BusinessLogic;

public partial class MyProfile : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {       
        lblMsg.Text = "";
        if (!Page.IsPostBack)
        {
            BindState();
            BindUserDetail();
        }       
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {
            if (hdnEmpID.Value != "")
                oBll.OrgEmpId = new Guid(hdnEmpID.Value);
            else
            {
                oBll.OrgEmpId = null;
            }
            if (hdnOrgRoleID.Value != "")
                oBll.OrgRoleID = new Guid(hdnOrgRoleID.Value);
           
             oBll.HiredDate = Convert.ToDateTime(hdnHiredDate.Value);
            oBll.OrgEmpCode = txtIBSID.Text;
            oBll.FirstName = txtFName.Text;
            oBll.MiddleName = txtMName.Text;
            oBll.LastName = txtLName.Text;
            oBll.Prefix = Convert.ToString(ddlPrefix.SelectedValue);
            oBll.CellPhone = txtCellphone.Text;
            oBll.HomePhone = txtHomePhone.Text;
            oBll.BuisinessPhone = txtBusPhone.Text;
            if (txtExt.Text != "")
                oBll.BuisinessPhone = oBll.BuisinessPhone + "-" + txtExt.Text;
            oBll.EmailID = txtEMail.Text;
            oBll.AltContactEmailAddress = txtAltEmail.Text;
            // oBll.FaxNumber = txtFax.Text;
            oBll.Status = Convert.ToByte(ddlStatus.SelectedValue);
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;

            oBll.Address1 = txtAddress1.Text;
            oBll.Address2 = txtAddress2.Text;
            oBll.City = txtCity.Text;
            if (ddlState.SelectedIndex != 0)
                oBll.State = ddlState.SelectedItem.Value;
            else
                oBll.State = null;

            oBll.PostalCode = txtZip.Text;
            oBll.AddressPers1 = txtPAddrss1.Text;
            oBll.AddressPers2 = txtpAddress2.Text;
            oBll.CityPers = txtpCity.Text;
            if (ddlPState.SelectedIndex != 0)
                oBll.StatePers = ddlPState.SelectedItem.Value;
            else
                oBll.StatePers = null;
            oBll.PostalCodePers = txtPZip.Text;
            oBll.JobTitle = txtJobTitle.Text;
            oBll.LoginPassword = txtPassword.Text;
            
            lblMsg.Text = oBll.InsOrUpdtOrgEmployees();
            if (hdnEmailID.Value != txtEMail.Text || hdnAltEmailID.Value != txtAltEmail.Text || hdnAddr1.Value != txtAddress1.Text || hdnAddr2.Value != txtAddress2.Text || hdnCity.Value != txtCity.Text ||
                hdnState.Value != ddlState.SelectedValue || hdnZip.Value != txtZip.Text || hdnPAddr1.Value != txtPAddrss1.Text || hdnPAddr2.Value != txtpAddress2.Text
                || hdnPCity.Value != txtpCity.Text || hdnPState.Value != ddlPState.SelectedValue || hdnPZip.Value != txtPZip.Text || hdnCellphoneNo.Value != txtCellphone.Text
                || hdnBusPhone.Value != txtBusPhone.Text || hdnPHomePhone.Value != txtHomePhone.Text)
            {
                string strState = "",strPState="";
                if (ddlState.SelectedIndex != 0)
                    strState = ddlState.SelectedItem.Text;
                if (ddlPState.SelectedIndex != 0)
                    strPState = ddlPState.SelectedItem.Text;
                string strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                        "<tr align=\"left\"> <td colspan=\"2\"><b> Profile Has been updated by </b>" + Session["UserName"].ToString() + "</td> </tr>" +
                        "<tr align=\"left\"> <td ><b>Personal Info:-</b></td> <td></td></tr>" +
                        "<tr align=\"left\"> <td >Email ID:</td> <td>" + txtEMail.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Alternate Email ID:</td> <td>" + txtAltEmail.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Cellphone Number:</td> <td>" + txtCellphone.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td ><b>Business Contact Info:-</b></td> <td></td></tr>" +
                        "<tr align=\"left\"> <td >Address1:</td> <td>" + txtAddress1.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Address2:</td> <td>" + txtAddress2.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >City:</td> <td>" + txtCity.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >State:</td> <td>" + strState + "</td></tr>" +
                        "<tr align=\"left\"> <td >Zipcode:</td> <td>" + txtZip.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Business Phone:</td> <td>" + txtBusPhone.Text + "</td></tr>" +
                         "<tr align=\"left\"> <td ><b>Personal Contact Info:-</b></td> <td></td></tr>" +
                        "<tr align=\"left\"> <td >Address1:</td> <td>" + txtPAddrss1.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Address2:</td> <td>" + txtpAddress2.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >City:</td> <td>" + txtpCity.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >State:</td> <td>" + strPState + "</td></tr>" +
                        "<tr align=\"left\"> <td >Zipcode:</td> <td>" + txtPZip.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Home Phone:</td> <td>" + txtHomePhone.Text + "</td></tr>" +
                        "</table>";
                if (Session["FromEmailID"] != null)
                {
                    string strFromEmail = Session["FromEmailID"].ToString();
                    string strToEmail = Session["ToEmail"].ToString();
                    string strPass = Session["Pass"].ToString();
                    string strSmtpHost = Session["SmtpHost"].ToString();
                    int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                    string strSubject = "Profile updated by " + Session["UserName"].ToString();
                    SendUpdateMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);
                }
            }
            lblMsg.Visible = true; 

        }
    }



    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void btnResetBuss_Click(object sender, EventArgs e)
    {
        Reset();

    }
    protected void btnResetPer_Click(object sender, EventArgs e)
    {
        Reset();

    }
    protected void btnResetProff_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private void BindUserDetail()
    {
        try
        {
            if (Session["UserID"] != null)
            {
                oBll.OrgEmpCode = Session["UserID"].ToString();
                oBll.GetUserDetail();
                txtIBSID.Text = oBll.OrgEmpCode;
                txtFName.Text = oBll.FirstName;
                txtMName.Text = oBll.MiddleName;
                txtLName.Text = oBll.LastName;
                ddlPrefix.SelectedValue = oBll.Prefix;
                hdnCellphoneNo.Value = txtCellphone.Text = oBll.CellPhone;
                hdnPHomePhone.Value = txtHomePhone.Text = oBll.HomePhone;
                string[] strPhone = oBll.BuisinessPhone.Split('-');
                hdnBusPhone.Value = txtBusPhone.Text = strPhone[0];
                if (strPhone.Length > 1)
                    txtExt.Text = strPhone[1];

                hdnEmailID.Value = txtEMail.Text = oBll.EmailID;
                hdnAltEmailID.Value = txtAltEmail.Text = oBll.AltContactEmailAddress;
                ddlStatus.SelectedValue = oBll.Status.ToString();

                hdnAddr1.Value = txtAddress1.Text = oBll.Address1;
                hdnAddr2.Value = txtAddress2.Text = oBll.Address2;
                hdnCity.Value = txtCity.Text = oBll.City;
                
                if (oBll.State != "")
                {
                    ddlState.SelectedValue = oBll.State;

                }
                else
                    ddlState.SelectedIndex = 0;
                hdnState.Value = ddlState.SelectedValue;
                hdnZip.Value = txtZip.Text = oBll.PostalCode;

                hdnPAddr1.Value = txtPAddrss1.Text = oBll.AddressPers1;
                hdnPAddr2.Value = txtpAddress2.Text = oBll.AddressPers2;
                hdnPCity.Value = txtpCity.Text = oBll.CityPers;

                if (oBll.StatePers != "")
                    ddlPState.SelectedValue = oBll.StatePers;
                else
                    ddlPState.SelectedIndex = 0;
                hdnPState.Value = ddlPState.SelectedValue;
                hdnPZip.Value = txtPZip.Text = oBll.PostalCodePers;
                txtJobTitle.Text = oBll.JobTitle;
                txtPassword.Attributes["value"] = oBll.LoginPassword;
                // txtPassword.Text = oBll.LoginPassword;

                hdnEmpID.Value = oBll.OrgEmpId.ToString();
                hdnOrgRoleID.Value = oBll.OrgRoleID.ToString();
                hdnHiredDate.Value = oBll.HiredDate.ToString();
            }
        }
        catch (Exception ex)
        {
        }
    }

    private void BindState()
    {
        DataSet oDsDepartment,oDsStates;
        oDsDepartment  = oBll.GetStates();
        oDsStates = oBll.GetStates();
        ListItem lstState = new ListItem("Select", "0");
        ListItem lstStatePer = new ListItem("Select", "0");
        ddlState.Items.Insert(0, lstState);
        ddlPState.Items.Insert(0, lstStatePer);
        ddlState.DataTextField = "State";
        ddlPState.DataTextField = "State";
        ddlState.DataValueField  = "StateID";
        ddlPState.DataValueField = "StateID";
        ddlState.DataSource = oDsDepartment;
        ddlPState.DataSource = oDsStates;
        ddlState.DataBind();
        ddlPState.DataBind();
    }

    private void Reset()
    {
        txtIBSID.Text = "";
        txtFName.Text = "";
        txtMName.Text = "";
        txtLName.Text = "";
        txtEMail.Text = "";
        txtAltEmail.Text = "";
        txtCellphone.Text = "";
        txtHomePhone.Text = "";
        txtBusPhone.Text = "";
        txtExt.Text = "";
        ddlStatus.SelectedIndex = 0;
        ddlPrefix.SelectedIndex = 0;

        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtCity.Text = "";
        ddlState.SelectedIndex = 0;
        txtZip.Text = "";

        txtPAddrss1.Text = "";
        txtpAddress2.Text = "";
        txtpCity.Text = "";
        ddlPState.SelectedIndex = 0;
        txtPZip.Text = "";

        txtJobTitle.Text = "";
        txtPassword.Text = "";
        
    }

    private void SendUpdateMail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject,string strSmtpHost,int iSmtpPort)
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