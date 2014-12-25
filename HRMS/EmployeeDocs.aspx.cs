using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.IO;

public partial class EmployeeDocs : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDocuments();
            BindEmpDocuments();
            BindEmployee();
            //DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/EmployeeDocs"));

            //gvFilesDirUploaded.DataSource = dirInfo.GetFiles("*.*");
            //gvFilesDirUploaded.DataBind();
        }

    }

    protected void gvDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblDocumentName = (Label)e.Row.FindControl("lblDocumentName");
                string[] strDocName = lblDocumentName.Text.Split('/');
                lblDocumentName.Text = strDocName[strDocName.Length - 1];

            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvDocuments_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {

            Label lblDocID = (Label)gvDocuments.Rows[e.NewSelectedIndex].FindControl("lblDocID");
            Label lblDocTitle = (Label)gvDocuments.Rows[e.NewSelectedIndex].FindControl("lblDocTitle");
            Label lblDocumentName = (Label)gvDocuments.Rows[e.NewSelectedIndex].FindControl("lblDocumentName");
            Label lblDocType = (Label)gvDocuments.Rows[e.NewSelectedIndex].FindControl("lblDocType");
            HyperLink lnkPath = (HyperLink)gvDocuments.Rows[e.NewSelectedIndex].FindControl("lnkPath");
            hdnDocID.Value = lblDocID.Text;
            txtDocTitle.Text = lblDocTitle.Text;
            ddlDocType.SelectedValue = ddlDocType.Items.FindByText(lblDocType.Text).Value;
            hdnAttach.Value = lnkPath.NavigateUrl.ToString();
            btnSaveDoc.Text = "Update";            

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvDocuments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblDocID = (Label)gvDocuments.Rows[e.RowIndex].FindControl("lblDocID");
        HyperLink lnkPath = (HyperLink)gvDocuments.Rows[e.RowIndex].FindControl("lnkPath");
        oBll.DocID = new Guid(lblDocID.Text);
        oBll.DelDocuments();
        System.IO.File.Delete(Server.MapPath(lnkPath.NavigateUrl.ToString()));
        BindDocuments();
       
    }

    protected void gvEmpDocuments_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblDocumentName = (Label)e.Row.FindControl("lblDocumentName");
                string[] strDocName = lblDocumentName.Text.Split('/');
                lblDocumentName.Text = strDocName[strDocName.Length - 1];

            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvEmpDocuments_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {

            Label lblDocID = (Label)gvEmpDocuments.Rows[e.NewSelectedIndex].FindControl("lblDocID");
            Label lblDocTitle = (Label)gvEmpDocuments.Rows[e.NewSelectedIndex].FindControl("lblDocTitle");
            Label lblEmpID = (Label)gvEmpDocuments.Rows[e.NewSelectedIndex].FindControl("lblEmpID");
            HyperLink lnkPath = (HyperLink)gvEmpDocuments.Rows[e.NewSelectedIndex].FindControl("lnkPath"); 
            
            hdnDocID.Value = lblDocID.Text;
            txtDocTitle.Text = lblDocTitle.Text;
            hdnAttach.Value = lnkPath.NavigateUrl.ToString();
            ddlEmployee.SelectedValue = lblEmpID.Text;
            btnSaveDoc.Text = "Update";

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvEmpDocuments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblDocID = (Label)gvEmpDocuments.Rows[e.RowIndex].FindControl("lblDocID");
        HyperLink lnkPath = (HyperLink)gvEmpDocuments.Rows[e.RowIndex].FindControl("lnkPath");
        oBll.DocID = new Guid(lblDocID.Text);
        oBll.DelEmpDocuments();
        System.IO.File.Delete(Server.MapPath(lnkPath.NavigateUrl.ToString()));
        BindEmpDocuments();

    }

    protected void btnSaveDoc_Click(object sender, EventArgs e)
    {
        if (hdnDocID.Value != "")
            oBll.DocID = new Guid(hdnDocID.Value);
        else
            oBll.DocID = null;
        
        oBll.DocType = ddlDocType.SelectedItem.Text;
        oBll.DocTitle = txtDocTitle.Text;
        oBll.DocPath = UploadFile(FileUpload1);
        if (oBll.DocPath == "")
        {
            oBll.DocPath = hdnAttach.Value;
        }
        if (ddlEmployee.SelectedIndex == 0)
        {
            lblMsg.Text = oBll.InsOrUpdtDocuments();
            BindDocuments();
        }
        else
        {
                oBll.OrgEmpId = new Guid(ddlEmployee.SelectedItem.Value);
                lblMsg.Text = oBll.InsOrUpdtEmpDocuments();
                BindEmpDocuments();
            
        }
        Reset();
        

    }
    protected void btnResetDoc_Click(object sender, EventArgs e)
    {
        Reset();
    }

    private string UploadFile(FileUpload flFile)
    {
        string strDocPath = "";
        if (flFile.HasFile)
        {
            try
            {
                string docFile = flFile.FileName;
                string SaveLocation="";
                if (ddlEmployee.SelectedIndex != 0)
                {
                    oBll.OrgEmpId = new Guid(ddlEmployee.SelectedItem.Value);
                    oBll.GetOrgEmpDetails();
                    string strName = oBll.FirstName + " " + oBll.LastName;
                    if (!Directory.Exists(Server.MapPath("~/EmployeeDocs/" + strName)))
                        Directory.CreateDirectory(Server.MapPath("~/EmployeeDocs/" + strName));
                    SaveLocation = Server.MapPath("~/EmployeeDocs") + "/" + strName + "/" + docFile;
                    strDocPath = "~/EmployeeDocs/" + strName + "/" + docFile;
                }
                else
                {
                    SaveLocation = Server.MapPath("~/EmployeeDocs") + "/" + docFile;
                    strDocPath = "~/EmployeeDocs/" + docFile;
                }
                flFile.SaveAs(SaveLocation);
                
            }

            catch (Exception ex)
            {
            }

        }

        return strDocPath;
    }

    private void BindDocuments()
    {
        oBll.DocType = null;
        oBll.GetDocuments();
        gvDocuments.DataSource = oBll.oDsDocuments;
        gvDocuments.DataBind();
    }

    private void BindEmpDocuments()
    {
        oBll.OrgEmpId = null;
        oBll.GetEmpDocuments();
        gvEmpDocuments.DataSource = oBll.oDsDocuments;
        gvEmpDocuments.DataBind();
    }
    private void Reset()
    {
        txtDocTitle.Text = "";
        ddlDocType.SelectedIndex = 0;
    }

    private void BindEmployee()
    {

        oBll.OrgEmpId = null;
        oBll.GetOrgEmpDetails();

        oBll.oDsOrgEmpDetails.Tables[0].Columns.Add("EmployeeName", typeof(string), "Emp_Fname +' '+ Emp_LName");
        ListItem lstEmployee = new ListItem("For All", "0");
        ddlEmployee.Items.Insert(0, lstEmployee);
        ddlEmployee.DataTextField = "EmployeeName";
        ddlEmployee.DataValueField = "PK_Org_EmpID";
        ddlEmployee.DataSource = oBll.oDsOrgEmpDetails;
        ddlEmployee.DataBind();
    }
}