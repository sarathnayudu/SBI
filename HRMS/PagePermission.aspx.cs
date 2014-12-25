using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class PagePermission : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {            
            BindOrgRoles();
            BindPages();
            BindPagesPermissions();
            if (Session["UserID"] != null)
            {
                if (Session["UserID"].ToString().ToLower() != "admin")
                {
                   Security(btnSave);
                }
            }
            
        }
    }

    protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPagesPermissions();
        foreach (GridViewRow gvRow in gvPagePermissions.Rows)
        {
            Label lblRoleID = (Label)gvPagePermissions.Rows[gvRow.RowIndex].FindControl("lblRoleID");
            if (lblRoleID.Text != ddlRole.SelectedItem.Value && ddlRole.SelectedItem.Text.ToLower()!="admin")
                gvPagePermissions.Rows[gvRow.RowIndex].Visible = false;
        }
    }
    protected void ddlPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindPagesPermissions();
        
        foreach (GridViewRow gvRow in gvPagePermissions.Rows)
        {
            Label lblPageID = (Label)gvPagePermissions.Rows[gvRow.RowIndex].FindControl("lblPageID");
            if (lblPageID.Text != ddlPages.SelectedItem.Value && ddlPages.SelectedIndex != 0)
                gvPagePermissions.Rows[gvRow.RowIndex].Visible = false;
        }
    }

    protected void gvPagePermissions_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblRolePermissionID = (Label)e.Row.FindControl("lblRolePermissionID");
                CheckBoxList chkPermissions = (CheckBoxList)e.Row.FindControl("chkPermissions");


                for (int i = 0; i < oBll.oDsPagePermissions.Tables[0].Rows.Count; i++)
                {
                    if (oBll.oDsPagePermissions.Tables[0].Rows[i]["PK_RolePermission_ID"].ToString() == lblRolePermissionID.Text)
                    {
                        string[] strChkPermission = oBll.oDsPagePermissions.Tables[0].Rows[i]["PermissionType"].ToString().Split(',');
                        for (int j = 0; j < strChkPermission.Length; j++)
                        {
                            if (strChkPermission[j] == "A")
                                chkPermissions.Items[0].Selected = true;
                            else if (strChkPermission[j] == "V")
                                chkPermissions.Items[1].Selected = true;
                            else if (strChkPermission[j] == "D")
                                chkPermissions.Items[2].Selected = true;
                            else if (strChkPermission[j] == "E")
                                chkPermissions.Items[3].Selected = true;
                        }
                        break;
                    }
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
        if (Session["createdBy"] != null)
            oBll.CreatedBy = Session["createdBy"].ToString();
        if (Session["modifiedBy"] != null)
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
        foreach (GridViewRow gvRow in gvPagePermissions.Rows)
        {
            Label lblRolePermissionID = (Label)gvPagePermissions.Rows[gvRow.RowIndex].FindControl("lblRolePermissionID");
            Label lblRoleID = (Label)gvPagePermissions.Rows[gvRow.RowIndex].FindControl("lblRoleID");
            Label lblPageID = (Label)gvPagePermissions.Rows[gvRow.RowIndex].FindControl("lblPageID");
            CheckBoxList chkPermissions = (CheckBoxList)gvPagePermissions.Rows[gvRow.RowIndex].FindControl("chkPermissions");
            
            if (lblRolePermissionID.Text != "")
                oBll.RolePermissionID = new Guid(lblRolePermissionID.Text);
            else
                oBll.RolePermissionID = null;
            
            if (lblRoleID.Text != "")
                oBll.OrgRoleID = new Guid(lblRoleID.Text);
            else
                oBll.OrgRoleID = null;
          
            if (lblPageID.Text != "")
                oBll.PageID = new Guid(lblPageID.Text);
            else
                oBll.PageID = null;
            oBll.PermissionType = "";
            for (int iRowCount = 0; iRowCount < chkPermissions.Items.Count; iRowCount++)
            {
                
                if (chkPermissions.Items[iRowCount].Selected == true)
                {
                    if (oBll.PermissionType == "")
                        oBll.PermissionType = chkPermissions.Items[iRowCount].Value;
                    else
                        oBll.PermissionType += "," + chkPermissions.Items[iRowCount].Value;
                }
            }

            oBll.Status = 1;

            oBll.InsOrUpdtRolePermissions();
            if (Session["UserID"] != null)
            {
                oBll.OrgEmpCode = Session["UserID"].ToString();
                oBll.GetUserDetail();
                Session["DSEmpDetails"] = oBll.oDsEmpDetails;
            }
        }

        BindPagesPermissions();
    }

    private void BindOrgRoles()
    {
        oBll.OrgRoleID = null;
        oBll.OrgID = null;
        oBll.GetOrgRoles();        
        ddlRole.DataTextField = "Org_Role_Name";
        ddlRole.DataValueField = "PK_Org_RoleID";
        ddlRole.DataSource = oBll.oDsOrgRoles;
        ddlRole.DataBind();
    }

    private void BindPages()
    {
        
        oBll.PageID = null;
        oBll.GetPageDetails();
        ListItem lstPages = new ListItem("Select", "0");
        ddlPages.Items.Insert(0, lstPages);
        ddlPages.DataTextField = "Page_Name";
        ddlPages.DataValueField = "Pk_PageID";
        ddlPages.DataSource = oBll.oDsPageDetails;
        ddlPages.DataBind();
    }

    private void BindPagesPermissions()
    {
        oBll.RolePermissionID = null;
        oBll.GetRolePermissions();        
        gvPagePermissions.DataSource = oBll.oDsPagePermissions;
        gvPagePermissions.DataBind();
    }

    private void Security(Button btnSave)
    {
        if (Session["pid"] != null)
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
                    if (oBll.Add == 'Y' || oBll.Edit == 'Y')
                    {
                        btnSave.Enabled = true;
                    }
                    else
                    {
                        btnSave.Enabled = false;
                    }
                }
            }
        }
        else
            Response.Redirect("~/NoAccess.aspx");
        
    }


    
}