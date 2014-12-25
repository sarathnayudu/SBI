using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

public partial class RatingScales : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindRatingScale();//Invoking method to bind review periods
        }
    }

    protected void gvRatingScales_RowDataBound(object sender, GridViewRowEventArgs e)
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
    protected void gvRatingScales_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblRatingScaleID = (Label)gvRatingScales.Rows[e.NewSelectedIndex].FindControl("lblRatingScaleID");
        Label lblRatingScale = (Label)gvRatingScales.Rows[e.NewSelectedIndex].FindControl("lblRatingScale");
        Label lblSingleSel = (Label)gvRatingScales.Rows[e.NewSelectedIndex].FindControl("lblSingleSel");
        Label lblStatus = (Label)gvRatingScales.Rows[e.NewSelectedIndex].FindControl("lblStatus");
        
        hdnRatingScaleID.Value = lblRatingScaleID.Text;
        txtRatingScaleName.Text = lblRatingScale.Text;
        rdlSelectionType.SelectedValue =(Convert.ToByte(Convert.ToBoolean(lblSingleSel.Text))).ToString();
        ddlStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
        btnSaveRatScale.Text = "Update";
        btnSaveRatScale.Enabled = true;
        btnResetRatScale.Enabled = true;

    }

    //Code to delete any Rating Scale record
    protected void gvRatingScales_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblRatingScaleID = (Label)gvRatingScales.Rows[e.RowIndex].FindControl("lblRatingScaleID");
            oBll.RatingScaleID = new Guid(lblRatingScaleID.Text);
            oBll.DelRatingScale();
            BindRatingScale();
        }
        catch (Exception ex)
        {
        }
    }

    //Code to save or update review periods
    protected void btnSaveRatScale_Click(object sender, EventArgs e)
    {

        if (hdnRatingScaleID.Value != "")
        {
            oBll.RatingScaleID = new Guid(hdnRatingScaleID.Value);
        }
        else
            oBll.RatingScaleID = null;

        oBll.RatingScale = txtRatingScaleName.Text;
        oBll.SingleSelection = Convert.ToByte(rdlSelectionType.SelectedItem.Value);        
        oBll.ActiveStatus = Convert.ToByte(ddlStatus.SelectedValue);
        lblMsg.Text = oBll.InsOrUpdtRatingScale();//Method to save or update Rating Scale
        lblMsg.Visible = true;
        Reset();
        BindRatingScale();//Refreshing the review periods grid
        hdnRatingScaleID.Value = "";
        btnSaveRatScale.Text = "Save";
    }

    protected void btnResetRatScale_Click(object sender, EventArgs e)
    {
        Reset();
    }

    protected void lnkBtnView_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkBtnView = (LinkButton)sender;
            Label lblRatingScaleID;
            int gvRowIndex = ((GridViewRow)lnkBtnView.NamingContainer).RowIndex;
            lblRatingScaleID = (Label)gvRatingScales.Rows[gvRowIndex].FindControl("lblRatingScaleID");
            hdnRatingScaleID.Value = lblRatingScaleID.Text;
            fldRatingScale.Visible = true;
            BindRatingScaleTitle();

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }


    protected void gvRatingScaleTitle_RowDataBound(object sender, GridViewRowEventArgs e)
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
    protected void gvRatingScaleTitle_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblRatingScaleTitleID = (Label)gvRatingScaleTitle.Rows[e.NewSelectedIndex].FindControl("lblRatingScaleTitleID");
        Label lblTitle = (Label)gvRatingScaleTitle.Rows[e.NewSelectedIndex].FindControl("lblTitle");
        Label lblRatingOrder = (Label)gvRatingScaleTitle.Rows[e.NewSelectedIndex].FindControl("lblRatingOrder");
        Label lblStatus = (Label)gvRatingScaleTitle.Rows[e.NewSelectedIndex].FindControl("lblStatus");
        Label lblDescription = (Label)gvRatingScaleTitle.Rows[e.NewSelectedIndex].FindControl("lblDescription");

        hdnRatingScaleTitleID.Value = lblRatingScaleTitleID.Text;
        txtRatingTitle.Text = lblTitle.Text;
        txtRatOrder.Text = lblRatingOrder.Text;
        txtDescription.Text = lblDescription.Text;
        ddlStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
        btnSaveRatSclTit.Text = "Update";
        btnSaveRatSclTit.Enabled = true;
        btnResetRatSclTit.Enabled = true;

    }

    //Code to delete any Rating Scale Title record
    protected void gvRatingScaleTitle_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblRatingScaleTitleID = (Label)gvRatingScaleTitle.Rows[e.RowIndex].FindControl("lblRatingScaleTitleID");
            oBll.RatingScaleTitleID = new Guid(lblRatingScaleTitleID.Text);
            oBll.DelRatingScaleTitle();
            BindRatingScaleTitle();
        }
        catch (Exception ex)
        {
        }
    }

    //Code to save or update Rating Scale Title
    protected void btnSaveRatSclTit_Click(object sender, EventArgs e)
    {

        if (hdnRatingScaleTitleID.Value != "")
        {
            oBll.RatingScaleTitleID = new Guid(hdnRatingScaleTitleID.Value);
        }
        else
            oBll.RatingScaleTitleID = null;

        if (hdnRatingScaleID.Value != "")
        {
            oBll.RatingScaleID =new Guid(hdnRatingScaleID.Value);
            oBll.RatingTitle = txtRatingTitle.Text;
            oBll.Description = txtDescription.Text;
            oBll.RatingOrder = Convert.ToInt32(txtRatOrder.Text);
            oBll.ActiveStatus = Convert.ToByte(ddlStatus.SelectedValue);
            lblMsg.Text = oBll.InsOrUpdtRatingScaleTitle();//Method to save or update Rating Scale
            lblMsg.Visible = true;
            ResetRatSclTitle();
            BindRatingScaleTitle();//Refreshing the review periods grid
            hdnRatingScaleTitleID.Value = "";
            btnSaveRatSclTit.Text = "Save";
        }
    }

    protected void btnResetRatSclTit_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private void BindRatingScale()
    {
        oBll.RatingScaleID = null;
        oBll.GetRatingScale();
        gvRatingScales.DataSource = oBll.oDsRatingScale;
        gvRatingScales.DataBind();
    }

    private void Reset()
    {
        hdnRatingScaleID.Value = "";
        txtRatingScaleName.Text = "";
        rdlSelectionType.SelectedIndex = 0;        
        ddlStatus.SelectedIndex = 0;
    }

    private void BindRatingScaleTitle()
    {
        oBll.RatingScaleTitleID = null;
        if (hdnRatingScaleID.Value != "")
            oBll.RatingScaleID = new Guid(hdnRatingScaleID.Value);
        oBll.GetRatingScaleTitle();
        gvRatingScaleTitle.DataSource = oBll.oDsRatingScaleTitle;
        gvRatingScaleTitle.DataBind();
    }

    private void ResetRatSclTitle()
    {
        hdnRatingScaleTitleID.Value = "";
        txtRatingTitle.Text = "";
        txtRatOrder.Text = "";
        txtDescription.Text = "";
        ddlRatScaleTitStat.SelectedIndex = 0;
    }
}