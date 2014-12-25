using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;
using BusinessLogic;
using System.IO;

public partial class MyTimesheet : System.Web.UI.Page
{    
	public DateTime dtselected;
	public DateTime wkstartdate;
	public DateTime wkenddate;

	string dtcurrweek;
    OrganizationBLL oBll = new OrganizationBLL();
    private List<string> ControlsList
    {
        get
        {
            if (ViewState["controls"] == null)
            {
                ViewState["controls"] = new List<string>();
            }

            return (List<string>)ViewState["controls"];
        }
    }

    private int NextTextID
    {
        get
        {
            return ControlsList.Count + 1;
        }
    }  


	protected void Page_Load(object sender, System.EventArgs e)
	{

        txtmon.Attributes.Add("onchange", "cal_total();");
        txttue.Attributes.Add("onchange", "cal_total();");
        txtwed.Attributes.Add("onchange", "cal_total();");
        txtthu.Attributes.Add("onchange", "cal_total();");
        txtfri.Attributes.Add("onchange", "cal_total();");
        txtsat.Attributes.Add("onchange", "cal_total();");
        txtsun.Attributes.Add("onchange", "cal_total();");
        hdnStartDate.Value = txtStartDate.Text;
        hdnEndDate.Value = txtEndDate.Text;
        if (!Page.IsPostBack)
        {
            Session["BiWeek"] = null;
            Session["enddate"] = null;
            //Response.Write("IsPostBack hidden value date:" & hdfld.Value)
            GetWeekInfo(DateTime.Today);
            GetTimeSheetInfo();
        }
        else
        {
            // Response.Write("Not IsPostBack hidden value date:" & hdfld.Value)
            if (cal.SelectedDate.ToString() != "1/1/0001 12:00:00 AM")
            {
                if (cal.SelectedDate.ToString().IndexOf("12:00:00 AM") > 0)
                {
                    if (cal.SelectedDate == DateTime.Today)
                    {
                        GetWeekInfo(DateTime.Today);

                    }
                    else
                    {
                        GetWeekInfo(cal.SelectedDate);
                    }

                }
                else
                {
                    GetWeekInfo(cal.SelectedDate);
                }
                if (string.IsNullOrEmpty(hdfld.Value))
                {
                    //GetTimeSheetInfo();
                }
            }
            hdfld.Value = "";
        }
        hdnTaskID.Value = "";
       

	}

	private void timesheet_PreRender(object sender, System.EventArgs e)
	{
	}

	public void Selection_Change(object sender, EventArgs e)
	{
		lblerrormessage.Text = "";
		txtmon.Text = "";
		txttue.Text = "";
		txtwed.Text = "";
		txtthu.Text = "";
		txtfri.Text = "";
		txtsat.Text = "";
		txtsun.Text = "";
		txttotal.Text = "";
		System.DateTime selectedDate = default(System.DateTime);
		selectedDate = cal.SelectedDate;
        
		GetWeekInfo(selectedDate);        
		GetTimeSheetInfo();
                

	}

	private void cal_DayRender(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
	{
		string strMon = null;
		string StrTue = null;
		string strWed = null;
		string StrThu = null;
		string StrFri = null;
		string StrSat = null;
		string StrSun = null;
		strMon = lblmon.Text;
		StrTue = lbltue.Text;
		strWed = lblwed.Text;
		StrThu = lblthu.Text;
		StrFri = lblfri.Text;
		StrSat = lblsat.Text;
		StrSun = lblsun.Text;
		if (!string.IsNullOrEmpty(strMon)) {
			strMon = strMon.Substring(strMon.IndexOf("/") + 1);
		}
		if (!string.IsNullOrEmpty(StrTue)) {
			StrTue = StrTue.Substring(StrTue.IndexOf("/") + 1);
		}
		if (!string.IsNullOrEmpty(strWed)) {
			strWed = strWed.Substring(strWed.IndexOf("/") + 1);
		}
		if (!string.IsNullOrEmpty(StrThu)) {
			StrThu = StrThu.Substring(StrThu.IndexOf("/") + 1);
		}
		if (!string.IsNullOrEmpty(StrFri)) {
			StrFri = StrFri.Substring(StrFri.IndexOf("/") + 1);
		}
		if (!string.IsNullOrEmpty(StrSat)) {
			StrSat = StrSat.Substring(StrSat.IndexOf("/") + 1);
		}
		if (!string.IsNullOrEmpty(StrSun)) {
			StrSun = StrSun.Substring(StrSun.IndexOf("/") + 1);
		}

		if (e.Day.IsOtherMonth) {
			e.Cell.Text = "";
		} else {
			if (e.Day.DayNumberText == strMon) {
				if (((e.Day.Date >= wkstartdate) & (e.Day.Date <= wkenddate))) {
					e.Cell.BackColor = System.Drawing.Color.Red;
				}
			}


			if (e.Day.DayNumberText == StrTue) {
				if (((e.Day.Date >= wkstartdate) & (e.Day.Date <= wkenddate))) {
					e.Cell.BackColor = System.Drawing.Color.Red;
				}
			}

			if (e.Day.DayNumberText == strWed) {
				if (((e.Day.Date >= wkstartdate) & (e.Day.Date <= wkenddate))) {
					e.Cell.BackColor = System.Drawing.Color.Red;
				}
			}
			if (e.Day.DayNumberText == StrThu) {
				if (((e.Day.Date >= wkstartdate) & (e.Day.Date <= wkenddate))) {
					e.Cell.BackColor = System.Drawing.Color.Red;
				}
			}
			if (e.Day.DayNumberText == StrFri) {
				if (((e.Day.Date >= wkstartdate) & (e.Day.Date <= wkenddate))) {
					e.Cell.BackColor = System.Drawing.Color.Red;
				}
			}
			if (e.Day.DayNumberText == StrSat) {
				if (((e.Day.Date >= wkstartdate) & (e.Day.Date <= wkenddate))) {
					e.Cell.BackColor = System.Drawing.Color.Red;
				}
			}
			if (e.Day.DayNumberText == StrSun) {
				if (((e.Day.Date >= wkstartdate) & (e.Day.Date <= wkenddate))) {
					e.Cell.BackColor = System.Drawing.Color.Red;
				}
			}
		}
	}


	private void GetWeekInfo(DateTime currdate)
    {
        DateTime WeekStartDate = System.DateTime.Now;
        DateTime startDate=System.DateTime.Now;
        DateTime endDate = System.DateTime.Now;
        if (Session["BiWeek"] != null)
        {
            cal.SelectedDate = currdate;
            WeekStartDate=  currdate;
            startDate = Convert.ToDateTime(Session["startdate"]);
             endDate = Convert.ToDateTime(Session["enddate"]);
        }
		dtselected = currdate;
		int intwkday = 0;
		switch (currdate.DayOfWeek.ToString()) {
			case "Monday":
				intwkday = 2;
				//lblwkstart.Text = currdate.AddDays(-1)
                lblwkstart.Text = currdate.ToString("MM/dd/yyyy");
                lblwkend.Text = currdate.AddDays(6).ToString("MM/dd/yyyy");
				lblmon.Text = currdate.Month + "/" + currdate.Day;
				lbltue.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1).Day;
				lblwed.Text = currdate.AddDays(2).Month + "/" + currdate.AddDays(2).Day;
				lblthu.Text = currdate.AddDays(3).Month + "/" + currdate.AddDays(3).Day;
				lblfri.Text = currdate.AddDays(4).Month + "/" + currdate.AddDays(4).Day;
				lblsat.Text = currdate.AddDays(5).Month + "/" + currdate.AddDays(5).Day;
				lblsun.Text = currdate.AddDays(6).Month + "/" + currdate.AddDays(6).Day;
                if (Session["BiWeek"] != null)
                {
                    WeekStartDate = currdate;
                    cal.TodaysDate = startDate;
                    EnableDisableWeekDays("Monday",WeekStartDate, startDate, endDate);
                }   

				break;
			case "Tuesday":
				intwkday = 3;
                lblwkstart.Text = currdate.AddDays(-1).ToString("MM/dd/yyyy");
                lblwkend.Text = currdate.AddDays(5).ToString("MM/dd/yyyy");

				lblmon.Text = currdate.AddDays(-1).Month + "/" + currdate.AddDays(-1).Day;
				lbltue.Text = currdate.Month + "/" + currdate.Day;
				lblwed.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1).Day;
				lblthu.Text = currdate.AddDays(2).Month + "/" + currdate.AddDays(2).Day;
				lblfri.Text = currdate.AddDays(3).Month + "/" + currdate.AddDays(3).Day;
				lblsat.Text = currdate.AddDays(4).Month + "/" + currdate.AddDays(4).Day;
				lblsun.Text = currdate.AddDays(5).Month + "/" + currdate.AddDays(5).Day;
                if (Session["BiWeek"] != null)
                {
                    WeekStartDate = currdate.AddDays(-1);
                    cal.TodaysDate = startDate;
                    EnableDisableWeekDays("Tuesday", WeekStartDate,startDate, endDate);
                }               

				break;
			case "Wednesday":
				intwkday = 4;
                lblwkstart.Text = currdate.AddDays(-2).ToString("MM/dd/yyyy");
                lblwkend.Text = currdate.AddDays(4).ToString("MM/dd/yyyy");
				lblmon.Text = currdate.AddDays(-2).Month + "/" + currdate.AddDays(-2).Day;
				lbltue.Text = currdate.AddDays(-1).Month + "/" + currdate.AddDays(-1).Day;
				lblwed.Text = currdate.Month + "/" + currdate.Day;
				lblthu.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1).Day;
				lblfri.Text = currdate.AddDays(2).Month + "/" + currdate.AddDays(2).Day;
				lblsat.Text = currdate.AddDays(3).Month + "/" + currdate.AddDays(3).Day;
				lblsun.Text = currdate.AddDays(4).Month + "/" + currdate.AddDays(4).Day;
				lblhthu.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1);
				lblhfri.Text = currdate.AddDays(2).Month + "/" + currdate.AddDays(2);
				lblhsat.Text = currdate.AddDays(3).Month + "/" + currdate.AddDays(3);
                if (Session["BiWeek"] != null)
                {
                    WeekStartDate = currdate.AddDays(-2);
                    cal.TodaysDate = startDate;
                    EnableDisableWeekDays("Wednesday", WeekStartDate, startDate, endDate);
                }
				break;
			case "Thursday":
				intwkday = 5;
                lblwkstart.Text = currdate.AddDays(-3).ToString("MM/dd/yyyy");
                lblwkend.Text = currdate.AddDays(3).ToString("MM/dd/yyyy");
				lblmon.Text = currdate.AddDays(-3).Month + "/" + currdate.AddDays(-3).Day;
				lbltue.Text = currdate.AddDays(-2).Month + "/" + currdate.AddDays(-2).Day;
				lblwed.Text = currdate.AddDays(-1).Month + "/" + currdate.AddDays(-1).Day;
				lblthu.Text = currdate.Month + "/" + currdate.Day;
				lblfri.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1).Day;
				lblsat.Text = currdate.AddDays(2).Month + "/" + currdate.AddDays(2).Day;
				lblsun.Text = currdate.AddDays(3).Month + "/" + currdate.AddDays(3).Day;
				lblhfri.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1);
				lblhsat.Text = currdate.AddDays(2).Month + "/" + currdate.AddDays(2);
                if (Session["BiWeek"] != null)
                {
                    WeekStartDate = currdate.AddDays(-3);
                    cal.TodaysDate = startDate;
                    EnableDisableWeekDays("Thursday", WeekStartDate, startDate, endDate);
                }
               
				break;
			case "Friday":
				intwkday = 6;
                lblwkstart.Text = currdate.AddDays(-4).ToString("MM/dd/yyyy");
                lblwkend.Text = currdate.AddDays(2).ToString("MM/dd/yyyy");

				lblmon.Text = currdate.AddDays(-4).Month + "/" + currdate.AddDays(-4).Day;
				lbltue.Text = currdate.AddDays(-3).Month + "/" + currdate.AddDays(-3).Day;
				lblwed.Text = currdate.AddDays(-2).Month + "/" + currdate.AddDays(-2).Day;
				lblthu.Text = currdate.AddDays(-1).Month + "/" + currdate.AddDays(-1).Day;
				lblfri.Text = currdate.Month + "/" + currdate.Day;
				lblsat.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1).Day;
				lblsun.Text = currdate.AddDays(2).Month + "/" + currdate.AddDays(2).Day;


				lblhsat.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1);
                if (Session["BiWeek"] != null)
                {
                    WeekStartDate = currdate.AddDays(-4);
                    cal.TodaysDate = startDate;
                    EnableDisableWeekDays("Friday", WeekStartDate, startDate, endDate);
                }

				break;
			case "Saturday":
				intwkday = 7;
                lblwkstart.Text = currdate.AddDays(-5).ToString("MM/dd/yyyy");
                lblwkend.Text = currdate.AddDays(1).ToString("MM/dd/yyyy");
				lblmon.Text = currdate.AddDays(-5).Month + "/" + currdate.AddDays(-5).Day;
				lbltue.Text = currdate.AddDays(-4).Month + "/" + currdate.AddDays(-4).Day;
				lblwed.Text = currdate.AddDays(-3).Month + "/" + currdate.AddDays(-3).Day;
				lblthu.Text = currdate.AddDays(-2).Month + "/" + currdate.AddDays(-2).Day;

				lblfri.Text = currdate.AddDays(-1).Month + "/" + currdate.AddDays(-1).Day;
				lblsat.Text = currdate.Month + "/" + currdate.Day;
				lblsun.Text = currdate.AddDays(1).Month + "/" + currdate.AddDays(1).Day;
                if (Session["BiWeek"] != null)
                {
                    WeekStartDate = currdate.AddDays(-5);
                    cal.TodaysDate = startDate;
                    EnableDisableWeekDays("Saturday", WeekStartDate, startDate, endDate);
                }

				break;
			case "Sunday":
				intwkday = 1;
                lblwkstart.Text = currdate.AddDays(-6).ToString("MM/dd/yyyy");
                lblwkend.Text = currdate.AddDays(0).ToString("MM/dd/yyyy");
				lblmon.Text = currdate.AddDays(-6).Month + "/" + currdate.AddDays(-6).Day;
				lbltue.Text = currdate.AddDays(-5).Month + "/" + currdate.AddDays(-5).Day;
				lblwed.Text = currdate.AddDays(-4).Month + "/" + currdate.AddDays(-4).Day;
				lblthu.Text = currdate.AddDays(-3).Month + "/" + currdate.AddDays(-3).Day;
				lblfri.Text = currdate.AddDays(-2).Month + "/" + currdate.AddDays(-2).Day;
				lblsat.Text = currdate.AddDays(-1).Month + "/" + currdate.AddDays(-1).Day;
				lblsun.Text = currdate.Month + "/" + currdate.Day;
                if (Session["BiWeek"] != null)
                {
                    WeekStartDate = currdate.AddDays(-6);
                    cal.TodaysDate = startDate;
                    EnableDisableWeekDays("Sunday", WeekStartDate, startDate, endDate);
                }
				break;
		}
		if (string.IsNullOrEmpty(lblcurrentweek.Text)) {
			lblcurrentweek.Text = lblwkend.Text;
		}
		wkstartdate =Convert.ToDateTime(lblwkstart.Text);
		wkenddate = Convert.ToDateTime(lblwkend.Text);
        txtStartDate.Text = lblwkstart.Text;
        txtEndDate.Text = lblwkend.Text;

	}

    private void EnableDisableWeekDays(string strWeekDay, DateTime weekStartDate, DateTime startDate, DateTime endDate)
    {
        switch (strWeekDay)
        {
            case "Monday":
                EnableDisableTextbox(weekStartDate, startDate, endDate);
                break;

            case "Tuesday":
                EnableDisableTextbox(weekStartDate, startDate, endDate);              
                break;
            case "Wednesday":
                EnableDisableTextbox(weekStartDate, startDate, endDate);                
                break;

            case "Thursday":
                EnableDisableTextbox(weekStartDate, startDate, endDate);               
                break;
            case "Friday":
                EnableDisableTextbox(weekStartDate, startDate, endDate);                
                break;
            case "Saturday":
                EnableDisableTextbox(weekStartDate, startDate, endDate);               
                break;

            case "Sunday":
                EnableDisableTextbox(weekStartDate, startDate, endDate);                
                break;
        }
    }

    private void EnableDisableTextbox(DateTime weekStartDate,DateTime startDate,DateTime endDate)
    {
        if (weekStartDate.AddDays(6) >= startDate && weekStartDate.AddDays(6) <= endDate)
        {
            EnableTextBox(txtsun);
        }
        else
            DisableTextBox(txtsun);
        if (weekStartDate.AddDays(5) >= startDate && weekStartDate.AddDays(5) <= endDate)
        {
            EnableTextBox(txtsat);
        }
        else
            DisableTextBox(txtsat);

        if (weekStartDate.AddDays(4) >= startDate && weekStartDate.AddDays(4) <= endDate)
        {
            EnableTextBox(txtfri);
        }
        else
            DisableTextBox(txtfri);
        if (weekStartDate.AddDays(3) >= startDate && weekStartDate.AddDays(3) <= endDate)
        {
            EnableTextBox(txtthu);
        }
        else
            DisableTextBox(txtthu);
        if (weekStartDate.AddDays(2) >= startDate && weekStartDate.AddDays(2) <= endDate)
        {
            EnableTextBox(txtwed);
        }
        else
            DisableTextBox(txtwed);
        if (weekStartDate.AddDays(1) >= startDate && weekStartDate.AddDays(1) <= endDate)
        {
            EnableTextBox(txttue);
        }
        else
            DisableTextBox(txttue);
        if (weekStartDate >= startDate && weekStartDate <= endDate)
            EnableTextBox(txtmon);
        else
            DisableTextBox(txtmon);
    }


	private void cal_PreRender(object sender, System.EventArgs e)
	{
	}

	protected void btnSubmit_Click(object sender, System.EventArgs e)
	{       
        string timesheetfile = "";
        lblerrormessage.Text = "";
        if (Session["EmpID"] != null)
            oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
        oBll.StartDate = Convert.ToDateTime(lblwkstart.Text);
        oBll.EndDate = Convert.ToDateTime(lblwkend.Text);
        oBll.GetTimeSheetDetails();
        if (oBll.TimesheetID != null)
            hdnTimeSheetID.Value = oBll.TimesheetID.ToString();
        else
            hdnTimeSheetID.Value = "";

        if (rdts.SelectedValue == "YES" & string.IsNullOrEmpty(FileUpload1.FileName))
        {
            lblerrormessage.Text = "Please select the timesheet to upload.";            
            return;
        }
        if (rdts.SelectedValue == "NO" & !string.IsNullOrEmpty(FileUpload1.FileName))
        {
            lblerrormessage.Text = "DO not select the file to upload.";            
            return;
        }
        if (Convert.ToDateTime(lblwkend.Text) > Convert.ToDateTime(lblcurrentweek.Text))
        {
            lblerrormessage.Text = "The date you selected is for the future week";            
            return;
        }
        if (lblwkstart.Text == "12:00:00 A")
        {
            lblerrormessage.Text = "The date you selected is invalid";            
            return;
        }        
        try
        {

            string strAttach = "";
            if (rdts.SelectedValue == "YES")
            {
                timesheetfile = Session["UserID"].ToString() + Convert.ToDateTime(lblwkstart.Text).ToString("MMddyyyy") + " -" + Convert.ToDateTime(lblwkend.Text).ToString("MMddyyyy") + "-" + FileUpload1.FileName;
                if (Session["UserName"] != null)
                {
                    if (!Directory.Exists(Server.MapPath("~/TimeSheet/" + Session["UserName"].ToString())))
                        Directory.CreateDirectory(Server.MapPath("~/TimeSheet/" + Session["UserName"].ToString()));
                    string SaveLocation = Server.MapPath("~/TimeSheet") + "/" + Session["UserName"].ToString() + "/" + timesheetfile;
                    FileUpload1.SaveAs(SaveLocation);
                    strAttach = "~/TimeSheet/" + Session["UserName"].ToString() + "/" + timesheetfile;
                }
            }
            else
            {
                if (tslink.NavigateUrl.ToString() != "")
                    strAttach = tslink.NavigateUrl.ToString();
            }

            if (hdnTimeSheetID.Value != "")
                oBll.TimesheetID = new Guid(hdnTimeSheetID.Value);
            else
                oBll.TimesheetID = null;
            if(Session["EmpID"]!=null)
            oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
            oBll.StartDate = Convert.ToDateTime(lblwkstart.Text);
            oBll.EndDate = Convert.ToDateTime(lblwkend.Text);
            oBll.Mon = Convert.ToDecimal(txtmon.Text);
            oBll.Tue = Convert.ToDecimal(txttue.Text);
            oBll.Wed = Convert.ToDecimal(txtwed.Text);
            oBll.Thu = Convert.ToDecimal(txtthu.Text);
            oBll.Fri = Convert.ToDecimal(txtfri.Text);
            oBll.Sat = Convert.ToDecimal(txtsat.Text);
            oBll.Sun = Convert.ToDecimal(txtsun.Text);
            oBll.Total = Convert.ToDecimal(hdnTotal.Value);
            
            oBll.FileName = strAttach;
            oBll.FilePath = strAttach;
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;
            string strBody = null;
            if (Session["UserName"] != null)
            {
                strBody = "<table align=\"center\" bgcolor=\"#ededee\" cellpadding=\"0\" cellspacing=\"0\" >" +

                    "<tr align=\"left\"> <td colspan=\"2\"> <b>Employee Name:</b>"+Session["UserName"].ToString()+"</td> </tr>" +
                    "<tr align=\"left\"> <td colspan=\"2\"> <b>The total hours  for the week of </b>" + lblwkstart.Text + "-"+lblwkend.Text +"</td> </tr>" +
                    "<tr align=\"left\"> <td >Monday</td> <td>"+ txtmon.Text +"</td></tr>" +
                    "<tr align=\"left\"> <td >Tuesday</td> <td>" + txttue.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Wednesday</td> <td>" + txtwed.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Thursday</td> <td>" + txtthu.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Friday</td> <td>" + txtfri.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Saturday</td> <td>" + txtsat.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Sunday</td> <td>" + txtsun.Text + "</td></tr>" +
                    "<tr align=\"left\"> <td >Total Hours</td> <td>" + hdnTotal.Value + "</td></tr>" +
                    "</table>";
            }           
           

            lblerrormessage.Text = oBll.InsOrUpdtTimeSheet();

            oBll.TaskID = null;
            
            oBll.StartDate = Convert.ToDateTime(lblwkstart.Text);
            oBll.EndDate = Convert.ToDateTime(lblwkend.Text);
            oBll.TskDesc = txtTaskDetails.Text;
            oBll.GetTimeSheetDetails();
            if (txtTaskDetails.Text != "")
            {
                if (hdnTaskID.Value != "")
                    oBll.TaskID = new Guid(hdnTaskID.Value);
                lblMsg1.Text = oBll.InsOrUpdtTasks();
            }
            

            if (Session["DSEmpDetails"] != null)
            {
                oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];
                if (Session["FromEmailID"] != null)
                {
                    string strFromEmail = Session["FromEmailID"].ToString();
                    string strToEmail = Session["ToEmail"].ToString();
                    string strPass = Session["Pass"].ToString();
                    string strSmtpHost = Session["SmtpHost"].ToString();
                    int iSmtpPort = Convert.ToInt32(Session["SmtpPort"].ToString());
                    string strEmpEmailID = oBll.oDsEmpDetails.Tables[0].Rows[0]["Emp_EmailID"].ToString();
                    string strSubject = "Timesheet for " + Session["UserName"].ToString() + " for the week " + lblwkstart.Text + "-" + lblwkend.Text;
                    SendTimesheetMail(strFromEmail, strToEmail, strPass, strBody, strSubject, strSmtpHost, iSmtpPort, strEmpEmailID);
                }
            }
            GetTimeSheetInfo();
            hdnTimeSheetID.Value = "";
        }
        catch (Exception ex)
        {
            if (ex.Message.ToString().IndexOf("Violation of PRIMARY KEY constraint") > 0)
            {
                lblerrormessage.Text = "The timesheet for this week has already been submitted.";
            }
            else
            {
                lblerrormessage.Text = ex.Message.ToString();
            }
        }       

	}

	private void GetTimeSheetInfo()
	{       
        bool blnrecexist = false;
        try
        {
            if (Session["EmpID"] != null)
                oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
            oBll.StartDate =Convert.ToDateTime(lblwkstart.Text);
            oBll.EndDate = Convert.ToDateTime(lblwkend.Text);
            oBll.GetTimeSheetDetails();
            
            if (oBll.TimesheetID != null)
            {
                hdnTimeSheetID.Value = oBll.TimesheetID.ToString();
                blnrecexist = true;
                // RemoveDynamicControls();
                //divTSTask.Visible = true;
                
                btnSubmitTask.Enabled = true;
                btnSubmitTask.CssClass = "btnStyle1";
                GetTask();
                
            }
            else
            {
                
                btnSubmitTask.Enabled = false;
                btnSubmitTask.CssClass = "disabledText";
                hdnTaskID.Value = "";
                txtTaskDetails.Text = "";

                
                //divTSTask.Visible = false;
            }

            tslink.NavigateUrl = oBll.FilePath;
            tslink.Enabled = true;
            tslink.ForeColor = System.Drawing.Color.Red;
            tslink.Font.Bold = true;
               
                txtmon.Text = oBll.Mon.ToString();
                txttue.Text = oBll.Tue.ToString();
                txtwed.Text = oBll.Wed.ToString();
                txtthu.Text = oBll.Thu.ToString();
                txtfri.Text = oBll.Fri.ToString();
                txtsat.Text = oBll.Sat.ToString();
                txtsun.Text = oBll.Sun.ToString();
                hdnTotal.Value = txttotal.Text = oBll.Total.ToString();

                if (txtmon.Text.Substring(txtmon.Text.IndexOf(".") + 1) == "0")
                {
                    txtmon.Text = txtmon.Text.Substring(0, txtmon.Text.IndexOf("."));
                }
                if (txttue.Text.Substring(txttue.Text.IndexOf(".") + 1) == "0")
                {
                    txttue.Text = txttue.Text.Substring(0, txttue.Text.IndexOf("."));
                }
                if (txtwed.Text.Substring(txtwed.Text.IndexOf(".") + 1) == "0")
                {
                    txtwed.Text = txtwed.Text.Substring(0, txtwed.Text.IndexOf("."));
                }
                if (txtthu.Text.Substring(txtthu.Text.IndexOf(".") + 1) == "0")
                {
                    txtthu.Text = txtthu.Text.Substring(0, txtthu.Text.IndexOf("."));
                }
                if (txtfri.Text.Substring(txtfri.Text.IndexOf(".") + 1) == "0")
                {
                    txtfri.Text = txtfri.Text.Substring(0, txtfri.Text.IndexOf("."));
                }
                if (txtsat.Text.Substring(txtsat.Text.IndexOf(".") + 1) == "0")
                {
                    txtsat.Text = txtsat.Text.Substring(0, txtsat.Text.IndexOf("."));
                }
                if (txtsun.Text.Substring(txtsun.Text.IndexOf(".") + 1) == "0")
                {
                    txtsun.Text = txtsun.Text.Substring(0, txtsun.Text.IndexOf("."));
                }
                if (txttotal.Text.Substring(txttotal.Text.IndexOf(".") + 1) == "0")
                {
                    txttotal.Text = txttotal.Text.Substring(0, txttotal.Text.IndexOf("."));
                }            

            if (blnrecexist == true)
            {
                tslink.Enabled = true;
                btnupload.Enabled = true;
            }
            else
            {
                tslink.Enabled = false;
                btnupload.Enabled = false;
            }

        }
        catch (Exception ex)
        {
        }

	}

	protected void btnupload_Click(object sender, System.EventArgs e)
	{
        string timesheetfile = null;
        if (FileUpload1.HasFile)
        {
            try
            {
                
                timesheetfile = Session["UserID"].ToString()+Convert.ToDateTime(lblwkstart.Text).ToString("MMddyyyy") + " -" + Convert.ToDateTime(lblwkend.Text).ToString("MMddyyyy") + "-" + FileUpload1.FileName;                
                //Response.Write(timesheetfile)
                string SaveLocation = Server.MapPath("~/TimeSheet") + "/" +timesheetfile;                
                FileUpload1.SaveAs(SaveLocation);
               
                oBll.StartDate = Convert.ToDateTime(lblwkstart.Text);
                oBll.EndDate = Convert.ToDateTime(lblwkend.Text);
                if (Session["EmpID"] != null)
                    oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
                oBll.GetTimeSheetDetails();
                oBll.FileName = "~/TimeSheet/"+timesheetfile ;
                oBll.FilePath = "~/TimeSheet/" + timesheetfile;
                oBll.CreatedBy = Session["createdBy"].ToString();
                oBll.CreatedDate = System.DateTime.Now;
                oBll.ModifiedBy = Session["modifiedBy"].ToString();
                oBll.ModifiedDate = System.DateTime.Now;
               
                if (oBll.TimesheetID != null)
                    oBll.UpdateTimeSheet();  
                                  
                tslink.Enabled = true;
                tslink.NavigateUrl = "~/TimeSheet/" + timesheetfile;

            }
            catch (Exception ex)
            {
            }
        }
	}

	protected void btnlogout_Click(object sender, System.EventArgs e)
	{
		Session.Abandon();
		Response.Redirect("~/Login.aspx");

	}

	//Private Sub dpnwkstyle_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dpnwkstyle.SelectedIndexChanged
	//  Response.Write(dpnwkstyle.SelectedValue.ToString)
	//   Response.Write(dpnwkstyle.SelectedItem.Text.ToString)
	//    Response.Write(dpnwkstyle.SelectedIndex.ToString)

	//End Sub


	private void cal_SelectionChanged(object sender, System.EventArgs e)
	{
	}
    //public TSheet()
    //{
    //    PreRender += timesheet_PreRender;
    //    Load += Page_Load;
    //}

   
    private void GetTask()
    {     
        
        oBll.TaskID = null;
        if (Session["EmpID"] != null)
            oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
        oBll.TimesheetID = new Guid(hdnTimeSheetID.Value);
        oBll.GetTasks();
        if (oBll.oDsTasks.Tables[0].Rows.Count > 0)
        {
            hdnTaskID.Value = oBll.oDsTasks.Tables[0].Rows[0]["PK_TaskID"].ToString();
            txtTaskDetails.Text = oBll.oDsTasks.Tables[0].Rows[0]["Task_Description"].ToString();
        }
        else
        {
            hdnTaskID.Value = "";
            txtTaskDetails.Text = "";
        }
    }

    private void DisableTextBox(TextBox txtDays)
    {
        txtDays.Enabled = false;
        txtDays.CssClass = "disabledText";
    }
    private void EnableTextBox(TextBox txtDays)
    {
        txtDays.Enabled = true;
        txtDays.CssClass = "text1";
    }


    protected void btnDtTimesheet_Click(object sender, EventArgs e)
    {       
        Session["BiWeek"] = "true";
        Session["startdate"] = hdnStartDate.Value;
        Session["enddate"] = hdnEndDate.Value;
        GetWeekInfo(Convert.ToDateTime(hdnStartDate.Value));
        GetTimeSheetInfo();
        
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {        
        Session["BiWeek"] = null;
        Session["enddate"]=null;
    }

    private void SendTimesheetMail(string strFromEmail, string strToEmail,string strPass, string strBody,string strSubject,string strSmtpHost,int iSmtpPort,string strEmpEmailID)
    {
        MailMessage Mail = new MailMessage();
        MailAddress MailAdd = new MailAddress(strFromEmail, strFromEmail, System.Text.Encoding.UTF8);
        Mail.From = MailAdd;
        Mail.To.Add(strToEmail);
        Mail.CC.Add(strEmpEmailID);
        Guid guid = Guid.NewGuid();
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

    protected void btnSubmitTask_Click(object sender, EventArgs e)
    {
      
            oBll.TaskID = null;
            if (Session["EmpID"] != null)
                oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
            oBll.StartDate = Convert.ToDateTime(lblwkstart.Text);
            oBll.EndDate = Convert.ToDateTime(lblwkend.Text);
            oBll.TskDesc = txtTaskDetails.Text;
            oBll.GetTimeSheetDetails();            
            
            if (hdnTaskID.Value != "")
                oBll.TaskID = new Guid(hdnTaskID.Value);
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;
            lblMsg1.Text = oBll.InsOrUpdtTasks();
            
        
    }
}