using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;

public partial class VendorPage : System.Web.UI.Page
{
        OrganizationBLL oBll = new OrganizationBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                oBll.GetOrgDetails();
                if (oBll.OrgID != null)
                {
                    lblOrgName.Text = oBll.OrgName;
                    lblBusPhone.Text = oBll.PhoneNumber;
                    lblEmailID.Text = oBll.EmailID;
                }
            }
        }
}