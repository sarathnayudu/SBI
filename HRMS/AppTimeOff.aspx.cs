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

    // Method to Bind Employee list to dropdown 
    private void BindEmployee()
    {
        
        oBll.OrgEmpId = null;
        //oBll.GetOrgEmpDetails();
        oBll.GetTimeOffAdminEmpDetails();
        oBll.oDsOrgEmpDetails.Tables[0].Columns.Add("EmployeeName", typeof(string), "Emp_Fname +' '+ Emp_LName");
        ListItem lstEmployee = new ListItem("All", "0");
        ddlEmployee.Items.Insert(0, lstEmployee);
        ddlEmployee.DataTextField = "EmployeeName";
        ddlEmployee.DataValueField = "PK_Org_EmpID";
        ddlEmployee.DataSource = oBll.oDsOrgEmpDetails;
        ddlEmployee.DataBind();
    }

    // Method to Employee time off details in gridview
    private void BindEmpTimeOff()
    {
        // Passing the selected parameters by admin to get desired list of Employee timeoff
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

        oBll.GetEmployeeTimeOff();//Getting the list of Employee timeoff
       //Showing the buttons approve or decline only if the records are there of timeoff
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
        gvTimeOff.DataSource = oBll.oDsEmpTimeOff;// assigning the dataset of timeoff to gridview
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
               //Making the timeoff document link to be visible only if document is there
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
    //Code to execute paging in gridview
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
    
    //Code to search employee time off by entering respective fields
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindEmpTimeOff();
    }
    
    //Code to Approve selected time off
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvTimeOff.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvTimeOff.Rows[gvRow.RowIndex].FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {//Block to be exectued if checkbox is selected in the list
                Label lblEmpTimeOffID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmpTimeOffID");
                Label lblEmployeeFName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeFName");
                Label lblEmployeeLName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeLName");
                Label lblEmailID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmailID");
                Label lblStartDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                Label lblEndDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEndDate");
                oBll.EmpTimeOffTypeID = new Guid (lblEmpTimeOffID.Text);
                oBll.AppStatus = "Approved";//Making the field status as approved to pass it onto the database
                oBll.ApproveTimeOff();
                string strBody = null;
                //Making an HTML body to pass over to employee stating it's employee time off has been approved
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Dear </b>" + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + ",</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Your submitted timeoff for the date range: </b>" + lblStartDate.Text + "-" + lblEndDate.Text + " has been approved.</td> </tr>" +

                    "</table>";


                string strFromEmail = Session["FromEmailID"].ToString();// From email ID set by admin.Email will be sent from this ID
                string strToEmail = lblEmailID.Text; //Setting to Email ID
                string strPass = Session["Pass"].ToString(); //Setting Password of From Email ID, required while sending mail
                string strSubject = "Time Off Approved ";
                string strSmtpHost = Session["SmtpHost"].ToString();//Setting SMTP Host required for the used server
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());//Setting SMTP Port 
                SendAppOrDeclMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);//Invoking sending mail method
            }
        }
        lblMsg1.Text = "Selected Time Off Have Been Successfully Approved";//Displayed if mail successfully sent to the employee
        lblMsg1.Visible = true;
        BindEmpTimeOff();//Refreshing Grid once the time off is approved
    }

    //Code to Decline selected time off
    protected void btnDecline_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvTimeOff.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvTimeOff.Rows[gvRow.RowIndex].FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {//Block to be exectued if checkbox is selected in the list
                Label lblEmpTimeOffID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmpTimeOffID");
                Label lblEmployeeFName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeFName");
                Label lblEmployeeLName = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmployeeLName");
                Label lblEmailID = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEmailID");
                Label lblStartDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                Label lblEndDate = (Label)gvTimeOff.Rows[gvRow.RowIndex].FindControl("lblEndDate");

                oBll.EmpTimeOffTypeID = new Guid(lblEmpTimeOffID.Text);
                oBll.AppStatus = "Declined";//Making the field status as declined to pass it onto the database
                oBll.ApproveTimeOff();
                string strBody = null;
                //Making an HTML body to pass over to employee stating it's employee time off has been declined
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                   "<tr align=\"left\"> <td colspan=\"2\"> <b>Dear </b>" + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + ",</td> </tr>" +
                   "<tr align=\"left\"> <td colspan=\"2\"> <b>Sorry Your submitted Time Off for the date range: </b>" + lblStartDate.Text + "-" + lblEndDate.Text + " has been declined.</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Reason: </b>" + txtDeclineReason.Text + "</td> </tr>" +
                   "</table>";


                string strFromEmail = Session["FromEmailID"].ToString();// From email ID set by admin.Email will be sent from this ID
                string strToEmail = lblEmailID.Text;//Setting to Email ID
                string strPass = Session["Pass"].ToString();//Setting Password of From Email ID, required while sending mail
                string strSubject = "Time Off Declined ";
                string strSmtpHost = Session["SmtpHost"].ToString();//Setting SMTP Host required for the used server
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());//Setting SMTP Port 
                SendAppOrDeclMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);//Invoking sending mail method
                txtDeclineReason.Text = "";
            }
        }
        lblMsg1.Text = "Selected Time Off Have Been Declined";
        lblMsg1.Visible = true;
        BindEmpTimeOff();//Refreshing Grid once the time off is declined
    }

    //Method to send approved or declined time off mail invoked as required
    private void SendAppOrDeclMail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject, string strSmtpHost, int iSmtpPort)
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