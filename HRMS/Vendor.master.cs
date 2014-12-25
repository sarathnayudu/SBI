using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

public partial class Vendor : System.Web.UI.MasterPage
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
            Response.Redirect("~/Login.aspx");
        if (!IsPostBack)
        {
            oBll.GetOrgDetails();
            if (oBll.OrgID != null)
            {
                lblLogoText.Text = oBll.OrgName;
            }

            if (Session["VendID"] != null)
            {
                oBll.CustID = new Guid(Session["VendID"].ToString());
                oBll.GetOrgVendors();
                Session["VendName"] = lblUserName.Text = oBll.VendorName.ToString();
            }
        }
    }

    protected void lnkBtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/login.aspx");
    }
}
