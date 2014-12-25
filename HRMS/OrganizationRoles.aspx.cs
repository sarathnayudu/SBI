using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class OrganizationRoles : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {       
        
        BindOrgRoles();
        if (!Page.IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                Security(btnSaveRole, btnResetRole, gvOrgRoles);
                
            }
        }
    }

    protected void gvOrgRoles_RowDataBound(object sender, GridViewRowEventArgs e)
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
   
    protected void btnSaveRole_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID!=null)
        {
            if (hdnOrgRoleID.Value != "")
            {
                oBll.OrgRoleID = new Guid(hdnOrgRoleID.Value);
            }
            else
                oBll.OrgRoleID = null;
          
            oBll.OrgRoleName = txtRoleName.Text;
            oBll.OrgRoleDesc = txtRoleDesc.Text;
            oBll.Status = Convert.ToByte(ddlStatus.SelectedValue);
            lblMsg.Text = oBll.InsOrUpdtOrgRoles();
            lblMsg.Visible = true;
            Reset();
            BindOrgRoles();
            hdnOrgRoleID.Value = "";
            Security(btnSaveRole, btnResetRole, gvOrgRoles);
        }
    }

    protected void gvOrgRoles_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblSno = (Label)gvOrgRoles.Rows[e.NewSelectedIndex].FindControl("lblSno");
        Label lblRoleName = (Label)gvOrgRoles.Rows[e.NewSelectedIndex].FindControl("lblRoleName");
        Label lblRoleDesc = (Label)gvOrgRoles.Rows[e.NewSelectedIndex].FindControl("lblRoleDesc");
        Label lblStatus = (Label)gvOrgRoles.Rows[e.NewSelectedIndex].FindControl("lblStatus");
        hdnOrgRoleID.Value = lblSno.Text;
        txtRoleName.Text = lblRoleName.Text;
        txtRoleDesc.Text = lblRoleDesc.Text;
        ddlStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
        btnSaveRole.Text = "Update";
        btnSaveRole.Enabled = true;
        btnResetRole.Enabled = true;

    }

    protected void btnResetRole_Click(object sender, EventArgs e)
    {
        Reset();
        Security(btnSaveRole, btnResetRole, gvOrgRoles);
    }

    private void BindOrgRoles()
    {
        oBll.OrgRoleID = null;
        oBll.OrgID = null;
        oBll.GetOrgRoles();
        gvOrgRoles.DataSource = oBll.oDsOrgRoles;
        gvOrgRoles.DataBind();
    }

    private void Reset()
    {
         txtRoleName.Text = "";
         txtRoleDesc.Text = "";
         ddlStatus.SelectedIndex = 0;
         hdnOrgRoleID.Value = "";
         btnSaveRole.Text = "Save";
    }

    protected void gvOrgRoles_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblOrgRoleID = (Label)gvOrgRoles.Rows[e.RowIndex].FindControl("lblSno");
        Label lblOrgRoleName = (Label)gvOrgRoles.Rows[e.RowIndex].FindControl("lblRoleName");
        Label lblRoleDesc = (Label)gvOrgRoles.Rows[e.RowIndex].FindControl("lblRoleDesc");
        oBll.OrgRoleID = new Guid(lblOrgRoleID.Text);
        oBll.DelOrgRoles();
        BindOrgRoles();
        Security(btnSaveRole, btnResetRole, gvOrgRoles);
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