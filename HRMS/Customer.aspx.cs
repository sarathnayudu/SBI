using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class Customer : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        lblMsg.Text = "";
        if (!Page.IsPostBack)
        {
            BindState();
            BindCustomerDetails();
            if (Session["UserID"] != null)
            {
                if (Session["UserID"].ToString().ToLower() != "admin")
                {
                    Security(lnkBtnNewCust, gvCustomerDetails);
                }
            }
        }        
    }
    
    protected void gvCustomerDetails_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {
            if (hdnCustID.Value != "")
                oBll.CustID = new Guid(hdnCustID.Value);
            else
                oBll.CustID = null;
            
            oBll.CustName = txtCustName.Text;
            oBll.WebsiteUrl = txtWebUrl.Text;
            oBll.PhoneNumber = txtPhNum.Text;
            oBll.FaxNumber = txtFaxNum.Text;
            oBll.ContactName = txtContName.Text;
            oBll.ContactEmailAddress = txtContEmailid.Text;
            oBll.ContactPhoneNumber = txtContPhnum.Text;
            oBll.AltContactName = txtAltContName.Text;
            oBll.AltContactEmailAddress = txtAltContEmail.Text;
            oBll.AltContactPhoneNumber = txtAltContPhnum.Text;
            oBll.Status = Convert.ToByte(ddlStatus.SelectedValue);
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;
            oBll.ShipToAddr1 = txtShipAdrs1.Text;
            oBll.ShipToAddr2 = txtShipAdrs2.Text;
            oBll.ShipToCity = txtShipCity.Text;
            if (ddlShipState.SelectedIndex != 0)
                oBll.ShipToState = ddlShipState.SelectedItem.Value;            
            oBll.ShipToPCode = txtShipPcode.Text;
            oBll.BillToAddr1 = txtBillAdrs1.Text;
            oBll.BillToAddr2 = txtBillAdrs2.Text;
            oBll.BillToCity = txtBillCity.Text;
            if (ddlBillState.SelectedIndex != 0)
                oBll.BillToState = ddlBillState.SelectedItem.Value; 
            
            oBll.BillToPCode = txtBillPcode.Text;

            lblMsg.Text = oBll.InsOrUpdtOrgCustomers();
            lblMsg.Visible = true;           
            BindCustomerDetails();
            //btnSaveShip.Enabled = true;
            //btnSaveBillAddr.Enabled = true;
            hdnCustID.Value=oBll.oDsOrgCustDetails.Tables[0].Rows[oBll.oDsOrgCustDetails.Tables[0].Rows.Count - 1]["PKCustID"].ToString();
            divCustomer.Visible = false;
            gvCustomerDetails.Visible = true;
            lnkBtnNewCust.CommandArgument = "Add";
            lnkBtnNewCust.Text = "Add New Customer Details";
           
        }
    }

    protected void lnkBtnNewCust_Click(object sender, EventArgs e)
    {
        if (lnkBtnNewCust.CommandArgument.ToString() == "Add")
        {
            //tcOrganization.Visible = true;
            divCustomer.Visible = true;
            gvCustomerDetails.Visible = false;
            hdnCustID.Value = "";
            lnkBtnNewCust.CommandArgument = "Back";
            lnkBtnNewCust.Text = "Back to Customer Details";
            Reset();
            chkSameShipping.Checked = false;
        }
        else
        {
            //tcOrganization.Visible = false;
            divCustomer.Visible = false;
            gvCustomerDetails.Visible = true;
            lnkBtnNewCust.CommandArgument = "Add";
            lnkBtnNewCust.Text = "Add New Customer Details";
        }
        lblMsg.Visible = false;

    }
    protected void gvCustomerDetails_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lblCustID = (Label)gvCustomerDetails.Rows[e.NewSelectedIndex].FindControl("lblSno");
        oBll.CustID = new Guid(lblCustID.Text);
        hdnCustID.Value = lblCustID.Text;
        oBll.GetOrgCustDetails();
        txtCustName.Text = oBll.CustName;
        txtWebUrl.Text = oBll.WebsiteUrl;
        txtPhNum.Text = oBll.PhoneNumber;
        txtFaxNum.Text = oBll.FaxNumber;
        txtContName.Text = oBll.ContactName;
        txtContEmailid.Text = oBll.ContactEmailAddress;
        txtContPhnum.Text = oBll.ContactPhoneNumber;
        txtAltContName.Text = oBll.AltContactName;
        txtAltContEmail.Text = oBll.AltContactEmailAddress;
        txtAltContPhnum.Text = oBll.AltContactPhoneNumber;
        ddlStatus.SelectedValue = Convert.ToByte(oBll.Status).ToString();
        txtShipAdrs1.Text = oBll.ShipToAddr1;
        txtShipAdrs2.Text = oBll.ShipToAddr2;
        txtShipCity.Text = oBll.ShipToCity;
        if (oBll.ShipToState != "")
            ddlShipState.SelectedValue = oBll.ShipToState;
        else
            ddlShipState.SelectedIndex = 0;
        
        txtShipPcode.Text = oBll.ShipToPCode; 
        txtBillAdrs1.Text = oBll.BillToAddr1;
        txtBillAdrs2.Text = oBll.BillToAddr2;
        txtBillCity.Text = oBll.BillToCity;
        if (oBll.BillToState != "")
            ddlBillState.SelectedValue = oBll.BillToState;
        else
            ddlBillState.SelectedIndex = 0;        
        txtBillPcode.Text = oBll.BillToPCode;       
        gvCustomerDetails.Visible = false;        
        divCustomer.Visible = true;
        btnSave.Text = "update";
        lnkBtnNewCust.CommandArgument = "Back";
        lnkBtnNewCust.Text = "Back to Customer Details";
        

    }

    protected void gvCustomerDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblCustID = (Label)gvCustomerDetails.Rows[e.RowIndex].FindControl("lblSno");
        oBll.CustID = new Guid(lblCustID.Text);
        oBll.DelOrgCustomers();
        BindCustomerDetails();
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

    private void BindState()
    {
        DataSet oDsDepartment;
        oDsDepartment = oBll.GetStates();
        ListItem lstState = new ListItem("Select", "0");
        ddlShipState.Items.Insert(0, lstState);
        ddlBillState.Items.Insert(0, lstState);
        ddlBillState.DataTextField= ddlShipState.DataTextField = "State";
        ddlBillState.DataValueField= ddlShipState.DataValueField = "StateID";
        ddlBillState.DataSource = ddlShipState.DataSource = oDsDepartment;
        ddlShipState.DataBind();
        ddlBillState.DataBind();
    }


    private void BindCustomerDetails()
    {
        oBll.CustID = null;
        oBll.GetOrgCustDetails();
        gvCustomerDetails.DataSource = oBll.oDsOrgCustDetails;
        gvCustomerDetails.DataBind();
    }

    private void Reset()
    {
        txtCustName.Text = "";
        txtWebUrl.Text = "";
        txtPhNum.Text = "";
        txtFaxNum.Text = "";
        txtContName.Text = "";
        txtContEmailid.Text = "";
        txtContPhnum.Text = "";
        txtAltContName.Text = "";
        txtAltContEmail.Text = "";
        txtAltContPhnum.Text = "";
        ddlStatus.SelectedIndex = 0;

        txtShipAdrs1.Text = "";
        txtShipAdrs2.Text = "";
        txtShipCity.Text = "";
        ddlShipState.SelectedIndex = 0;
        txtShipPcode.Text = "";

        txtBillAdrs1.Text = "";
        txtBillAdrs2.Text = "";
        txtBillCity.Text = "";
        ddlBillState.SelectedIndex = 0;
        txtBillPcode.Text = "";
    }

    protected void chkSameShipping_CheckedChanged(object sender, EventArgs e)
    {
        if (chkSameShipping.Checked == true)
        {
            txtBillAdrs1.Text = txtShipAdrs1.Text;
            txtBillAdrs2.Text = txtShipAdrs2.Text;
            txtBillCity.Text = txtShipCity.Text;
            ddlBillState.SelectedIndex = ddlShipState.SelectedIndex;
            txtBillPcode.Text = txtShipPcode.Text;
        }
        else
        {
            txtBillAdrs1.Text = "";
            txtBillAdrs2.Text = "";
            txtBillCity.Text = "";
            ddlBillState.SelectedIndex = 0;
            txtBillPcode.Text = "";
        }
    }

    private void Security(LinkButton lnkBtnSecurity,GridView gvSecurity)
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
    
}
