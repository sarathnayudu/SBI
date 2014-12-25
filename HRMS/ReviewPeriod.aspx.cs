using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class ReviewPeriod : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (!Page.IsPostBack)
        {
            BindReviewPeriod();//Invoking method to bind review periods
        }
    }

    protected void gvReviewPeriod_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus1");
                bool bStatus = Convert.ToBoolean(lblStatus.Text);
                //Displaying review periods to be active or inactive depedning on it's status
                if (bStatus == false)
                {
                    lblStatus.Text = "Inactive";
                }
                else
                {
                    lblStatus.Text = "Active";
                }

            }
        }
        catch (Exception Ex)
        {
           
        }
    }

    //Code to assign field with the values to update it
    protected void gvReviewPeriod_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblReviewPerID = (Label)gvReviewPeriod.Rows[e.NewSelectedIndex].FindControl("lblReviewPerID");
        Label lblPeriodName = (Label)gvReviewPeriod.Rows[e.NewSelectedIndex].FindControl("lblPeriodName");
        Label lblStartDate = (Label)gvReviewPeriod.Rows[e.NewSelectedIndex].FindControl("lblStartDate");
        Label lblEndDate = (Label)gvReviewPeriod.Rows[e.NewSelectedIndex].FindControl("lblEndDate");
        Label lblStatus = (Label)gvReviewPeriod.Rows[e.NewSelectedIndex].FindControl("lblStatus");
        hdnReviewPeriodID.Value = lblReviewPerID.Text;
        txtRevPerName.Text = lblPeriodName.Text;
        txtStartDate.Text = lblStartDate.Text;
        txtEndDate.Text = lblEndDate.Text;
        ddlStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
        btnSavePeriod.Text = "Update";
        btnSavePeriod.Enabled = true;
        btnResetPeriod.Enabled = true;

    }

    //Code to delete Review Period record
    protected void gvReviewPeriod_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblReviewPerID = (Label)gvReviewPeriod.Rows[e.RowIndex].FindControl("lblReviewPerID");
            oBll.ReviewPeriodID = new Guid(lblReviewPerID.Text);
            oBll.DelReviewPeriod();
            BindReviewPeriod();
        }
        catch (Exception ex)
        {
        }   
    }

    //Code to save or update review periods
    protected void btnSavePeriod_Click(object sender, EventArgs e)
    {       
       
            if (hdnReviewPeriodID.Value != "")
            {
                oBll.ReviewPeriodID = new Guid(hdnReviewPeriodID.Value);
            }
            else
                oBll.ReviewPeriodID = null;

            oBll.PeriodName = txtRevPerName.Text;
            oBll.StartDate = Convert.ToDateTime(txtStartDate.Text);
            oBll.EndDate = Convert.ToDateTime(txtEndDate.Text);
            oBll.ActiveStatus = Convert.ToByte(ddlStatus.SelectedValue);
            lblMsg.Text = oBll.InsOrUpdtReviewPeriod();//Method to save or update review period
            lblMsg.Visible = true;
            Reset();
            BindReviewPeriod();//Refreshing the review periods grid
            hdnReviewPeriodID.Value = "";
            btnSavePeriod.Text = "Save";
    }

    protected void btnResetPeriod_Click(object sender, EventArgs e)
    {
        Reset();        
    }

    private void BindReviewPeriod()
    {
        oBll.ReviewPeriodID = null;
        oBll.GetReviewPeriod();
        gvReviewPeriod.DataSource = oBll.oDsReviewPeriod;
        gvReviewPeriod.DataBind();
    }

    private void Reset()
    {
        hdnReviewPeriodID.Value = "";
        txtRevPerName.Text = "";
        txtStartDate.Text = "";
        txtEndDate.Text = "";
        ddlStatus.SelectedIndex = 0;
    }
}