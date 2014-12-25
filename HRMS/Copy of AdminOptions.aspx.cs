using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class AdminOptions : System.Web.UI.Page
{    
    OrganizationBLL oBll = new OrganizationBLL();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {           
            if (Session["UserID"] != null)
            {
                Security();
                
            }
        }    
    }
    private void Security()
    {
        if (Request.QueryString["pid"] != null)
        {
            if (Session["UserID"].ToString().ToLower() != "admin")
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
                    else
                        Session["pid"] = Request.QueryString["pid"].ToString();
                }
            }
            else
                Session["pid"] = Request.QueryString["pid"].ToString();
        }

        else
            Response.Redirect("~/NoAccess.aspx");
    }

}