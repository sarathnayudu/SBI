using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.IO;

public partial class MyDocuments : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            oBll.DocType = "HR Documents";
            oBll.GetDocuments();
            rptHRDoc.DataSource = oBll.oDsDocuments;
            rptHRDoc.DataBind();
            oBll.DocType = "My Benefits";
            oBll.GetDocuments();
            rptBenefits.DataSource = oBll.oDsDocuments;
            rptBenefits.DataBind();
            oBll.DocType = "Educational Documents";
            oBll.GetDocuments();
            rptEduDoc.DataSource = oBll.oDsDocuments;
            rptEduDoc.DataBind();
            oBll.DocType = "Company Notification";
            oBll.GetDocuments();
            rptCompNot.DataSource = oBll.oDsDocuments;
            rptCompNot.DataBind();
            if (Session["EmpID"] != null)
            {
                //oBll.OrgEmpId = new Guid(Session["EmpID"].ToString());
                //oBll.GetEmpDocuments();
                //rptEmployeeDocs.DataSource = oBll.oDsDocuments;
                //rptEmployeeDocs.DataBind();
                if (Directory.Exists(Server.MapPath("~/EmployeeDocs/" + Session["UserName"].ToString())))
                {
                    DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/EmployeeDocs/" + Session["UserName"].ToString()));

                    rptEmployeeDocs.DataSource = dirInfo.GetFiles("*.*");
                    rptEmployeeDocs.DataBind();
                }
            }

        }

    }

    protected void rptEmployeeDocs_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemIndex > -1)
            {

                HyperLink lnkDoc = (HyperLink)e.Item.FindControl("lnkDoc");
                lnkDoc.NavigateUrl = "~/EmployeeDocs/" + Session["UserName"].ToString()+"/"+lnkDoc.NavigateUrl;
               

               
            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Display Error", "<script language=\"javascript\">alert(" + Ex.Message + ");</script>", true);

        }
    }
}