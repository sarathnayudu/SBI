using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class SideMenu : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        oBll.OrgEmpCode = Session["UserID"].ToString();
        oBll.GetUserDetail();
        Session["EmpID"] = oBll.OrgEmpId.ToString();
        Session["DSEmpDetails"] = oBll.oDsEmpDetails;
        Session["OrgRoleName"] = oBll.OrgRoleName;
      //  lblUserName.Text = oBll.FirstName + " " + oBll.LastName;
       // Session["UserName"] = Session["createdBy"] = Session["modifiedBy"] = lblUserName.Text;
        DataTable oDtEmpDetails, oDtEmpDetailsCopy;


        if (Session["OrgRoleName"].ToString().ToLower() == "admin")
        {
            for (int iRowCount = 0; iRowCount < 5; iRowCount++)
            {

                oBll.oDsEmpDetails.Tables[0].Rows[0].Delete();
                oBll.oDsEmpDetails.Tables[0].Rows[0].AcceptChanges();


            }
            oDtEmpDetails = oBll.oDsEmpDetails.Tables[0].Copy();
        }
        else
        {
            oDtEmpDetails = oBll.oDsEmpDetails.Tables[0].Clone();
            oDtEmpDetailsCopy = oBll.oDsEmpDetails.Tables[0].Copy();
            DataRow oDrEmpDetails;
            int flag = 0, order = 0;
            for (int iRowCount = 0; iRowCount < oDtEmpDetailsCopy.Rows.Count; iRowCount++)
            {
                flag = 0;
                if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Timesheet")
                {
                    flag = 1;
                    order = 1;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My TimeOff" && order == 1)
                {
                    flag = 1;
                    order = 2;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Documents" && order == 2)
                {
                    flag = 1;
                    order = 3;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Profile" && order == 3)
                {
                    flag = 1;
                    order = 4;
                }
                else if (oDtEmpDetailsCopy.Rows[iRowCount]["Page_Name"].ToString() == "My Projects" && order == 4)
                {
                    flag = 1;
                }
                if (flag == 1)
                {
                    oDrEmpDetails = oDtEmpDetailsCopy.Rows[iRowCount];

                    oDtEmpDetails.ImportRow(oDrEmpDetails);
                    oDtEmpDetailsCopy.Rows[iRowCount].Delete();
                    oDtEmpDetailsCopy.AcceptChanges();
                    iRowCount = -1;
                }
            }
        }


        rptPages.DataSource = oDtEmpDetails;
        rptPages.DataBind();

    }

    protected void rptPages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemIndex > -1)
            {
                Panel pnlHeading = (Panel)e.Item.FindControl("pnlHeading");
                Label lblPageName = (Label)e.Item.FindControl("lblPageName");
                Panel pnlTitle = (Panel)e.Item.FindControl("pnlTitle");
                if (lblPageName.Text == "My Projects")
                    pnlTitle.Visible = false;

                if (lblPageName.Text == "Customer")
                    pnlTitle.Visible = false;
                if (lblPageName.Text == "Projects Detail")
                    pnlTitle.Visible = false;
                if (Session["OrgRoleName"].ToString().ToLower() != "admin")
                {
                    if (e.Item.ItemIndex == 0)
                        pnlHeading.Visible = true;
                    else if (e.Item.ItemIndex == 5)
                    {
                        LiteralControl litText = pnlHeading.Controls[0] as LiteralControl;
                        litText.Text = "Administration";
                        pnlHeading.Visible = true;
                    }
                }
                else
                {
                    if (e.Item.ItemIndex == 0)
                    {
                        LiteralControl litText = pnlHeading.Controls[0] as LiteralControl;
                        litText.Text = "Administration";
                        pnlHeading.Visible = true;
                    }
                }
            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Display Error", "<script language=\"javascript\">alert(" + Ex.Message + ");</script>", true);

        }
    }
   
}