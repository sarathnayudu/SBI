using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class Main : System.Web.UI.MasterPage
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Redirecting to login page is user's session is null
        if (Session["UserID"] == null)
            Response.Redirect("~/Login.aspx");
        
        if (!IsPostBack)
        {
            //Getting the organization details to display it's name at logo's place
            oBll.GetOrgDetails();
            if (oBll.OrgID != null)
            {
                lblLogoText.Text = oBll.OrgName;
            }
        

        oBll.OrgEmpCode = Session["UserID"].ToString();//storing EmployeeCode in the respective field to get User Detail
        oBll.GetUserDetail();//Fetching the User Records
        Session["EmpID"] = oBll.OrgEmpId.ToString();//storing employee id in session to be used at many places
        Session["DSEmpDetails"] = oBll.oDsEmpDetails;//keeping the dataset stored with employee details making it usable at places like security rather than hiting again the database
        Session["OrgRoleName"] = oBll.OrgRoleName;
        lblUserName.Text = oBll.FirstName + " " + oBll.LastName;
        Session["UserName"] = Session["createdBy"] = Session["modifiedBy"] = lblUserName.Text;
       
        DataTable oDtEmpDetails, oDtEmpDetailsCopy;

        //If user is admin
        if (Session["OrgRoleName"].ToString().ToLower() == "admin")
        {
            //All menu options which are not related to admin are deleted
            for (int iRowCount = 0; iRowCount < 5; iRowCount++)
            {
                oBll.oDsEmpDetails.Tables[0].Rows[0].Delete();
                oBll.oDsEmpDetails.Tables[0].Rows[0].AcceptChanges();

            }
            oDtEmpDetails = oBll.oDsEmpDetails.Tables[0].Copy();//Final list assigned to datatable to make it the datasource of left menus repeater
        }
        //If user is not admin
        else
        {            
            oBll.EvaluationID = null;
            oBll.OnlyAdmin = 0;
            oBll.GetEmpEvaluation();
            if (oBll.oDsEmpEvaluation.Tables[0].Rows.Count > 0)
            {
                hdnEvalID.Value = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["PK_EvaluationID"].ToString();
                lnkBtnEval.Visible = true;
            }
            oDtEmpDetails = oBll.oDsEmpDetails.Tables[0].Clone();//Just dataset clone to insert final ordered menu list
            oDtEmpDetailsCopy = oBll.oDsEmpDetails.Tables[0].Copy();//copied dataset to do the manipulations and setting through it to the required order
            DataRow oDrEmpDetails;
            int flag = 0, order = 0;
            //Loop to set the correct required order of menus and inserting them to datatable oDtEmpDetails
            for (int iRowCount = 0; iRowCount < oDtEmpDetailsCopy.Rows.Count; iRowCount++)
            {
                flag = 0;
                if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Timesheet")
                {
                    flag = 1;
                    order = 1;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My TimeOff" && order == 1)
                {
                    flag = 1;
                    order = 2;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Documents" && order == 2)
                {
                    flag = 1;
                    order = 3;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Profile" && order == 3)
                {
                    flag = 1;
                    order = 4;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "Performance Evaluation" && order == 4)
                {
                    flag = 1;
                    order = 5;
                }

                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Projects" && order == 5)
                {
                    flag = 1;
                }
                if (flag == 1)
                {
                    oDrEmpDetails = oDtEmpDetailsCopy.Rows[iRowCount];

                    oDtEmpDetails.ImportRow(oDrEmpDetails);
                    oDtEmpDetailsCopy.Rows[iRowCount].Delete();
                    oDtEmpDetailsCopy.AcceptChanges();
                    iRowCount = -1;
                }
            }
        }

        //final ordered menus datatable assigning to repeater
        rptPages.DataSource = oDtEmpDetails;
        rptPages.DataBind();
        }  
        

    }

    //On logout button clicked
    protected void lnkBtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx");
    }

    //Evaluation Test
    protected void lnkBtnEval_Click(object sender, EventArgs e)
    {
        if(hdnEvalID.Value!="")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "doclick", "javascript:window.open('ViewEmployeeEvaluation.aspx?EvID=" + hdnEvalID.Value + "&role=Employee','_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=200,top=5, width=800, height=650');", true); 
        
    }

    protected void rptPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemIndex > -1)
            {
                Panel pnlHeading = (Panel)e.Item.FindControl("pnlHeading");
                Label lblPageName = (Label)e.Item.FindControl("lblPageName");
                Panel pnlTitle = (Panel)e.Item.FindControl("pnlTitle");
                
                //My projects,Customer and Projects details are not required right now so made visible false temporarily on asked.
                if (lblPageName.Text == "My Projects")
                    pnlTitle.Visible = false;
                if (lblPageName.Text == "Customer")
                  //  pnlTitle.Visible = false;
                if (lblPageName.Text == "Projects Detail")
                   // pnlTitle.Visible = false;

                //Setting the panel heading(for menus list) visible true and text changes as required
                if (Session["OrgRoleName"].ToString().ToLower() != "admin")
                {
                    if (e.Item.ItemIndex == 0)
                        pnlHeading.Visible = true;
                    //else if (e.Item.ItemIndex == 5)
                    //{
                    //    LiteralControl litText = pnlHeading.Controls[0] as LiteralControl;
                    //    litText.Text = "Administration";
                    //    pnlHeading.Visible = true;
                    //}
                }
                else
                {
                    if (e.Item.ItemIndex == 0)
                    {
                        LiteralControl litText = pnlHeading.Controls[0] as LiteralControl;
                        litText.Text = "Administration";
                        pnlHeading.Visible = true;
                    }
                }
            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Display Error", "<script language=\"javascript\">alert(" + Ex.Message + ");</script>", true);

        }
    }

   
}
