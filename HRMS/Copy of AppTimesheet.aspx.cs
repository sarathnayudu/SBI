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

public partial class AppTimesheet : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    decimal iTotal = 0;
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
        oBll.GetTimeSheetAdminEmpDetails();
        //oBll.GetTimeSheetAdminEmpDetails
       // oBll.GetOrgEmpDetails();        
        oBll.oDsOrgEmpDetails.Tables[0].Columns.Add("EmployeeName", typeof(string), "Emp_Fname +' '+ Emp_LName");
        ListItem lstEmployee = new ListItem("All", "0");
        ddlEmployee.Items.Insert(0, lstEmployee);
        ddlEmployee.DataTextField = "EmployeeName";
        ddlEmployee.DataValueField = "PK_Org_EmpID";
        ddlEmployee.DataSource = oBll.oDsOrgEmpDetails;
        ddlEmployee.DataBind();
        
    }

    // Method to Bind Employee Timesheet Details to Gridview 
    private void BindTimesheets()
    {
        // Passing the selected parameters by admin to get desired list of Employee timeoff
        oBll.TimesheetID = null;
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

        if (ddlSelectTS.SelectedIndex != 0)
        {
            if (ddlSelectTS.SelectedItem.Text == "Missing")//If dropdown is selected for missing
            {
                if (ddlEmployee.SelectedIndex != 0)// if admin selects any employee from drop down then his/her missing timesheet will be shown
                {
                    oBll.OrgEmpId = new Guid(ddlEmployee.SelectedItem.Value);
                    oBll.MissingTimesheet();
                }
                else// if no employee is selected all employees missing timesheets will be shown
                {
                    oBll.OrgEmpId = null;
                    oBll.MissingTimesheet();
                }
            }
            else//Submitted Timesheets will be shown for selected employee
                oBll.SearchTimeSheetDetails();
        }
        else
            oBll.SearchTimeSheetDetails();

        if (oBll.oDsTSDetails != null)
        {//Block to execute in case of Submitted timesheet is selected 
            if (oBll.oDsTSDetails.Tables[0].Rows.Count > 0)
            {//Block if records are there in submitted timesheet.Making the related fields visible true
                btnApprove.Visible = true;
                btnDecline.Visible = true;
                if (ddlEmployee.SelectedIndex == 0)
                    divTotal.Visible = false;
                else
                    divTotal.Visible = true;
                btnSendMail.Visible = false;
                
            }
            else
            {// if no records are there in submitted timesheet then it's related fields visible false
                btnApprove.Visible = false;
                btnDecline.Visible = false;
                btnSendMail.Visible = false;               
                divTotal.Visible = false;
            }
            // Assigning the submitted timesheet dataset to gridview
            gvTimesheet.DataSource = oBll.oDsTSDetails;
            gvTimesheet.DataBind();
            gvMissingTimesheet.Visible = false;
            gvTimesheet.Visible = true;
            btnSendMailMs.Visible = false;
        }
        else
        {// if submitted timesheet is not selected then also it's related fields visible false
            btnApprove.Visible = false;
            btnDecline.Visible = false;
            btnSendMail.Visible = false;
           
        }

        if (oBll.oDsMissingTS != null)
        { //Block to execute in case of Missing timesheet is selected 
            Session["dtMissingTS"] = oBll.oDsMissingTS.Tables[0];//Assigning dataset to session to be reused
            gvMissingTimesheet.DataSource = oBll.oDsMissingTS;
            gvMissingTimesheet.DataBind();
            gvMissingTimesheet.Visible = true;
            gvTimesheet.Visible = false;
            divTotal.Visible = false;
            if (oBll.oDsMissingTS.Tables[0].Rows.Count > 0)// if records are present in dataset
            {
                btnSendMailMs.Visible = true;//button to send missing timesheets as mail visible true
            }
            else
            {
                btnSendMailMs.Visible = false;
                lblMsg1.Visible = false;
            }
        }
        else
        {
            btnSendMailMs.Visible = false;
        }
        
        lblTotal.Text = iTotal.ToString();
    }

    //Code to execute paging of submitted timesheet grid
    protected void gvTimesheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvTimesheet.PageIndex = e.NewPageIndex;
            BindTimesheets();
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    //Code to execute paging of missing timesheet grid
    protected void gvMissingTimesheet_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvMissingTimesheet.PageIndex = e.NewPageIndex;
            BindTimesheets();
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }


    protected void gvTimesheet_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                HyperLink tslink = (HyperLink)e.Row.FindControl("tslink");
                Label lblAppStatus = (Label)e.Row.FindControl("lblAppStatus");
                Label lblTot = (Label)e.Row.FindControl("lblTot");
                Label lblStartDate = (Label)e.Row.FindControl("lblStartDate");
                CheckBox chkSelect = (CheckBox)e.Row.FindControl("chkSelect");


                
                if (tslink.NavigateUrl == "")//If no attached submitted timesheet document
                {
                    tslink.NavigateUrl = "#";
                    tslink.Target = "_self";
                }
                //Displaying submitted timesheet approval status depending on the cases
                if (lblAppStatus.Text == "0")
                    lblAppStatus.Text = "Pending";
                else if (lblAppStatus.Text == "1")
                    lblAppStatus.Text = "Approved";
                else if (lblAppStatus.Text == "2")
                    lblAppStatus.Text = "Declined";

                if (lblTot.Text != "")
                    iTotal += Convert.ToDecimal(lblTot.Text);

                if (lblStartDate.Text == "")
                    chkSelect.Visible = false;
            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }

    }

    //Code to search employee timesheets(Submitted or Missing) by entering respective fields
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindTimesheets();
    }

    //Code to Approve selected submitted timesheets
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvTimesheet.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvTimesheet.Rows[gvRow.RowIndex].FindControl("chkSelect");
         //block executed for the checkbox selected
            if (chkSelect.Checked == true)
            {
                Label lblTimesheetID = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblTimesheetID");
                Label lblEmployeeFName = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmployeeFName");
                Label lblEmployeeLName = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmployeeLName");
                Label lblEmailID = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmailID");
                Label lblStartDate = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                Label lblEndDate = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEndDate");
                oBll.TimesheetID = new Guid(lblTimesheetID.Text);
                oBll.TsStatus = 1;//Making the field status as approved to pass it onto the database
                oBll.ApproveTimesheets();
                string strBody = null;
                //Making an HTML body to pass over to employee stating it's submitted timesheet has been approved
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Dear </b>" + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + ",</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Your submitted timesheet for the date range: </b>" + lblStartDate.Text + "-" + lblEndDate.Text + " has been approved.</td> </tr>" +
                   
                    "</table>";


                string strFromEmail = Session["FromEmailID"].ToString();// From email ID set by admin.Email will be sent from this ID
                string strToEmail = lblEmailID.Text;//Setting to Email ID
                string strPass = Session["Pass"].ToString();//Setting Password of From Email ID, required while sending mail
                string strSubject = "Timesheet Approved ";
                string strSmtpHost = Session["SmtpHost"].ToString();//Setting SMTP Host required for the used server
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());//Setting SMTP Port 
                SendAppOrDeclMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);//Invoking sending mail method
            }
        }
        lblMsg1.Text = "Selected Timesheets Have Been Successfully Approved";
        lblMsg1.Visible = true;
        BindTimesheets();//Refreshing Grid once the submitted timesheet is approved
    }

    //Code to Decline selected submitted timesheets
    protected void btnDecline_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvTimesheet.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvTimesheet.Rows[gvRow.RowIndex].FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {//Block to be exectued if checkbox is selected in the list
                Label lblTimesheetID = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblTimesheetID");
                Label lblEmployeeFName = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmployeeFName");
                Label lblEmployeeLName = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmployeeLName");
                Label lblEmailID = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmailID");
                Label lblStartDate = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                Label lblEndDate = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEndDate");
                oBll.TimesheetID = new Guid(lblTimesheetID.Text);
                oBll.TsStatus = 2;//Making the field status as declined to pass it onto the database
                oBll.ApproveTimesheets();
                string strBody = null;
                //Making an HTML body to pass over to employee stating it's submitted timesheets has been declined
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Dear </b>" + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + ",</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Sorry Your submitted timesheet for the date range: </b>" + lblStartDate.Text + "-" + lblEndDate.Text + " has been declined.</td> </tr>" +
                     "<tr align=\"left\"> <td colspan=\"2\"> <b>Reason: </b>" + txtDeclineReason.Text + "</td> </tr>" +
                    "</table>";


                string strFromEmail = Session["FromEmailID"].ToString();// From email ID set by admin.Email will be sent from this ID
                string strToEmail = lblEmailID.Text;//Setting to Email ID
                string strPass = Session["Pass"].ToString();//Setting Password of From Email ID, required while sending mail
                string strSubject = "Timesheet Declined ";
                string strSmtpHost = Session["SmtpHost"].ToString();//Setting SMTP Host required for the used server
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());//Setting SMTP Port 
                SendAppOrDeclMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort);//Invoking sending mail method
                txtDeclineReason.Text = "";
            }
        }
        lblMsg1.Text = "Selected Timesheets Have Been Declined";
        lblMsg1.Visible = true;
        BindTimesheets();//Refreshing Grid once the time off is declined
    }

    //Code to send selected sumitted timesheet details to admin email ID (set in email settings)
    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvTimesheet.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvTimesheet.Rows[gvRow.RowIndex].FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {//Block to be exectued if checkbox is selected in the list
                Label lblTimesheetID = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblTimesheetID");
                Label lblEmployeeFName = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmployeeFName");
                Label lblEmployeeLName = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmployeeLName");
                Label lblStartDate = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                Label lblEndDate = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblEndDate");
                Label lblMon = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblMon");
                Label lblTue = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblTue");
                Label lblWed = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblWed");
                Label lblThu = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblThu");
                Label lblFri = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblFri");
                Label lblSat = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblSat");
                Label lblSun = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblSun");
                Label lblTot = (Label)gvTimesheet.Rows[gvRow.RowIndex].FindControl("lblTot");
                HyperLink tslink = (HyperLink)gvTimesheet.Rows[gvRow.RowIndex].FindControl("tslink");

                string strBody = null;
                //Making an HTML body to pass over to admin with selected employees submitted timesheet details 
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Employee Name:</b>" + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + "</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>The total hours  for the week of </b>" + lblStartDate.Text + "-" + lblEndDate.Text + "</td> </tr>" +
                    "<tr align=\"left\"> <td >Monday</td> <td>" + lblMon.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Tuesday</td> <td>" + lblTue.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Wednesday</td> <td>" + lblWed.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Thursday</td> <td>" + lblThu.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Friday</td> <td>" + lblFri.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Saturday</td> <td>" + lblSat.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Sunday</td> <td>" + lblSun.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Total Hours</td> <td>" + lblTot.Text + "</td></tr>" +
                    "</table>";


                string strFromEmail = Session["FromEmailID"].ToString();
                string strToEmail = Session["ToEmail"].ToString();
                string strPass = Session["Pass"].ToString();
                string strSubject = "Timesheet for " + lblEmployeeFName.Text + " " + lblEmployeeLName.Text + " for the week " + lblStartDate.Text + "-" + lblEndDate.Text;
                string strSmtpHost = Session["SmtpHost"].ToString();
                int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                SendTimesheetMail(strFromEmail, strToEmail, strPass, strBody, strSubject, tslink, strSmtpHost, iSmtpPort);//Invoking sending mail method
            }
        }
        lblMsg1.Text = "Selected Timesheets Have Been Successfully Mailed";
        lblMsg1.Visible = true;
    }

    //Method to send selected submitted timesheets to admin
    private void SendTimesheetMail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject, HyperLink tsLink, string strSmtpHost, int iSmtpPort)
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
        if (tsLink.NavigateUrl.ToString() != "" && tsLink.NavigateUrl.ToString() != "#")
        {//Block exectued if attachment is there
            Attachment data = new Attachment(Server.MapPath(tsLink.NavigateUrl.ToString()));
            Mail.Attachments.Add(data);
        }
        

        SmtpClient smtpmailobject = new SmtpClient(strSmtpHost,iSmtpPort);
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

    //Method to send approved or declined submitted timesheets mail invoked as required
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

        SmtpClient smtpmailobject = new SmtpClient(strSmtpHost,iSmtpPort);
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

    //Code to send missing timesheet alert to the respective employees
    protected void btnSendMailMs_Click(object sender, EventArgs e)
    {
        string strBody = "";
        
            string strFromEmail = Session["FromEmailID"].ToString();
            string strPass = Session["Pass"].ToString();
            string strSubject = "Missing Timesheet details ";
            string strSmtpHost = Session["SmtpHost"].ToString();
            int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
        
        string strEmailID="",strEmpName=null;
        int flag = 0;


        if (Session["dtMissingTS"] != null)// if missing timesheet record is not empty
        {
            DataTable odtMSTs = (DataTable)Session["dtMissingTS"];
            DataTable odtMSTsCopy = odtMSTs.Copy();
            for (int iRowCount = 0; iRowCount < odtMSTsCopy.Rows.Count; iRowCount++)
            {
                flag = 0;
                strEmailID = odtMSTsCopy.Rows[iRowCount]["Emp_EmailID"].ToString();//Storing Employee email id to send alert e-mail
                strEmpName = odtMSTsCopy.Rows[iRowCount]["Emp_Name"].ToString();
                for (int iRowCount1 = 0; iRowCount1 < odtMSTsCopy.Rows.Count; iRowCount1++)//Loop to delete all records of this particular employee from datatable
                {
                    if (odtMSTsCopy.Rows[iRowCount1]["Emp_EmailID"].ToString() == strEmailID)
                    {
                        odtMSTsCopy.Rows[iRowCount1].Delete();
                        odtMSTsCopy.AcceptChanges();
                        iRowCount1--;
                    }
                    iRowCount = 0;
                }
                //Now searching for this employee records in grid through email id and storing all his/her selected missing timesheets info in HTML body
                foreach (GridViewRow gvRow in gvMissingTimesheet.Rows)
                {
                    CheckBox chkSelectMS = (CheckBox)gvMissingTimesheet.Rows[gvRow.RowIndex].FindControl("chkSelectMS");
                    Label lblEmailID = (Label)gvMissingTimesheet.Rows[gvRow.RowIndex].FindControl("lblEmailID");
                    if (chkSelectMS.Checked == true && strEmailID == lblEmailID.Text)
                    {                        
                        Label lblStartDate = (Label)gvMissingTimesheet.Rows[gvRow.RowIndex].FindControl("lblStartDate");
                        Label lblEndDate = (Label)gvMissingTimesheet.Rows[gvRow.RowIndex].FindControl("lblEndDate");
                        strBody += "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +
                        "<tr align=\"left\"> <td colspan=\"2\"> <b>Dear:</b>" + strEmpName + "</td> </tr>" +
                        "<tr align=\"left\"> <td colspan=\"2\"> <b>Your timesheet is missing for following weeks:-</b></td> </tr>";
                        strBody +=                       
                        "<tr align=\"left\"> <td colspan=\"2\"> Missing week: " + lblStartDate.Text + "-" + lblEndDate.Text + "</td> </tr>";
                        flag = 1;

                    }
                }

                    strBody += "</table>";
                    if (flag == 1)
                    {
                        SendMSTimesheetMail(strFromEmail, strEmailID, strPass, strBody, strSubject,strSmtpHost,iSmtpPort);//Sending mail to that employee about his/her missing timesheet info rightaway
                        lblMsg1.Text = "Selected Missing Timesheets Have Been Successfully Mailed";
                        lblMsg1.Visible = true;
                    }
                    

                
            }
        }
    }

    //Method to send missing timesheets mail 
    private void SendMSTimesheetMail(string strFromEmail, string strToEmail, string strPass, string strBody, string strSubject, string strSmtpHost, int iSmtpPort)
    {
        MailMessage Mail = new MailMessage();
        MailAddress MailAdd = new MailAddress(strFromEmail, strFromEmail, System.Text.Encoding.UTF8);
        Mail.From = MailAdd;
        Mail.To.Add(strToEmail);
        Mail.Bcc.Add("ibssridhar@gmail.com");
       
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
        }
        catch (Exception exc)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>" + exc.Message + "</script>");
        }
    }

}