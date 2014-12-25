using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using System.Configuration;
using BusinessLogic;
using System.IO;

public partial class MyTimeOff : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindTimeOffTypes();
            BindEmpTimeOff();
            if (Session["UserID"] != null)
            {
                Security(btnSave, btnReset, gvTimeOff);
            }
        }
        lblMsg.Visible = false;
    }
       

    protected void btnSave_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {
            if (hdnEmpTimeOffID.Value != "")
                oBll.EmpTimeOffTypeID = new Guid(hdnEmpTimeOffID.Value);
            else
                oBll.EmpTimeOffTypeID = null;
            if (Session["EmpID"] != null)
            {
                oBll.OrgEmpId =new Guid(Session["EmpID"].ToString());
                if (ddlTimeOffType.SelectedIndex != 0)
                    oBll.TimeOffTypeID = new Guid(ddlTimeOffType.SelectedItem.Value);
                oBll.StartDate = Convert.ToDateTime(txtStartDate.Text);
                oBll.EndDate = Convert.ToDateTime(txtEndDate.Text);
                oBll.AppStatus = lblAppStatus.Text;
                if(FileUpload1.HasFile==true)
                oBll.FileName = FileUpload1.FileName.ToString();
                oBll.FilePath = UploadFile(FileUpload1);
                if (oBll.FilePath == "" && hdnAttach.Value != "")
                {
                    oBll.FilePath = hdnAttach.Value;
                    oBll.FileName = hdnAttachName.Value;
                }
                oBll.Comments = txtComments.Text;
                oBll.CreatedBy = Session["createdBy"].ToString();
                oBll.CreatedDate = System.DateTime.Now;
                oBll.ModifiedBy = Session["modifiedBy"].ToString();
                oBll.ModifiedDate = System.DateTime.Now;
                string strBody = null;
                if (Session["UserName"] != null)
                {
                    strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                        "<tr align=\"left\"> <td colspan=\"2\"><b> The Time Off request has been submitted by </b>" + Session["UserName"].ToString() + " for the following dates</td> </tr>" +
                       
                        "<tr align=\"left\"> <td >Start Date:</td> <td>" + txtStartDate.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >End Date:</td> <td>" + txtEndDate.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Reason for Time Off:</td> <td>" + ddlTimeOffType.SelectedItem.Text + "</td></tr>" +
                        "<tr align=\"left\"> <td >Reason:</td> <td>" + txtComments.Text + "</td></tr>" +
                        "</table>";
                }
                lblMsg.Text = oBll.InsOrUpdtEmployeeTimeOff();
                if (Session["DSEmpDetails"] != null)
                {
                    oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];
                    if (Session["FromEmailID"] != null)
                    {
                        //string strFromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();
                        //string strToEmail = ConfigurationManager.AppSettings["ToEmail"].ToString();
                        //string strPass = ConfigurationManager.AppSettings["Password"].ToString();
                        string strFromEmail = Session["FromEmailID"].ToString();
                        string strToEmail = Session["ToEmail"].ToString();
                        string strPass = Session["Pass"].ToString();
                        string strSmtpHost = Session["SmtpHost"].ToString();
                        int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                        string strEmpEmailID = oBll.oDsEmpDetails.Tables[0].Rows[0]["Emp_EmailID"].ToString();
                        string strSubject = "Time Off submitted by " + Session["UserName"].ToString();
                        SendTimeOff(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort, strEmpEmailID);
                    }
                }
                lblMsg.Visible = true;
                BindEmpTimeOff();
                Reset();
                Security(btnSave, btnReset, gvTimeOff);
            }
        }
    }

    protected void gvTimeOff_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            
            Label lblStartDate = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblStartDate");
            Label lblEndDate = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblEndDate");
            Label lblTimeOffTypeID = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblTimeOffTypeID");
            Label lblFileName = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblFileName");
            Label lblFilePath = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblFilePath");
            Label lblEmpTimeOffID = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblEmpTimeOffID");
            Label lblStatus = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblStatus");
            Label lblComments = (Label)gvTimeOff.Rows[e.NewSelectedIndex].FindControl("lblComments");
            hdnEmpTimeOffID.Value = lblEmpTimeOffID.Text;
            txtStartDate.Text = lblStartDate.Text;
            txtEndDate.Text = lblEndDate.Text;
            lblAppStatus.Text = lblStatus.Text;
            hdnAttach.Value = lblFilePath.Text;
            txtComments.Text = lblComments.Text;
            hdnAttachName.Value = lblFileName.Text;
            if (lblTimeOffTypeID.Text != "")
                ddlTimeOffType.SelectedValue = lblTimeOffTypeID.Text;
            btnSave.Text = "Update";

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvTimeOff_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblEmpTimeOffID = (Label)gvTimeOff.Rows[e.RowIndex].FindControl("lblEmpTimeOffID");
        oBll.EmpTimeOffTypeID = new Guid(lblEmpTimeOffID.Text);
        oBll.DelEmployeeTimeOff();
        BindEmpTimeOff();
        Security(btnSave, btnReset, gvTimeOff);
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
        Security(btnSave, btnReset, gvTimeOff);

    }

    private string UploadFile(FileUpload flFile)
    {
        string strTimeOffPath = "";
         if (flFile.HasFile)
        {
            try
            {
                string timeOffFile = Session["UserID"].ToString() + Convert.ToDateTime(txtStartDate.Text).ToString("MMddyyyy") + " -" + Convert.ToDateTime(txtEndDate.Text).ToString("MMddyyyy") + "-" + flFile.FileName;
                if (Session["UserName"] != null)
                {
                    if (!Directory.Exists(Server.MapPath("~/TimeOff/" + Session["UserName"].ToString())))
                        Directory.CreateDirectory(Server.MapPath("~/TimeOff/" + Session["UserName"].ToString()));
                    string SaveLocation = Server.MapPath("~/TimeOff") + "/" + Session["UserName"].ToString() + "/" + timeOffFile;
                    FileUpload1.SaveAs(SaveLocation);
                    strTimeOffPath = "~/TimeOff/" + Session["UserName"].ToString() + "/" + timeOffFile;
                }
            }
            catch (Exception ex)
            {
            }
           
        }
         return strTimeOffPath;
    }

     private void Reset()
    {
        ddlTimeOffType.SelectedIndex=0;
        txtStartDate.Text = "";
        txtEndDate.Text = "";
        lblAppStatus.Text = "Pending";
        txtComments.Text = "";
        btnSave.Text = "Save";

    }
    private void BindTimeOffTypes()
    {
        oBll.TimeOffTypeID = null;
        oBll.GetTimeOffType();
        ListItem lstTimeOff = new ListItem("Select", "0");
        ddlTimeOffType.Items.Insert(0, lstTimeOff);
        ddlTimeOffType.DataTextField = "TimeOffDescription";
        ddlTimeOffType.DataValueField = "PK_TimeOffTypeID";
        ddlTimeOffType.DataSource = oBll.oDsTimeOffType;
        ddlTimeOffType.DataBind();
    }

    private void BindEmpTimeOff()
    {
        oBll.EmpTimeOffTypeID = null;
        if (Session["EmpID"] != null)
            oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
        oBll.StartDate = null;
        oBll.EndDate = null;
        oBll.GetEmployeeTimeOff();
        gvTimeOff.DataSource = oBll.oDsEmpTimeOff;
        gvTimeOff.DataBind();
    }    


    private void Security(Button btnSave, Button btnReset, GridView gvSecurity)
    {
        if (Request.QueryString["pid"] != null)
        {
            if (Session["UserID"].ToString().ToLower() != "admin")
            {
                if (Session["DSEmpDetails"] != null)
                {
                    oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];
                    int flag = 0;
                    for (int iRowCount = 0; iRowCount < oBll.oDsEmpDetails.Tables[0].Rows.Count; iRowCount++)
                    {
                        if (Request.QueryString["pid"].ToString() == oBll.oDsEmpDetails.Tables[0].Rows[iRowCount]["Pk_PageID"].ToString())
                        {
                            string[] strPermissionType = oBll.oDsEmpDetails.Tables[0].Rows[iRowCount]["PermissionType"].ToString().Split(',');
                            for (int iPermCount = 0; iPermCount < strPermissionType.Length; iPermCount++)
                            {
                                flag = 1;
                                switch (strPermissionType[iPermCount])
                                {
                                    case "A": oBll.Add = 'Y';
                                        break;
                                    case "V": oBll.View = 'Y';
                                        break;
                                    case "D": oBll.Delete = 'Y';
                                        break;
                                    case "E": oBll.Edit = 'Y';
                                        break;
                                }
                            }

                            break;
                        }
                    }

                    if (flag == 0 || oBll.View == 'N')
                        Response.Redirect("~/NoAccess.aspx");
                    else if (flag == 1)
                    {
                        if (oBll.Add == 'Y')
                        {
                            if (btnSave.Text == "Save")
                            {
                                btnSave.Enabled = true;
                                btnReset.Enabled = true;
                            }
                            else
                            {
                                btnSave.Enabled = false;
                                btnReset.Enabled = false;
                            }
                        }
                        else
                        {
                            btnSave.Enabled = false;
                            btnReset.Enabled = false;
                        }
                        foreach (GridViewRow gvRow in gvSecurity.Rows)
                        {
                            if (oBll.Edit == 'N')
                            {
                                LinkButton lnkEdit = (LinkButton)gvSecurity.Rows[gvRow.RowIndex].FindControl("lnkEdit");
                                lnkEdit.Enabled = false;
                            }
                            if (oBll.Delete == 'N')
                            {
                                LinkButton lnkDelete = (LinkButton)gvSecurity.Rows[gvRow.RowIndex].FindControl("lnkDelete");
                                lnkDelete.Visible = false;
                            }
                        }
                    }
                }
            }
        }
        else
            Response.Redirect("~/NoAccess.aspx");
    }


    protected void gvTimeOff_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblFileName = (Label)e.Row.FindControl("lblFileName");
                HyperLink tofflink = (HyperLink)e.Row.FindControl("tofflink");
                Label lblAppStatus = (Label)e.Row.FindControl("lblStatus");
                LinkButton lnkEdit = (LinkButton)e.Row.FindControl("lnkEdit");
                LinkButton lnkDelete = (LinkButton)e.Row.FindControl("lnkDelete");

                if (lblFileName.Text == "")
                {
                    tofflink.Visible = false;
                }
                else
                {
                    tofflink.Visible = true;
                }

                if (lblAppStatus.Text.ToLower() != "pending")
                {
                    lnkEdit.Visible = false;
                    lnkDelete.Visible = false;
                }

            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }

    }

    private void SendTimeOff(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject, string strSmtpHost, int iSmtpPort, string strEmpEmailID)
    {
        MailMessage Mail = new MailMessage();
        MailAddress MailAdd = new MailAddress(strFromEmail, strFromEmail, System.Text.Encoding.UTF8);
        Mail.From = MailAdd;
        Mail.To.Add(strToEmail);
        Mail.CC.Add(strEmpEmailID);
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
       // smtpmailobject.EnableSsl = true;

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