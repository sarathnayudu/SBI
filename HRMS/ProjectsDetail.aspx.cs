using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;

public partial class ProjectsDetail : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!Page.IsPostBack)
        {
            BindClients();
            BindProjectDetails();
            BindEmpolyee();
            if (Session["UserID"] != null)
            {
                if (Session["UserID"].ToString().ToLower() != "admin")
                {
                    Security(lnkBtnProj, gvProjectDetails);
                }
            }
        }

    }

    protected void gvProjectDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
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

    protected void lnkBtnProj_Click(object sender, EventArgs e)
    {
        if (lnkBtnProj.CommandArgument.ToString() == "Add")
        {
            //tcVendor.Visible = true;
            divProject.Visible = true;
            gvProjectDetails.Visible = false;
            pnlSearch.Visible = false;
            hdnProjectsID.Value = "";
            lnkBtnProj.CommandArgument = "Back";
            lnkBtnProj.Text = "Back to Projects Detail";
            Reset();

        }
        else
        {
            //tcVendor.Visible = false;
            divProject.Visible = false;
            gvProjectDetails.Visible = true;
            pnlSearch.Visible = true;
            lnkBtnProj.CommandArgument = "Add";
            lnkBtnProj.Text = "Add New Project Detail";
        }
        lblMsg.Visible = false;

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {
            if (hdnProjectsID.Value != "")
                oBll.OrgProjectID = new Guid(hdnProjectsID.Value);
            else
                oBll.OrgProjectID = null;
            oBll.OrgEmpId = new Guid(ddlEmployee.SelectedItem.Value);
            //if (Session["EmpID"] != null)
            //    oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
            //else
            //    oBll.OrgEmpId = null;

                oBll.ProjCode = txtProjCode.Text;
                oBll.ProjName = txtProjName.Text;
                oBll.ProjDesc = txtProjDesc.Text;
                if (txtStartDate.Text != "")
                    oBll.StartDate = Convert.ToDateTime(txtStartDate.Text);
                if (txtStartDate.Text != "")
                    oBll.EndDate = Convert.ToDateTime(txtEndDate.Text);

                if (ddlClient1.SelectedIndex != 0)
                    oBll.Client1 = new Guid(ddlClient1.SelectedItem.Value);

                if (ddlClient2.SelectedIndex != 0)
                    oBll.Client2 = new Guid(ddlClient2.SelectedItem.Value);

                if (ddlEndClient.SelectedIndex != 0)
                    oBll.EndClient = new Guid(ddlEndClient.SelectedItem.Value);

                if (txtBillRate.Text != "")
                    oBll.BillRate = Convert.ToDecimal(txtBillRate.Text);
                if (ddlTmCycle.SelectedIndex != 0)
                    oBll.BillingCycle = Convert.ToInt32(ddlTmCycle.SelectedItem.Value);
                if (ddlOvertime.SelectedIndex != 0)
                    oBll.OverTimeAllow = Convert.ToByte(ddlOvertime.SelectedItem.Value);
                if (txtOvertimeRate.Text != "")
                    oBll.OverTimeRate = Convert.ToDecimal(txtOvertimeRate.Text);

                oBll.Status = Convert.ToByte(ddlStatus.SelectedValue);
                oBll.CreatedBy = Session["createdBy"].ToString();
                oBll.CreatedDate = System.DateTime.Now;
                oBll.ModifiedBy = Session["modifiedBy"].ToString();
                oBll.ModifiedDate = System.DateTime.Now;
                oBll.EmailCC = txtEmailCC.Text;
                oBll.EmailTo = txtEmailTo.Text;
                oBll.Terms = txtTerms.Text;

                lblMsg.Text = oBll.InsOrUpdtProjects();
                lblMsg.Visible = true;
                BindProjectDetails();

                divProject.Visible = false;
                gvProjectDetails.Visible = true;
                pnlSearch.Visible = true;
                lnkBtnProj.CommandArgument = "Add";
                lnkBtnProj.Text = "Add New Project Detail";
            

        }

    }

    protected void gvProjectDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblProjID = (Label)gvProjectDetails.Rows[e.NewSelectedIndex].FindControl("lblProjID");
        Label lblOrgEmpID = (Label)gvProjectDetails.Rows[e.NewSelectedIndex].FindControl("lblOrgEmpID");
        oBll.OrgProjectID = new Guid(lblProjID.Text);
        hdnProjectsID.Value = lblProjID.Text;
        hdnOrgEmpID.Value = lblOrgEmpID.Text;
        if (Session["EmpID"] != null)
            oBll.OrgEmpId = new Guid(lblOrgEmpID.Text);
            oBll.GetProjects();
            ddlEmployee.SelectedValue = oBll.OrgEmpId.ToString();
            txtProjCode.Text = oBll.ProjCode;
            txtProjName.Text = oBll.ProjName;
            txtProjDesc.Text = oBll.ProjDesc;
            txtStartDate.Text =Convert.ToDateTime(oBll.StartDate).ToString("MM/dd/yyyy");
            txtEndDate.Text = Convert.ToDateTime(oBll.EndDate).ToString("MM/dd/yyyy");

            if (oBll.Client1 != null)
                ddlClient1.SelectedValue = oBll.Client1.ToString();
            else
                ddlClient1.SelectedIndex = 0;

            if (oBll.Client2 != null)
                ddlClient2.SelectedValue = oBll.Client2.ToString();
            else
                ddlClient2.SelectedIndex = 0;

            if (oBll.EndClient != null)
                ddlEndClient.SelectedValue = oBll.EndClient.ToString();
            else
                ddlEndClient.SelectedIndex = 0;

            if (oBll.BillRate != null)
                txtBillRate.Text = oBll.BillRate.ToString();
            if (oBll.BillingCycle != null)
                ddlTmCycle.SelectedValue = oBll.BillingCycle.ToString();
            else
                ddlTmCycle.SelectedIndex = 0;
            if (oBll.OverTimeAllow != null)
                ddlOvertime.SelectedValue = oBll.OverTimeAllow.ToString();
            else
                ddlOvertime.SelectedIndex = 0;
            if (oBll.OverTimeRate != null)
                txtOvertimeRate.Text = oBll.OverTimeRate.ToString();

            ddlStatus.SelectedValue = Convert.ToByte(oBll.Status).ToString();

            txtTerms.Text = oBll.Terms;
            txtEmailTo.Text = oBll.EmailTo;
            txtEmailCC.Text = oBll.EmailCC;

            gvProjectDetails.Visible = false;
            pnlSearch.Visible = false;
            divProject.Visible = true;
            btnSave.Text = "Update";
            lnkBtnProj.CommandArgument = "Back";
            lnkBtnProj.Text = "Back to Customer Details";
        
    }

    protected void gvProjectDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblProjID = (Label)gvProjectDetails.Rows[e.RowIndex].FindControl("lblProjID");
        oBll.OrgProjectID = new Guid(lblProjID.Text);
        oBll.DelProjects();
        BindProjectDetails();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void btnResShip_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void btnResBillAddr_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private void BindProjectDetails()
    {
        txtSearch.Text = string.Empty;
        oBll.OrgProjectID = null;
        oBll.OrgEmpId = null;
        oBll.GetProjects();
        gvProjectDetails.DataSource = oBll.oDsProjDetails;
        gvProjectDetails.DataBind();
    }
    private void BindEmpolyee()
    {
        oBll.OrgEmpId = null;
        oBll.GetOrgEmpDetails();
        oBll.oDsOrgEmpDetails.Tables[0].Columns.Add("Emp_Name",typeof(string),"Emp_Fname +' '+ Emp_LName");
        ListItem lstEmployee = new ListItem("Select", "0");
        ddlEmployee.Items.Insert(0, lstEmployee);
        ddlEmployee.DataTextField = "Emp_Name";
        ddlEmployee.DataValueField = "PK_Org_EmpID";
        ddlEmployee.DataSource = oBll.oDsOrgEmpDetails;
        ddlEmployee.DataBind();
    }


    private void Reset()
    {
        txtProjCode.Text = "";
        txtProjName.Text = "";
        txtProjDesc.Text = "";
        txtStartDate.Text = "";
        txtEndDate.Text = "";
        ddlClient1.SelectedIndex = 0;
        ddlClient2.SelectedIndex = 0;
        ddlEndClient.SelectedIndex = 0;
        txtBillRate.Text = "";
        ddlTmCycle.SelectedIndex = 0;
        ddlStatus.SelectedIndex = 0;
        ddlOvertime.SelectedIndex = 0;
        txtOvertimeRate.Text = "";
        txtTerms.Text = "";
        txtEmailTo.Text = "";
        txtEmailCC.Text = "";
     
    }

    private void BindClients()
    {
        oBll.CustID = null;
        oBll.GetOrgCustDetails();
        ListItem lstClient = new ListItem("Select", "0");
        ddlClient1.Items.Insert(0, lstClient);
        ddlClient2.Items.Insert(0, lstClient);
        ddlEndClient.Items.Insert(0, lstClient);
        ddlClient1.DataTextField = ddlClient2.DataTextField = ddlEndClient.DataTextField = "Cust_Name";
        ddlClient1.DataValueField = ddlClient2.DataValueField = ddlEndClient.DataValueField = "PKCustID";
        ddlClient1.DataSource = ddlClient2.DataSource = ddlEndClient.DataSource = oBll.oDsOrgCustDetails;
        ddlClient1.DataBind();
        ddlClient2.DataBind();
        ddlEndClient.DataBind();
    }



    private void Security(LinkButton lnkBtnSecurity, GridView gvSecurity)
    {
        if (Request.QueryString["pid"] != null)
        {
            if (Session["DSEmpDetails"] != null)
            {
                oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];
                int flag = 0;
                for (int iRowCount = 0; iRowCount < oBll.oDsEmpDetails.Tables[0].Rows.Count; iRowCount++)
                {
                    if (Request.QueryString["pid"].ToString() == oBll.oDsEmpDetails.Tables[0].Rows[iRowCount]["Pk_PageID"].ToString())
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
                        lnkBtnSecurity.Visible = true;
                    else
                        lnkBtnSecurity.Visible = false;
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
        else
            Response.Redirect("~/NoAccess.aspx");
    }

    protected void btnProjSearch_Click(object sender, EventArgs e)
    {
        SearchProjectDetails(txtSearch.Text);
    }

    private void SearchProjectDetails(string p)
    {
        gvProjectDetails.DataSource = oBll.SearchProjects(p);
        gvProjectDetails.DataBind();
    }
}