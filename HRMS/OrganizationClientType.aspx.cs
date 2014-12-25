using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class OrganizationClientType : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {           
            BindCliTypDetails();
            if (Session["UserID"] != null)
            {               
               Security(btnSaveClieTyp, btnResetClieTyp, gvOrgClientType);
             
            }
        }
        lblMsg.Visible = false;
    }

    protected void gvOrgClientType_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus1");
                bool bStatus = Convert.ToBoolean(lblStatus.Text);
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
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }
    
    protected void btnSaveClieTyp_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {            
            hdnOrgID.Value = oBll.OrgID.ToString();           

            if (hdnSno.Value != "")
                oBll.ClientTypeID = new Guid(hdnSno.Value);
            else
                oBll.ClientTypeID = null;
            
            oBll.ClientType = txtClientType.Text;
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;
            oBll.Status = Convert.ToByte(ddlCTypStatus.SelectedValue);
            lblMsg.Text=oBll.InsOrUpdtOrgClientType();
            lblMsg.Visible = true;           
            BindCliTypDetails();
            Reset();
            Security(btnSaveClieTyp, btnResetClieTyp, gvOrgClientType);
        }
    }

    protected void gvOrgClientType_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            Label lblClientType = (Label)gvOrgClientType.Rows[e.NewSelectedIndex].FindControl("lblClientType");
            Label lblSno = (Label)gvOrgClientType.Rows[e.NewSelectedIndex].FindControl("lblSno");
            Label lblStatus = (Label)gvOrgClientType.Rows[e.NewSelectedIndex].FindControl("lblStatus");
            hdnSno.Value = lblSno.Text;

            txtClientType.Text = lblClientType.Text;
            
            ddlCTypStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
            btnSaveClieTyp.Text = "Update";
            
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvOrgClientType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblClientTypeID = (Label)gvOrgClientType.Rows[e.RowIndex].FindControl("lblSno");
        oBll.ClientTypeID = new Guid(lblClientTypeID.Text);
        oBll.DelCliTypDetails();
        BindCliTypDetails();
        Security(btnSaveClieTyp, btnResetClieTyp, gvOrgClientType);
    }

    protected void btnResetClieTyp_Click(object sender, EventArgs e)
    {
        Reset();
        Security(btnSaveClieTyp, btnResetClieTyp, gvOrgClientType);

    }

    private void BindCliTypDetails()
    {
            oBll.ClientTypeID = null;
            oBll.OrgID = null;
            oBll.GetCliTypDetails();
            gvOrgClientType.DataSource = oBll.oDsCliTypDetails;
            gvOrgClientType.DataBind();
        
    }

    private void Reset()
    {
        txtClientType.Text = "";
        ddlCTypStatus.SelectedIndex = 0;
        btnSaveClieTyp.Text = "Save";
        
    }

    private void Security(Button btnSave, Button btnReset, GridView gvSecurity)
    {
        if (Session["pid"] != null)
        {
            if (Session["UserID"].ToString().ToLower() != "admin")
            {
                if (Session["DSEmpDetails"] != null)
                {
                    oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];
                    int flag = 0;
                    for (int iRowCount = 0; iRowCount < oBll.oDsEmpDetails.Tables[0].Rows.Count; iRowCount++)
                    {
                        if (Session["pid"].ToString() == oBll.oDsEmpDetails.Tables[0].Rows[iRowCount]["Pk_PageID"].ToString())
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

    
}