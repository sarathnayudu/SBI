using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;


public partial class Employee : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        lblMsg.Text = "";
        if (!Page.IsPostBack)
        {
            BindState();//Invoking method to insert US state list in dropdown
            BindEmpolyeeDetails();//Invoking method to bind grid with employees
            BindOrgRoles();//Invoking method to insert Organization roles in dropdown
            if (Session["UserID"] != null)
            {
                if (Session["UserID"].ToString().ToLower() != "admin")
                {
                    Security(lnkBtnNewEmp, gvEmployeeDetails);//Calling a method for security permission to be given this user
                }
            }
        }
    }

    protected void gvEmployeeDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");
                bool bStatus = Convert.ToBoolean(lblStatus.Text);
                //Displaying the employee's status on the basis of true or false of his/her activeness
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
    //Code to implement paging of employee list grid
    protected void gvEmployeeDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        try
        {
            gvEmployeeDetails.PageIndex = e.NewPageIndex;
            BindEmpolyeeDetails();
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    //Code to save the employee details
    protected void btnSave_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)//Checking if organization details are there else no employee entry can take place
        {
            // Filling up all the entered textfields to the BLL properties to perform employee insert function
            if (hdnEmpID.Value != "")
                oBll.OrgEmpId = new Guid(hdnEmpID.Value);
            else
            {
                oBll.OrgEmpId = null;
            }
            if (ddlRole.SelectedIndex == 0)
                oBll.OrgRoleID = null;
            else
                oBll.OrgRoleID = new Guid(ddlRole.SelectedValue);
            oBll.OrgEmpCode = txtIBSID.Text;
            oBll.FirstName = txtFName.Text;
            oBll.MiddleName = txtMName.Text;
            oBll.LastName = txtLName.Text;
            oBll.Prefix = Convert.ToString(ddlPrefix.SelectedValue);
            oBll.CellPhone = txtCellphone.Text;
            oBll.HomePhone = txtHomePhone.Text;
            oBll.BuisinessPhone = txtBusPhone.Text;
            if (txtExt.Text != "")
                oBll.BuisinessPhone = oBll.BuisinessPhone + "-" + txtExt.Text;
            oBll.EmailID = txtEMail.Text;
            oBll.AltContactEmailAddress = txtAltEmail.Text;
            // oBll.FaxNumber = txtFax.Text;
            oBll.Status = Convert.ToByte(ddlStatus.SelectedValue);
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;

            oBll.Address1 = txtAddress1.Text;
            oBll.Address2 = txtAddress2.Text;
            oBll.City = txtCity.Text;
            if (ddlState.SelectedIndex != 0)
                oBll.State = ddlState.SelectedItem.Value;
            else
                oBll.State = null;

            oBll.PostalCode = txtZip.Text;
            oBll.AddressPers1 = txtPAddrss1.Text;
            oBll.AddressPers2 = txtpAddress2.Text;
            oBll.CityPers = txtpCity.Text;
            if (ddlPState.SelectedIndex != 0)
                oBll.StatePers = ddlPState.SelectedItem.Value;
            else
                oBll.StatePers = null;
            oBll.PostalCodePers = txtPZip.Text;
            oBll.JobTitle = txtJobTitle.Text;
            oBll.LoginPassword = txtPassword.Text;
            if (txtHiredDate.Text != "")
                oBll.HiredDate = Convert.ToDateTime(txtHiredDate.Text);
            if (txtTerminatDate.Text != "")
                oBll.TerminationDate = Convert.ToDateTime(txtTerminatDate.Text);
            else
                oBll.TerminationDate = null;
            oBll.EmpCateg = txtEmpCateg.Text;
            if(txtEmpSal.Text!="")
                oBll.EmpSal =Convert.ToDecimal(txtEmpSal.Text);
            oBll.DocNo = txtDocNumber.Text;
            if(txtDocExpDt.Text!="")
            oBll.DocExpDate = Convert.ToDateTime(txtDocExpDt.Text);
            oBll.LcaNo = txtLCANo.Text;
            if (txtLCAExpDt.Text != "")
            oBll.LcaExpDate = Convert.ToDateTime(txtLCAExpDt.Text);
            oBll.PermCertNo = txtPermCertNo.Text;
            oBll.I140No = txtI140No.Text;
            oBll.I485No = txtI485No.Text;

            lblMsg.Text = oBll.InsOrUpdtOrgEmployees();//Saving the employee details
            lblMsg.Visible = true;
            BindEmpolyeeDetails();//Refreshing the employee grid after saving it

            divEmployee.Visible = false;
            gvEmployeeDetails.Visible = true;
            lnkBtnNewEmp.CommandArgument = "Add";
            lnkBtnNewEmp.Text = "Add New Employee Details";

        }

    }

    //Code to display the employee entry form or employee list grid or employee update form as per click
    protected void lnkBtnNewEmp_Click(object sender, EventArgs e)
    {
        if (lnkBtnNewEmp.CommandArgument.ToString() == "Add")
        {
            divEmployee.Visible = true;
            gvEmployeeDetails.Visible = false;
            hdnEmpID.Value = "";
            lnkBtnNewEmp.CommandArgument = "Back";
            lnkBtnNewEmp.Text = "Back to Employee Details";
            Reset();
            btnSave.Text = "Save";
        }
        else
        {

            divEmployee.Visible = false;
            gvEmployeeDetails.Visible = true;
            lnkBtnNewEmp.CommandArgument = "Add";
            lnkBtnNewEmp.Text = "Add New Employee Details";
        }
        lblMsg.Visible = false;

    }

    //Code to fetch existing employee's records and assign it to the fields
    protected void gvEmployeeDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

        Label lblIbsid = (Label)gvEmployeeDetails.Rows[e.NewSelectedIndex].FindControl("lblIbsid");//Fetching the employee id from grid
        oBll.OrgEmpId = new Guid(lblIbsid.Text);
        hdnEmpID.Value = lblIbsid.Text;

        oBll.GetOrgEmpDetails();
        txtIBSID.Text = oBll.OrgEmpCode;
        txtFName.Text = oBll.FirstName;
        txtMName.Text = oBll.MiddleName;
        txtLName.Text = oBll.LastName;
        ddlPrefix.SelectedValue = oBll.Prefix;
        txtCellphone.Text = oBll.CellPhone;
        txtHomePhone.Text = oBll.HomePhone;
        string[] strPhone = oBll.BuisinessPhone.Split('-');
        txtBusPhone.Text = strPhone[0];
        if (strPhone.Length > 1)
            txtExt.Text = strPhone[1];
        else
            txtExt.Text = "";
        
        txtEMail.Text = oBll.EmailID;
        txtAltEmail.Text = oBll.AltContactEmailAddress;
        ddlStatus.SelectedValue = oBll.Status.ToString();
        if (oBll.OrgRoleID != null)
            ddlRole.SelectedValue = oBll.OrgRoleID.ToString();
        else
            ddlRole.SelectedIndex = 0;

        txtAddress1.Text = oBll.Address1;
        txtAddress2.Text = oBll.Address2;
        txtCity.Text = oBll.City;
        if (oBll.State != "")
            ddlState.SelectedValue = oBll.State;
        else
            ddlState.SelectedIndex = 0;
        txtZip.Text = oBll.PostalCode;
        txtPAddrss1.Text = oBll.AddressPers1;
        txtpAddress2.Text = oBll.AddressPers2;
        txtpCity.Text = oBll.CityPers;
        if (oBll.StatePers != "")
            ddlPState.SelectedValue = oBll.StatePers;
        else
            ddlPState.SelectedIndex = 0;

        txtPZip.Text = oBll.PostalCodePers;
        txtJobTitle.Text = oBll.JobTitle;
        txtPassword.Attributes["value"] = oBll.LoginPassword;
        txtPassword.Text = oBll.LoginPassword;
        txtHiredDate.Text = oBll.HiredDate.ToString();
        txtTerminatDate.Text = oBll.TerminationDate.ToString();

        txtEmpCateg.Text=oBll.EmpCateg ;        
        txtEmpSal.Text= oBll.EmpSal.ToString();
         txtDocNumber.Text=oBll.DocNo;
         txtDocExpDt.Text = oBll.DocExpDate.ToString();
        txtLCANo.Text=oBll.LcaNo ;
        txtLCAExpDt.Text=oBll.LcaExpDate.ToString() ;
         txtPermCertNo.Text=oBll.PermCertNo;
        txtI140No.Text=oBll.I140No ;
        txtI485No.Text=oBll.I485No;

        gvEmployeeDetails.Visible = false;
        //tcEmployee.Visible = true;
        divEmployee.Visible = true;
        lnkBtnNewEmp.CommandArgument = "Back";
        lnkBtnNewEmp.Text = "Back to Employee Details";
        btnSave.Text = "Update";
    }

    //Code to delete any employee record
    protected void gvEmployeeDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblIbsid = (Label)gvEmployeeDetails.Rows[e.RowIndex].FindControl("lblIbsid");
        oBll.OrgEmpId = new Guid(lblIbsid.Text);
        oBll.DelOrgEmpDetails();
        BindEmpolyeeDetails();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void btnResetBuss_Click(object sender, EventArgs e)
    {
        Reset();

    }
    protected void btnResetPer_Click(object sender, EventArgs e)
    {
        Reset();

    }
    protected void btnResetProff_Click(object sender, EventArgs e)
    {
        Reset();
    }
    //Method to bind employee list to grid
    private void BindEmpolyeeDetails()
    {
        oBll.OrgEmpId = null;
        oBll.GetOrgEmpDetails();
        gvEmployeeDetails.DataSource = oBll.oDsOrgEmpDetails;
        gvEmployeeDetails.DataBind();
    }
    //Method to Bind state list to dropdown
    private void BindState()
    {
        DataSet oDsDepartment;
        oDsDepartment = oBll.GetStates();
        ListItem lstState = new ListItem("Select", "0");
        ddlState.Items.Insert(0, lstState);
        ddlPState.Items.Insert(0, lstState);
        ddlState.DataTextField = ddlPState.DataTextField = "State";
        ddlState.DataValueField = ddlPState.DataValueField = "StateID";
        ddlState.DataSource = ddlPState.DataSource = oDsDepartment;
        ddlState.DataBind();
        ddlPState.DataBind();
    }

    //Method to bind Organization roles to dropdown
    private void BindOrgRoles()
    {
        oBll.OrgRoleID = null;
        oBll.OrgID = null;
        oBll.GetOrgRoles();
        ListItem lstRole = new ListItem("Select", "0");
        ddlRole.Items.Insert(0, lstRole);
        ddlRole.DataTextField = "Org_Role_Name";
        ddlRole.DataValueField = "PK_Org_RoleID";
        ddlRole.DataSource = oBll.oDsOrgRoles;
        ddlRole.DataBind();
    }

    //Resetting the fields
    private void Reset()
    {
        txtIBSID.Text = "";
        txtFName.Text = "";
        txtMName.Text = "";
        txtLName.Text = "";
        txtEMail.Text = "";
        txtAltEmail.Text = "";
        txtCellphone.Text = "";
        txtHomePhone.Text = "";
        txtBusPhone.Text = "";
        txtExt.Text = "";
        ddlStatus.SelectedIndex = 0;
        ddlRole.SelectedIndex = 0;

        txtAddress1.Text = "";
        txtAddress2.Text = "";
        txtCity.Text = "";
        ddlState.SelectedIndex = 0;
        txtZip.Text = "";

        txtPAddrss1.Text = "";
        txtpAddress2.Text = "";
        txtpCity.Text = "";
        ddlPState.SelectedIndex = 0;
        txtPZip.Text = "";

        txtJobTitle.Text = "";
        txtPassword.Text = "";
        txtPassword.Attributes["value"] = "";
        txtHiredDate.Text = "";
        txtTerminatDate.Text = "";
        
        txtEmpCateg.Text = "";
        txtEmpSal.Text = "";
        txtDocNumber.Text = "";
        txtDocExpDt.Text = "";
        txtLCANo.Text = "";
        txtLCAExpDt.Text = "";
        txtPermCertNo.Text = "";
        txtI140No.Text = "";
        txtI485No.Text = "";

    }
    //Code to show the employee records as per their entries in search textfields
    protected void txtName_TextChanged(object sender, EventArgs e)
    {
        TextBox txtSearch = (TextBox)sender;
        if (txtSearch.ID.ToString() == "txtName")
            AssignTextValues(txtSearch.Text, null, null, null, null, null,null);
        else if (txtSearch.ID.ToString() == "txtLastName")
            AssignTextValues(null, txtSearch.Text, null, null, null, null,null);
        else if (txtSearch.ID.ToString() == "txtCellPhone")
            AssignTextValues(null, null, txtSearch.Text, null, null, null, null);
        else if (txtSearch.ID.ToString() == "txtHomePhone")
            AssignTextValues(null, null, null, txtSearch.Text, null, null, null);
        else if (txtSearch.ID.ToString() == "txtBusinessPhone")
            AssignTextValues(null, null, null, null, txtSearch.Text, null, null);
        else if (txtSearch.ID.ToString() == "txtEmailID")
            AssignTextValues(null, null, null, null, null, txtSearch.Text, null);
        
    }

    protected void ddlActiveStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownList ddlActiveStatus = (DropDownList)sender;
            if (ddlActiveStatus.SelectedIndex != 0 && ddlActiveStatus.SelectedIndex != 1)
            {               
                AssignTextValues(null, null, null, null, null, null, Convert.ToByte(ddlActiveStatus.SelectedItem.Value));
            }
            else
            {
                AssignTextValues(null, null, null, null, null, null,null);
            }
           
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }
    //Method to show the employee records as per their entries in search textfields
    private void AssignTextValues(string strFirstName,string strLastName,string strCellPhone,string strHomePhone,string strBusinessPhone,string strEmailID,byte? bStatus)
    {
        oBll.FirstName = strFirstName;
        oBll.LastName = strLastName;
        oBll.CellPhone = strCellPhone;
        oBll.HomePhone = strHomePhone;
        oBll.BuisinessPhone = strBusinessPhone;
        oBll.EmailID = strEmailID;
        oBll.ActiveStatus = bStatus;
        oBll.SearchOrgEmpDetails();
        gvEmployeeDetails.DataSource = oBll.oDsOrgEmpDetails;
        gvEmployeeDetails.DataBind();
    }

    /* Method to provide security privileges to different user login*/
    private void Security(LinkButton lnkBtnSecurity, GridView gvSecurity)
    {
        if (Request.QueryString["pid"] != null)//pid = pageid
        {
            if (Session["DSEmpDetails"] != null)//Dataset with the logged in employee records
            {
                oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];
                int flag = 0;
                for (int iRowCount = 0; iRowCount < oBll.oDsEmpDetails.Tables[0].Rows.Count; iRowCount++)
                {//checking if the requested page id is in the permission list of the user
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

                if (flag == 0 || oBll.View == 'N')//if user doesn't have permission to access "NoAccess page" will be displayed
                    Response.Redirect("~/NoAccess.aspx");
                else if (flag == 1)
                {
                    if (oBll.Add == 'Y')
                        lnkBtnSecurity.Visible = true;
                    else
                        lnkBtnSecurity.Visible = false;

                    //Making buttons enabled or disabled as per privilege
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

}