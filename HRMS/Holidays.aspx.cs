using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogic;

public partial class Holidays : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            BindHolidays();
            if (Session["UserID"] != null)
            {
                Security(btnSave, btnReset, gvHolidays);

            }
        }
        lblMsg.Visible = false;
    }

    protected void gvHolidays_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblStatus = (Label)e.Row.FindControl("lblStatus1");
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
            if (hdnHolidaysID.Value != "")
                oBll.HolidaysID = new Guid(hdnHolidaysID.Value);
            else
                oBll.HolidaysID = null;

            oBll.HolName = txtHolidayName.Text;
            oBll.HolDesc = txtHolDesc.Text;
            if (txtDate.Text != "")
            oBll.HolDate = Convert.ToDateTime(txtDate.Text);
            oBll.CreatedBy = Session["createdBy"].ToString();
            oBll.CreatedDate = System.DateTime.Now;
            oBll.ModifiedBy = Session["modifiedBy"].ToString();
            oBll.ModifiedDate = System.DateTime.Now;
            oBll.Status = 1;
            lblMsg.Text = oBll.InsOrUpdtHolidays();
            lblMsg.Visible = true;
            BindHolidays();
            Reset();
            Security(btnSave, btnReset, gvHolidays);
        }
    }

    protected void gvHolidays_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            Label lblHolName = (Label)gvHolidays.Rows[e.NewSelectedIndex].FindControl("lblHolName");
            Label lblHolDesc = (Label)gvHolidays.Rows[e.NewSelectedIndex].FindControl("lblHolDesc");
            Label lblHolDate = (Label)gvHolidays.Rows[e.NewSelectedIndex].FindControl("lblHolDate");
            Label lblHolidaysID = (Label)gvHolidays.Rows[e.NewSelectedIndex].FindControl("lblHolidaysID");
            Label lblStatus = (Label)gvHolidays.Rows[e.NewSelectedIndex].FindControl("lblStatus");
            hdnHolidaysID.Value = lblHolidaysID.Text;
            txtHolidayName.Text = lblHolName.Text;
            txtHolDesc.Text = lblHolDesc.Text;
            txtDate.Text = lblHolDate.Text;
            ddlStatus.SelectedValue = (Convert.ToByte(Convert.ToBoolean(lblStatus.Text))).ToString();
            btnSave.Text = "Update";

        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('Sorry!Net Connectivity Problem.')</script>");
        }
    }

    protected void gvHolidays_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Label lblHolidaysID = (Label)gvHolidays.Rows[e.RowIndex].FindControl("lblHolidaysID");
        oBll.HolidaysID = new Guid(lblHolidaysID.Text);
        oBll.DelHolidays();
        BindHolidays();
        Security(btnSave, btnReset, gvHolidays);
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Reset();
        Security(btnSave, btnReset, gvHolidays);

    }

    private void BindHolidays()
    {
        oBll.HolidaysID = null;
        oBll.GetHolidays();
        gvHolidays.DataSource = oBll.oDsHolidays;
        gvHolidays.DataBind();

    }

    private void Reset()
    {
        txtHolidayName.Text = "";
        txtHolDesc.Text = "";
        txtDate.Text = "";
        ddlStatus.SelectedIndex = 0;
        btnSave.Text = "Save";

    }

    private void Security(Button btnSave, Button btnReset, GridView gvSecurity)
    {
        if (Session["pid"] != null)
        {
            if (Session["UserID"].ToString().ToLower() != "admin")
            {
                if (Session["DSEmpDetails"] != null)
                {
                    oBll.oDsEmpDetails = (DataSet)Session["DSEmpDetails"];
                    int flag = 0;
                    for (int iRowCount = 0; iRowCount < oBll.oDsEmpDetails.Tables[0].Rows.Count; iRowCount++)
                    {
                        if (Session["pid"].ToString() == oBll.oDsEmpDetails.Tables[0].Rows[iRowCount]["Pk_PageID"].ToString())
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
        }
        else
            Response.Redirect("~/NoAccess.aspx");
    }


}