using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

public partial class RatingTemplates : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            BindRatingScales();//Invoking method to bind rating scales
            BindReviewPeriod();//Invoking method to bind review periods
            BindRatingTemplate();
        }
    }

    protected void gvRatingTemplate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus1");
                bool bStatus = Convert.ToBoolean(lblStatus.Text);
                //Displaying rating templates to be active or inactive depedning on it's status
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
    protected void gvRatingTemplate_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblTemplateID = (Label)gvRatingTemplate.Rows[e.NewSelectedIndex].FindControl("lblTemplateID");
        Label lblTemplateName = (Label)gvRatingTemplate.Rows[e.NewSelectedIndex].FindControl("lblTemplateName");
        Label lblRatingScaleID = (Label)gvRatingTemplate.Rows[e.NewSelectedIndex].FindControl("lblRatingScaleID");
        Label lblReviewPeriodID = (Label)gvRatingTemplate.Rows[e.NewSelectedIndex].FindControl("lblReviewPeriodID");
        Label lblInstructions = (Label)gvRatingTemplate.Rows[e.NewSelectedIndex].FindControl("lblInstructions");
       
        Label lblStatus = (Label)gvRatingTemplate.Rows[e.NewSelectedIndex].FindControl("lblStatus");
        hdnTemplateID.Value = lblTemplateID.Text;
        txtTemplateName.Text = lblTemplateName.Text;
        ddlRatingScale.SelectedValue = lblRatingScaleID.Text;
        ddlReviewPeriod.SelectedValue = lblReviewPeriodID.Text;
        txtInstructions.Text = lblInstructions.Text;
        
        ddlStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
        btnSaveTemplate.Text = "Update";
        btnSaveTemplate.Enabled = true;
        btnResetTemplate.Enabled = true;

    }

    //Code to delete Rating Template record
    protected void gvRatingTemplate_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblTemplateID = (Label)gvRatingTemplate.Rows[e.RowIndex].FindControl("lblTemplateID");
            oBll.TemplateID = new Guid(lblTemplateID.Text);
            oBll.DelRatingTemplate();
            BindRatingTemplate();
        }
        catch (Exception ex)
        {
        }
    }

    //Code to save or update Rating Template
    protected void btnSaveTemplate_Click(object sender, EventArgs e)
    {

        if (hdnTemplateID.Value != "")
        {
            oBll.TemplateID = new Guid(hdnTemplateID.Value);
        }
        else
            oBll.TemplateID = null;

        oBll.TemplateName = txtTemplateName.Text;
        oBll.RatingScaleID = new Guid(ddlRatingScale.SelectedItem.Value);
        oBll.ReviewPeriodID = new Guid(ddlReviewPeriod.SelectedItem.Value);
        oBll.ActiveStatus = Convert.ToByte(ddlStatus.SelectedValue);
        oBll.Instructions = txtInstructions.Text;        
        lblMsg.Text = oBll.InsOrUpdtRatingTemplate();//Method to save or update review period
        lblMsg.Visible = true;
        Reset();
        BindRatingTemplate();//Refreshing the rating templates grid
        hdnTemplateID.Value = "";
        btnSaveTemplate.Text = "Save";
    }

    protected void btnResetTemplate_Click(object sender, EventArgs e)
    {
        Reset();
    }

    protected void lnkBtnView_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkBtnView = (LinkButton)sender;
            Label lblTemplateID;
            int gvRowIndex = ((GridViewRow)lnkBtnView.NamingContainer).RowIndex;
            lblTemplateID = (Label)gvRatingTemplate.Rows[gvRowIndex].FindControl("lblTemplateID");
            hdnTemplateID.Value = lblTemplateID.Text;
            fldRatTemplate.Visible = false;
            fldQuestion.Visible = true;
            lnkBtnBack.Visible = true;
            BindQuestions();

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void lnkBtnBack_Click(object sender, EventArgs e)
    {
        try
        {           
            
            fldRatTemplate.Visible = true;
            fldQuestion.Visible = false;
            lnkBtnBack.Visible = false;           

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvQuestions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus1");
                bool bStatus = Convert.ToBoolean(lblStatus.Text);
                //Displaying Template Questions to be active or inactive depedning on it's status
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
    protected void gvQuestions_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblQuesID = (Label)gvQuestions.Rows[e.NewSelectedIndex].FindControl("lblQuesID");
        Label lblQues = (Label)gvQuestions.Rows[e.NewSelectedIndex].FindControl("lblQues");
        Label lblStatus = (Label)gvQuestions.Rows[e.NewSelectedIndex].FindControl("lblStatus");
        hdnQuesID.Value = lblQuesID.Text;
        txtQuestions.Text = lblQues.Text;        
        ddlQuesStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
        btnSaveQuestion.Text = "Update";
        btnSaveQuestion.Enabled = true;
        btnResetQues.Enabled = true;

    }

    //Code to delete Rating Template Questions record
    protected void gvQuestions_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Label lblQuesID = (Label)gvQuestions.Rows[e.RowIndex].FindControl("lblQuesID");
            oBll.QuesID = new Guid(lblQuesID.Text);
            oBll.DelRatTemplQues();
            BindQuestions();
        }
        catch (Exception ex)
        {
        }
    }


    //Code to save or update Rating Questions
    protected void btnSaveQuestion_Click(object sender, EventArgs e)
    {

        if (hdnQuesID.Value != "")
        {
            oBll.QuesID = new Guid(hdnQuesID.Value);
        }
        else
            oBll.QuesID = null;

        if (hdnTemplateID.Value != "")
        {
            oBll.TemplateID = new Guid(hdnTemplateID.Value);
            oBll.Questions = txtQuestions.Text;           
            oBll.ActiveStatus = Convert.ToByte(ddlQuesStatus.SelectedValue);
            oBll.CompletedBy = Convert.ToInt32(rdlCompletedBy.SelectedItem.Value);
            lblQuesMsg.Text = oBll.InsOrUpdtRatTemplQues();//Method to save or update Rating Questions
            lblQuesMsg.Visible = true;
            ResetQues();
            BindQuestions();//Refreshing the rating questions grid
            hdnQuesID.Value = "";
            btnSaveQuestion.Text = "Save";
        }
    }

    protected void btnResetQues_Click(object sender, EventArgs e)
    {
        ResetQues();
    }

    private void BindRatingTemplate()
    {
        oBll.TemplateID = null;
        oBll.GetRatingTemplate();
        gvRatingTemplate.DataSource = oBll.oDsRatingTemplate;
        gvRatingTemplate.DataBind();
    }
    
    //Method to bind Rating Scales in dropdown
    private void BindRatingScales()
    {
        oBll.RatingScaleID = null;
        oBll.GetRatingScale();
        ddlRatingScale.DataTextField = "Rating_Scale";
        ddlRatingScale.DataValueField = "PK_RatingScaleID";
        ddlRatingScale.DataSource = oBll.oDsRatingScale;
        ddlRatingScale.DataBind();
    }

    //Method to bind Review Period in dropdown
    private void BindReviewPeriod()
    {
        oBll.ReviewPeriodID = null;
        oBll.GetReviewPeriod();        

        oBll.oDsReviewPeriod.Tables[0].Columns.Add("Period", typeof(string), "Period_Name+'('+Start_Date +'-'+ End_Date+')'");
        ddlReviewPeriod.DataTextField = "Period";
        ddlReviewPeriod.DataValueField = "PK_ReviewPeriodID";
        ddlReviewPeriod.DataSource = oBll.oDsReviewPeriod;
        ddlReviewPeriod.DataBind();
    }

    private void Reset()
    {
        hdnTemplateID.Value = "";
        txtTemplateName.Text = "";
        ddlRatingScale.SelectedIndex=0;
        ddlReviewPeriod.SelectedIndex=0;
        txtInstructions.Text = "";        
        ddlStatus.SelectedIndex = 0;
    }

    private void BindQuestions()
    {
        oBll.TemplateID = null;
        oBll.QuesID = null;
        oBll.CompletedBy = null;
        if (hdnTemplateID.Value != "")
            oBll.TemplateID = new Guid(hdnTemplateID.Value);
        oBll.GetRatTemplQues();
        gvQuestions.DataSource = oBll.oDsRatTempQues;
        gvQuestions.DataBind();
    }

    private void ResetQues()
    {
        hdnQuesID.Value = "";
        txtQuestions.Text = "";        
        ddlQuesStatus.SelectedIndex = 0;
    }


}