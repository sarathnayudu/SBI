using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using BusinessLogic;

public partial class AppTimeOff : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindEmployee();
                       
        }
        lblMsg.Visible = false;
    }



    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    oBll.GetOrgDetails();
    //    if (oBll.OrgID != null)
    //    {
    //        if (hdnEmpTimeOffID.Value != "")
    //            oBll.EmpTimeOffTypeID = new Guid(hdnEmpTimeOffID.Value);
    //        else
    //            oBll.EmpTimeOffTypeID = null;
    //        if (Session["EmpID"] != null)
    //        {
    //            oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
    //            if (ddlTimeOffType.SelectedIndex != 0)
    //                oBll.TimeOffTypeID = new Guid(ddlTimeOffType.SelectedItem.Value);
    //            oBll.StartDate = Convert.ToDateTime(txtStartDate.Text);
    //            oBll.EndDate = Convert.ToDateTime(txtEndDate.Text);
    //            oBll.AppStatus = ddlStatus.SelectedItem.Text;
    //            if (FileUpload1.HasFile == true)
    //                oBll.FileName = FileUpload1.FileName.ToString();
    //            oBll.FilePath = UploadFile(FileUpload1);
    //            oBll.CreatedBy = Session["createdBy"].ToString();
    //            oBll.CreatedDate = System.DateTime.Now;
    //            oBll.ModifiedBy = Session["modifiedBy"].ToString();
    //            oBll.ModifiedDate = System.DateTime.Now;
    //            string strBody = null;
    //            if (Session["UserName"] != null)
    //            {
    //                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

    //                    "<tr align=\"left\"> <td colspan=\"2\"> The Time Off reuest has been submitted by" + Session["UserName"].ToString() + " for the following dates</td> </tr>" +

    //                    "<tr align=\"left\"> <td >Start Date:</td> <td>" + txtStartDate.Text + "</td></tr>" +
    //                    "<tr align=\"left\"> <td >End Date:</td> <td>" + txtEndDate.Text + "</td></tr>" +
    //                    "<tr align=\"left\"> <td >Reason for Time Off:</td> <td>" + ddlTimeOffType.SelectedItem.Text + "</td></tr>" +

    //                    "</table>";
    //            }
    //            lblMsg.Text = oBll.InsOrUpdtEmployeeTimeOff();
    //            SendTimeOff("sridhar@intellectbusiness.com", oBll.EmailID, strBody);
    //            lblMsg.Visible = true;
    //            BindEmpTimeOff();
    //            Reset();
    //            Security(btnSave, btnReset, gvTimeOff);
    //        }
    //    }
    //}


    private void BindEmployee()
    {
        
        oBll.OrgEmpId = null;
        //oBll.GetOrgEmpDetails();
        oBll.GetTimeSheetAdminEmpDetails();

        oBll.oDsOrgEmpDetails.Tables[0].Columns.Add("EmployeeName", typeof(string), "Emp_Fname +' '+ Emp_LName");
        ListItem lstEmployee = new ListItem("All", "0");
        ddlEmployee.Items.Insert(0, lstEmployee);
        ddlEmployee.DataTextField = "EmployeeName";
        ddlEmployee.DataValueField = "PK_Org_EmpID";
        ddlEmployee.DataSource = oBll.oDsOrgEmpDetails;
        ddlEmployee.DataBind();
    }

    private void BindEmpTimeOff()
    {
        oBll.EmpTimeOffTypeID = null;
        if (ddlEmployee.SelectedIndex == 0)
            oBll.OrgEmpId = null;
        else
            oBll.OrgEmpId = new Guid(ddlEmployee.SelectedItem.Value);

        if (txtStartDate.Text != "")
            oBll.StartDate = Convert.ToDateTime(txtStartDate.Text);
        else
            oBll.StartDate = null;
        if (txtEndDate.Text != "")
            oBll.EndDate = Convert.ToDateTime(txtEndDate.Text);
        else
            oBll.EndDate = null;
        oBll.GetEmployeeTimeOff();
        if (oBll.oDsEmpTimeOff.Tables[0].Rows.Count > 0)
        {
            btnApprove.Visible = true;
            btnDecline.Visible = true;
        }
        else
        {
            btnApprove.Visible = false;
            btnDecline.Visible = false;
        }
        gvTimeOff.DataSource = oBll.oDsEmpTimeOff;
        gvTimeOff.DataBind();
    }


    protected void gvTimeOff_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblFileName = (Label)e.Row.FindControl("lblFileName");
                HyperLink tofflink = (HyperLink)e.Row.FindControl("tofflink");
                if (lblFileName.Text == "")
                {
                    tofflink.Visible = false;
                }
                else
                {
                    tofflink.Visible = true;
                }
            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }

    }

    protected void gvTimeOff_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvTimeOff.PageIndex = e.NewPageIndex;
            BindEmpTimeOff();
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }


    private void SendTimeOff(string strFromEmail, string strToEmail, string strBody)
    {
        MailMessage Mail = new MailMessage();
        MailAddress MailAdd = new MailAddress(strFromEmail, strFromEmail, System.Text.Encoding.UTF8);
        Mail.From = MailAdd;
        Mail.To.Add(strToEmail);

        Mail.Subject = "Time Off Details";
        Mail.SubjectEncoding = System.Text.Encoding.UTF8;
        Mail.Body = strBody;
        Mail.BodyEncoding = System.Text.Encoding.UTF8;
        Mail.IsBodyHtml = true;
        Mail.Priority = MailPriority.High;

        SmtpClient smtpmailobject = new SmtpClient("smtp.gmail.com", 587);
        smtpmailobject.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpmailobject.EnableSsl = true;

        //smtpmailobject.UseDefaultCredentials = false;
        //smtpmailobject.Credentials = new System.Net.NetworkCredential("sridhar@intellectbusiness.com", "sridhar");
        try
        {
            smtpmailobject.Send(Mail);
        }
        catch (Exception exc)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>" + exc.Message + "</script>");
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindEmpTimeOff();
    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvTimeOff.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvTimeOff.Rows[gvRow.RowIndex].FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {
                Label lblEmpTimeOffID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmpTimeOffID");
                Label lblEmployeeFName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeFName");
                Label lblEmployeeLName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeLName");
                Label lblEmailID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmailID");
                Label lblStartDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                Label lblEndDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEndDate");
                oBll.EmpTimeOffTypeID = new Guid (lblEmpTimeOffID.Text);
                oBll.AppStatus = "Approved";
                oBll.ApproveTimeOff();
                string strBody = null;

                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Dear </b>" + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + ",</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Your submitted timeoff for the date range: </b>" + lblStartDate.Text + "-" + lblEndDate.Text + " has been approved.</td> </tr>" +

                    "</table>";


                string strFromEmail = Session["FromEmailID"].ToString();
                string strToEmail = lblEmailID.Text;
                string strPass = Session["Pass"].ToString();
                string strSubject = "Time Off Approved ";
                string strSmtpHost = Session["SmtpHost"].ToString();
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                SendAppOrDeclMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);
            }
        }
        lblMsg1.Text = "Selected Time Off Have Been Successfully Approved";
        lblMsg1.Visible = true;
        BindEmpTimeOff();
    }
    protected void btnDecline_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvTimeOff.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvTimeOff.Rows[gvRow.RowIndex].FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {
                Label lblEmpTimeOffID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmpTimeOffID");
                Label lblEmployeeFName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeFName");
                Label lblEmployeeLName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeLName");
                Label lblEmailID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmailID");
                Label lblStartDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                Label lblEndDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEndDate");

                oBll.EmpTimeOffTypeID = new Guid(lblEmpTimeOffID.Text);
                oBll.AppStatus = "Declined";
                oBll.ApproveTimeOff();
                string strBody = null;
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                   "<tr align=\"left\"> <td colspan=\"2\"> <b>Dear </b>" + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + ",</td> </tr>" +
                   "<tr align=\"left\"> <td colspan=\"2\"> <b>Sorry Your submitted Time Off for the date range: </b>" + lblStartDate.Text + "-" + lblEndDate.Text + " has been declined.</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Reason: </b>" + txtDeclineReason.Text + "</td> </tr>" +
                   "</table>";


                string strFromEmail = Session["FromEmailID"].ToString();
                string strToEmail = lblEmailID.Text;
                string strPass = Session["Pass"].ToString();
                string strSubject = "Time Off Declined ";
                string strSmtpHost = Session["SmtpHost"].ToString();
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                SendAppOrDeclMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);
                txtDeclineReason.Text = "";
            }
        }
        lblMsg1.Text = "Selected Time Off Have Been Declined";
        lblMsg1.Visible = true;
        BindEmpTimeOff();
    }

    private void SendAppOrDeclMail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject, string strSmtpHost, int iSmtpPort)
    {
        MailMessage Mail = new MailMessage();
        MailAddress MailAdd = new MailAddress(strFromEmail, strFromEmail, System.Text.Encoding.UTF8);
        Mail.From = MailAdd;
        Mail.To.Add(strToEmail);

        Guid guid = Guid.NewGuid();
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