using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class TimeOffType : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindTimeOffTypeDetails();
            if (Session["UserID"] != null)
            {
                Security(btnSave, btnReset, gvTimeOffType);                
            }
        }
        lblMsg.Visible = false;
    }

    protected void gvTimeOffType_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {
            if (hdnTimeOffTypeID.Value != "")
                oBll.TimeOffTypeID = new Guid(hdnTimeOffTypeID.Value);
            else
                oBll.TimeOffTypeID = null;

            oBll.TimeOffDesc = txtTimeOffDesc.Text;
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;
            oBll.Status = 1;
            lblMsg.Text = oBll.InsOrUpdtTimeOffType();
            lblMsg.Visible = true;
            BindTimeOffTypeDetails();
            Reset();
            Security(btnSave, btnReset, gvTimeOffType);
        }
    }

    protected void gvTimeOffType_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            Label lblTimeOffDesc = (Label)gvTimeOffType.Rows[e.NewSelectedIndex].FindControl("lblTimeOffDesc");
            Label lblTimeOffTypeID = (Label)gvTimeOffType.Rows[e.NewSelectedIndex].FindControl("lblTimeOffTypeID");
            Label lblStatus = (Label)gvTimeOffType.Rows[e.NewSelectedIndex].FindControl("lblStatus");
            hdnTimeOffTypeID.Value = lblTimeOffTypeID.Text;
            txtTimeOffDesc.Text = lblTimeOffDesc.Text;
            ddlStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
            btnSave.Text = "Update";

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvTimeOffType_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblTimeOffTypeID = (Label)gvTimeOffType.Rows[e.RowIndex].FindControl("lblTimeOffTypeID");
        oBll.TimeOffTypeID = new Guid(lblTimeOffTypeID.Text);
        oBll.DelTimeOffType();
        BindTimeOffTypeDetails();
        Security(btnSave, btnReset, gvTimeOffType);
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
        Security(btnSave, btnReset, gvTimeOffType);

    }

    private void BindTimeOffTypeDetails()
    {
        oBll.TimeOffTypeID = null;        
        oBll.GetTimeOffType();
        gvTimeOffType.DataSource = oBll.oDsTimeOffType;
        gvTimeOffType.DataBind();

    }

    private void Reset()
    {
        txtTimeOffDesc.Text = "";
        ddlStatus.SelectedIndex = 0;
        btnSave.Text = "Save";

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