using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.Data;

public partial class MyProjects : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if (!Page.IsPostBack)
        {
            BindClients();
            BindProjectDetails();
            if (Session["UserID"] != null)
            {
                if (Session["UserID"].ToString().ToLower() != "admin")
                {
                    Security(gvProjectDetails);
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

    
    protected void gvProjectDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblProjID = (Label)gvProjectDetails.Rows[e.NewSelectedIndex].FindControl("lblProjID");
        Label lblOrgEmpID = (Label)gvProjectDetails.Rows[e.NewSelectedIndex].FindControl("lblOrgEmpID");
        oBll.OrgProjectID = new Guid(lblProjID.Text);        
        oBll.OrgEmpId = new Guid(lblOrgEmpID.Text);
        oBll.GetProjects();
        txtProjCode.Text = oBll.ProjCode;
        txtProjName.Text = oBll.ProjName;
        txtProjDesc.Text = oBll.ProjDesc;
        txtStartDate.Text = Convert.ToDateTime(oBll.StartDate).ToString("MM/dd/yyyy");
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

        ddlStatus.SelectedValue = Convert.ToByte(oBll.Status).ToString();

        gvProjectDetails.Visible = false;
        divProject.Visible = true;
        
       

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
        oBll.OrgProjectID = null;
        if (Session["EmpID"] != null)
            oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
        oBll.GetProjects();
        gvProjectDetails.DataSource = oBll.oDsProjDetails;
        gvProjectDetails.DataBind();
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
        ddlStatus.SelectedIndex = 0;
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

    

    private void Security(GridView gvSecurity)
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
               
            }
        }
        else
            Response.Redirect("~/NoAccess.aspx");
    }

}