using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

public partial class AssignRatTemplate : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRatingTemplate();//Invoking method to bind dropdown with rating templates       
            BindEmpolyeeDetails();//Invoking method to bind grid with employees
            BindAssignedTempl();
           
        }
    }

    //Code to implement paging of employee list grid
    protected void gvEmployeeDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvEmployeeDetails.PageIndex = e.NewPageIndex;
            BindEmpolyeeDetails();
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    //Code to delete Assigned Rating Template record
    protected void gvAssignedTemplate_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblEvaluationID = (Label)gvAssignedTemplate.Rows[e.RowIndex].FindControl("lblEvaluationID");
            Label lblEempID = (Label)gvAssignedTemplate.Rows[e.RowIndex].FindControl("lblEmpID");
            
            oBll.EvaluationID = lblEvaluationID.Text;
            oBll.DelEmpEvaluation(lblEempID.Text);
            BindAssignedTempl();
        }
        catch (Exception ex)
        {
        }
    }

    //Code to Assign evaluation template to the selected employee
    protected void btnAssignTempl_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvRow in gvEmployeeDetails.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvEmployeeDetails.Rows[gvRow.RowIndex].FindControl("chkSelect");
            if (chkSelect.Checked == true)
            {
                //Block to be exectued if checkbox is selected in the list
                Label lblEmpid = (Label)gvEmployeeDetails.Rows[gvRow.RowIndex].FindControl("lblEmpid");
                
                oBll.EvaluationID = null;
                oBll.OrgEmpId = new Guid(lblEmpid.Text);
                oBll.TemplateID = new Guid(ddlRatingTempl.SelectedItem.Value);
                oBll.EvalDocPath = "";
                oBll.Processed = 0;
                oBll.OnlyAdmin = Convert.ToByte(rdlOnlyAdmin.SelectedItem.Value);
                oBll.EvalGrade = "";
                oBll.ActiveStatus = 1;
                oBll.EmployeeSumm = "Test Summery";
               lblMsg1.Text= oBll.InsOrUpdtEmpEvaluation();
               lblMsg1.Visible = true;
            }

        }
        
        BindAssignedTempl();
    }

    //Code to implement paging of employee list grid
    protected void gvAssignedTemplate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvAssignedTemplate.PageIndex = e.NewPageIndex;
            BindEmpolyeeDetails();
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

  
    

    //Method to bind employee list to grid
    private void BindEmpolyeeDetails()
    {
        oBll.OrgEmpId = null;
        oBll.GetOrgEmpDetails();
        gvEmployeeDetails.DataSource = oBll.oDsOrgEmpDetails;
        gvEmployeeDetails.DataBind();
    }

    private void BindRatingTemplate()
    {
        oBll.TemplateID = null;
        oBll.GetRatingTemplate();

        ddlRatingTempl.DataTextField = "Template_Name";
        ddlRatingTempl.DataValueField = "PK_TemplateID";
        ddlRatingTempl.DataSource = oBll.oDsRatingTemplate;
        ddlRatingTempl.DataBind();
    }

    //Method to bind employee list to grid
    private void BindAssignedTempl()
    {
        oBll.EvaluationID = null;
        oBll.OrgEmpId = null;
        oBll.OnlyAdmin = null;
        oBll.GetEmpEvaluation();
        gvAssignedTemplate.DataSource = oBll.oDsEmpEvaluation;
        gvAssignedTemplate.DataBind();
    }
    protected void txtEmpName_TextChanged(object sender, EventArgs e)
    {
        TextBox txtSearch = (TextBox)sender;
       
            AssignTextValues(txtSearch.Text);
    }
    //Method to show the employee records as per their entries in search textfields
    private void AssignTextValues(string strSearchtext)
    {
        oBll.FirstName = strSearchtext;
       
        oBll.SearchOrgEmpDetailsForAssigntemplates();
            //ForAssignTemplates();
        gvEmployeeDetails.DataSource = oBll.oDsOrgEmpDetails;
        gvEmployeeDetails.DataBind();
    }

}