using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class Organization : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {       
        if (!Page.IsPostBack)
        {            
            BindState();            
            BindOrgDetails();
            if (Session["UserID"] != null)
            {
                if (Session["UserID"].ToString().ToLower() != "admin")
                {
                    Security(btnSaveOrg, btnResetOrg);
                }
            }
        }
    }
    protected void btnResetOrg_Click(object sender, EventArgs e)
    {
        Reset(); 
    }
    protected void btnSaveOrg_Click(object sender, EventArgs e)
    {
        if (hdnOrgID.Value != "")
            oBll.OrgID =new Guid(hdnOrgID.Value);
        else
            oBll.OrgID = null; 
        
        oBll.OrgName = txtOrgName.Text;
        oBll.Address1 = txtAdrs1.Text;
        oBll.Address2 = txtAdrs2.Text;
        oBll.City = txtCity.Text;
        if(ddlState.SelectedIndex!=0)
        oBll.State =ddlState.SelectedItem.Value;
        
        oBll.PostalCode = txtPostCode.Text;
        oBll.PhoneNumber = txtPhNum.Text;
        oBll.EmailID = txtMailid.Text;
        oBll.FaxNumber = txtFaxNum.Text;
        oBll.WebsiteUrl = txtWebUrl.Text;
        oBll.CreatedBy = Session["createdBy"].ToString();
        oBll.CreatedDate = System.DateTime.Now;
        oBll.ModifiedBy = Session["modifiedBy"].ToString();
        oBll.ModifiedDate = System.DateTime.Now;
        lblMsg.Text = oBll.InsOrUpdtOrganization();
        lblMsg.Visible = true;
        Reset();
        BindOrgDetails();
    }

    private void BindState()
    {
        DataSet oDsDepartment;
        oDsDepartment = oBll.GetStates();
        ListItem lstState = new ListItem("Select", "0");
        ddlState.Items.Insert(0,lstState);
        ddlState.DataTextField = "State";
        ddlState.DataValueField = "StateID";
        ddlState.DataSource = oDsDepartment;
        ddlState.DataBind();
    }

    private void BindOrgDetails()
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {
            txtOrgName.Text = oBll.OrgName;
            txtAdrs1.Text = oBll.Address1;
            txtAdrs2.Text = oBll.Address2;
            txtCity.Text = oBll.City;
            if (oBll.State != "")
                ddlState.SelectedValue = oBll.State;
            else
                ddlState.SelectedIndex = 0;
            txtPostCode.Text = oBll.PostalCode;
            txtPhNum.Text = oBll.PhoneNumber;
            txtMailid.Text = oBll.EmailID;
            txtFaxNum.Text = oBll.FaxNumber;
            txtWebUrl.Text = oBll.WebsiteUrl;
            hdnOrgID.Value = oBll.OrgID.ToString();
            btnSaveOrg.Text = "Update";
        }
        
    }

    private void Reset()
    {
        txtOrgName.Text = "";
        txtAdrs1.Text = "";
        txtAdrs2.Text = "";
        txtCity.Text = "";
        ddlState.SelectedIndex = 0;
        txtPostCode.Text = "";
        txtPhNum.Text = "";
        txtMailid.Text = "";
        txtFaxNum.Text = "";
        txtWebUrl.Text = "";
    }

    private void Security(Button btnSave,Button btnReset)
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

                    if (oBll.Edit == 'N')
                    {
                        btnSave.Enabled = false;
                        btnReset.Enabled = false;
                    }  
                    else
                    {
                        btnSave.Enabled = true;
                        btnReset.Enabled = true;
                    }  

                    
                }
            }
        }
        else
            Response.Redirect("~/NoAccess.aspx");
    }

}