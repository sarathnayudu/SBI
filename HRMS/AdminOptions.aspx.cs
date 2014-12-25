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
    /* Method to provide security privileges to user login*/
    private void Security()
    {
        //pid = pageid,UserID=EmployeeCode,DSEmpDetails=dataset filled with loggin user details
        if (Request.QueryString["pid"] != null)
        {
            if (Session["UserID"].ToString().ToLower() != "admin")//In case user is not admin as admin already has all privileges so not required to be tested
            {
                if (Session["DSEmpDetails"] != null) //Dataset with the logged in employee records
                {
                    oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];//Converting session dataset employees to dataset type to check further
                    int flag = 0;
                    for (int iRowCount = 0; iRowCount < oBll.oDsEmpDetails.Tables[0].Rows.Count; iRowCount++)
                    {//checking if the requested page id is in the permission list of the user
                        if (Request.QueryString["pid"].ToString() == oBll.oDsEmpDetails.Tables[0].Rows[iRowCount]["Pk_PageID"].ToString())
                        {
                            string[] strPermissionType = oBll.oDsEmpDetails.Tables[0].Rows[iRowCount]["PermissionType"].ToString().Split(',');//splitting the permissions user is having for this page A,V,D,E
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

                    if (flag == 0 || oBll.View == 'N')// if user doesn't have permission to access "NoAccess page" will be displayed 
                        Response.Redirect("~/NoAccess.aspx");
                    else
                        Session["pid"] = Request.QueryString["pid"].ToString();//If user has permissions keeping pageid in session to verify in other admin options pages to follow in security process
                }
            }
            else
                Session["pid"] = Request.QueryString["pid"].ToString();
        }

        else
            Response.Redirect("~/NoAccess.aspx");
    }

}
