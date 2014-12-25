using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogic;
using System.IO;
using System.Data;
using MigraDoc.DocumentObjectModel;
using MigraDoc.DocumentObjectModel.Tables;
using MigraDoc.DocumentObjectModel.Shapes;
using System.Diagnostics;
using MigraDoc.Rendering;
using MigraDoc.RtfRendering;
using PdfSharp.Pdf;
using PdfSharp.Drawing;

public partial class ViewEmployeeEvaluation : System.Web.UI.Page
{
    OrganizationBLL oBll = new OrganizationBLL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["EvID"] != null)
            {
                oBll.EvaluationID = new Guid(Request.QueryString["EvID"].ToString());
                oBll.OnlyAdmin = null;
                oBll.GetEmpEvaluation();
                if (oBll.oDsEmpEvaluation.Tables[0].Rows.Count > 0)
                {
                    oBll.GetOrgDetails();
                    if (oBll.OrgID != null)
                    {
                        lblOrgName.Text = oBll.OrgName;
                        divOrgAddress.InnerHtml = oBll.Address1 + "<br>" + oBll.Address2 + ",<br>" + oBll.City+","+ oBll.State +" "+ oBll.PostalCode + "<br>Phone:" + oBll.PhoneNumber + "<br>Fax:" + oBll.FaxNumber + "<br>" + oBll.WebsiteUrl;
                        
                        imgLogo.ImageUrl = "~/images/ibs-logo.jpg";

                        lblEmployeePerf.Text = "Employee Performance Evaluation-" + Convert.ToDateTime(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Start_Date"]).ToString("yyyy");
                        lblEmployee.Text = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Emp_Fname"].ToString() + " " + oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Emp_Lname"].ToString();
                        lblJobTitle.Text = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Emp_JobTitle"].ToString();
                        lblEvalPeriod.Text = Convert.ToDateTime(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Start_Date"]).ToString("MM/dd/yyyy") + "-" + Convert.ToDateTime(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["End_Date"]).ToString("MM/dd/yyyy");
                        lblEmplCateg.Text = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Emp_Categ"].ToString();
                        lblInstructions.Text = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Instructions"].ToString();
                        if (lblInstructions.Text == "")
                            lblInsTitle.Visible = false;
                        
                        txtSuperVisComments.Text = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Superv_Comments"].ToString();

                        if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Eval_Grade"].ToString() != "")
                            ddlEmpEvalGrade.SelectedValue = ddlEmpEvalGrade.Items.FindByText(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Eval_Grade"].ToString()).Value;
                        if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Emp_Signed_Date"].ToString() != "")
                            txtEmployeeSignDate.Text = Convert.ToDateTime(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Emp_Signed_Date"]).ToString("MM/dd/yyyy");
                        if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Supervisor_Signed_Date"].ToString() != "")
                            txtSupervSignDate.Text = Convert.ToDateTime(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Supervisor_Signed_Date"]).ToString("MM/dd/yyyy");
                        hdnEmpID.Value = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["FK_Org_EmpID"].ToString();
                        hdnTemplID.Value = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["FK_TemplateID"].ToString();
                        hdnOnlyAdmin.Value = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Only_Admin"].ToString();
                        if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Eval_Doc_Path"].ToString() != "")
                           hdnFileName.Value = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Eval_Doc_Path"].ToString(); 
                                                
                        oBll.TemplateID = new Guid(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["PK_TemplateID"].ToString());
                        oBll.CompletedBy = 1;// For both employee and employer
                        oBll.GetRatTemplQues();
                        rptQuestions.DataSource=oBll.oDsRatTempQues;
                        rptQuestions.DataBind();

                        oBll.CompletedBy = 0;// For only employee
                        oBll.GetRatTemplQues();
                        rptSummaryQues.DataSource = oBll.oDsRatTempQues;
                        rptSummaryQues.DataBind();

                        foreach (RepeaterItem rptItem in rptSummaryQues.Items)
                        {
                            Label lblQuestionID = (Label)rptItem.FindControl("lblQuestionID");
                            Label lblQuestions = (Label)rptItem.FindControl("lblQuestions");
                            TextBox txtAnswer = (TextBox)rptItem.FindControl("txtAnswer");

                            if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employee_Summary"].ToString() != "")
                            {
                                string[] strSection = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employee_Summary"].ToString().Split(';');
                                for (int iStrLength = 0; iStrLength < strSection.Length; iStrLength++)
                                {
                                    string[] strSubSection = strSection[iStrLength].Split('#');
                                    if (strSubSection.Length > 0)
                                    {
                                        if (lblQuestionID.Text == strSubSection[0])
                                        {
                                            txtAnswer.Text = strSubSection[1];
                                        }
                                    }
                                }
                            }
                            
                        }

                        if (Request.QueryString["role"] != null)
                        {
                            if (Request.QueryString["role"] == "Employee")
                            {
                                ddlEmpEvalGrade.Enabled = false;
                                txtSuperVisComments.Enabled = false;
                                txtSupervisorSign.Enabled = false;
                                txtSupervisorName.Enabled = false;
                                txtSupervSignDate.Enabled = false;
                            }
                        }
                        
                    }
                }

            }
        }

    }
    
    protected void rptQuestions_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemIndex == -1)
            {
                Label lblHeading1 = (Label)e.Item.FindControl("lblHeading1");
                Label lblHeading2 = (Label)e.Item.FindControl("lblHeading2");
                Label lblHeading3 = (Label)e.Item.FindControl("lblHeading3");
                Label lblHeading4 = (Label)e.Item.FindControl("lblHeading4");
                Label lblHeading5 = (Label)e.Item.FindControl("lblHeading5");
                if (lblHeading1 != null)
                {
                    oBll.RatingScaleTitleID = null;
                    oBll.RatingScaleID = new Guid(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["PK_RatingScaleID"].ToString());
                    oBll.GetRatingScaleTitle();
                    Session["oDsRatingScaleTitle"] = oBll.oDsRatingScaleTitle;
                    hdnRatScaTitCount.Value = oBll.oDsRatingScaleTitle.Tables[0].Rows.Count.ToString();
                    for (int iRowCount = 0; iRowCount < oBll.oDsRatingScaleTitle.Tables[0].Rows.Count; iRowCount++)
                    {
                        switch (iRowCount)
                        {
                            case 0:
                                lblHeading1.Text = "("+oBll.oDsRatingScaleTitle.Tables[0].Rows[0]["Rating_Order"].ToString()+")"+ oBll.oDsRatingScaleTitle.Tables[0].Rows[0]["Title"].ToString();
                                break;
                            case 1: lblHeading2.Text = "(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[1]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[1]["Title"].ToString();
                                break;
                            case 2: lblHeading3.Text = "(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[2]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[2]["Title"].ToString();
                                break;
                            case 3: lblHeading4.Text = "(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[3]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[3]["Title"].ToString();
                                break;
                            case 4: lblHeading5.Text = "(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[4]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[4]["Title"].ToString();
                                break;
                        }
                    }
                }
                
            }

            if (e.Item.ItemIndex > -1)
            {
                oBll.RatingScaleTitleID = null;
                oBll.RatingScaleID = new Guid(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["PK_RatingScaleID"].ToString());
                oBll.GetRatingScaleTitle();

                Label lblQuestionID = (Label)e.Item.FindControl("lblQuestionID");
                DropDownList ddlEmployerEval = (DropDownList)e.Item.FindControl("ddlEmployerEval");
                RadioButton rdoQuestions1 = (RadioButton)e.Item.FindControl("rdoQuestions1");
                RadioButton rdoQuestions2 = (RadioButton)e.Item.FindControl("rdoQuestions2");
                RadioButton rdoQuestions3 = (RadioButton)e.Item.FindControl("rdoQuestions3");
                RadioButton rdoQuestions4 = (RadioButton)e.Item.FindControl("rdoQuestions4");
                RadioButton rdoQuestions5 = (RadioButton)e.Item.FindControl("rdoQuestions5");

                CheckBox chkQuestions1 = (CheckBox)e.Item.FindControl("chkQuestions1");
                CheckBox chkQuestions2 = (CheckBox)e.Item.FindControl("chkQuestions2");
                CheckBox chkQuestions3 = (CheckBox)e.Item.FindControl("chkQuestions3");
                CheckBox chkQuestions4 = (CheckBox)e.Item.FindControl("chkQuestions4");
                CheckBox chkQuestions5 = (CheckBox)e.Item.FindControl("chkQuestions5");
                if (Convert.ToBoolean(oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Single_Selection"].ToString()) == true)
                {
                    if (hdnRatScaTitCount.Value != "")
                    {
                        switch (Convert.ToInt32(hdnRatScaTitCount.Value))
                        {
                            case 1: rdoQuestions1.Visible = true;
                                break;
                            case 2: rdoQuestions1.Visible = true;
                                rdoQuestions2.Visible = true;
                                break;
                            case 3: rdoQuestions1.Visible = true;
                                rdoQuestions2.Visible = true;
                                rdoQuestions3.Visible = true;
                                break;
                            case 4: rdoQuestions1.Visible = true;
                                rdoQuestions2.Visible = true;
                                rdoQuestions3.Visible = true;
                                rdoQuestions4.Visible = true;
                                break;
                            case 5: rdoQuestions1.Visible = true;
                                rdoQuestions2.Visible = true;
                                 rdoQuestions3.Visible = true;
                                rdoQuestions4.Visible = true;
                                rdoQuestions5.Visible = true;
                                break;

                        }
                        
                    }
                    if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employee_Eval"].ToString() != "")
                    {
                        string[] strSection = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employee_Eval"].ToString().Split(';');
                        for (int iStrLength = 0; iStrLength < strSection.Length; iStrLength++)
                        {
                            string[] strSubSection = strSection[iStrLength].Split('#');
                            if (strSubSection.Length > 0)
                                if (lblQuestionID.Text == strSubSection[0])
                                {
                                    string[] strEval = strSubSection[1].Split(',');
                                    if (strEval.Length > 0)
                                    {
                                        if (strEval[0] != "")
                                        {
                                            rdoQuestions1.Checked = true;
                                            break;
                                        }

                                    }
                                    if (strEval.Length > 1)
                                    {
                                        if (strEval[1] != "")
                                        {
                                            rdoQuestions2.Checked = true;
                                            break;
                                        }
                                    }
                                    if (strEval.Length > 2)
                                    {
                                        if (strEval[2] != "")
                                        {
                                            rdoQuestions3.Checked = true;
                                            break;
                                        }
                                    }
                                    if (strEval.Length > 3)
                                    {
                                        if (strEval[3] != "")
                                        {
                                            rdoQuestions4.Checked = true;
                                            break;
                                        }
                                    }
                                    if (strEval.Length > 4)
                                    {
                                        if (strEval[4] != "")
                                        {
                                            rdoQuestions5.Checked = true;
                                            break;
                                        }
                                    }
                                }
                        }
                    }
                    
                }
                else
                {
                    if (hdnRatScaTitCount.Value != "")
                    {
                        switch (Convert.ToInt32(hdnRatScaTitCount.Value))
                        {
                            case 1: chkQuestions1.Visible = true;
                                break;
                            case 2: chkQuestions1.Visible = true;
                                chkQuestions2.Visible = true;
                                break;
                            case 3: chkQuestions1.Visible = true;
                                chkQuestions2.Visible = true;
                                chkQuestions3.Visible = true;
                                break;
                            case 4: chkQuestions1.Visible = true;
                                chkQuestions2.Visible = true;
                                chkQuestions3.Visible = true;
                                chkQuestions4.Visible = true;
                                break;
                            case 5: chkQuestions1.Visible = true;
                                chkQuestions2.Visible = true;
                                chkQuestions3.Visible = true;
                                chkQuestions4.Visible = true;
                                chkQuestions5.Visible = true;
                                break;
                        }

                    }

                    if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employee_Eval"].ToString() != "")
                    {
                        string[] strSection = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employee_Eval"].ToString().Split(';');
                        for (int iStrLength = 0; iStrLength < strSection.Length; iStrLength++)
                        {
                            string[] strSubSection = strSection[iStrLength].Split('#');
                            if (strSubSection.Length > 0)
                                if (lblQuestionID.Text == strSubSection[0])
                                {
                                    string[] strEval = strSubSection[1].Split(',');
                                    if (strEval.Length > 0)
                                    {
                                        if (strEval[0] != "")
                                            chkQuestions1.Checked = true;
                                    }
                                    if (strEval.Length > 1)
                                    {
                                        if (strEval[1] != "")
                                            chkQuestions2.Checked = true;
                                    }
                                    if (strEval.Length > 2)
                                    {
                                        if (strEval[2] != "")
                                            chkQuestions3.Checked = true;
                                    }
                                    if (strEval.Length > 3)
                                    {
                                        if (strEval[3] != "")
                                            chkQuestions4.Checked = true;
                                    }
                                    if (strEval.Length > 4)
                                    {
                                        if (strEval[4] != "")
                                            chkQuestions5.Checked = true;
                                    }
                                }
                        }
                    }
                }

                ddlEmployerEval.Items.Insert(0, "");
                ddlEmployerEval.DataTextField = "Title";
                ddlEmployerEval.DataValueField = "PK_RatingScaleTitleID";
                ddlEmployerEval.DataSource = oBll.oDsRatingScaleTitle;
                ddlEmployerEval.DataBind();

                if (Request.QueryString["role"] != null)
                {
                    if (Request.QueryString["role"] == "Employee")
                    {
                        ddlEmployerEval.Enabled = false;
                    }
                }

                if (oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employer_Eval"].ToString() != "")
                {
                    string[] strSection = oBll.oDsEmpEvaluation.Tables[0].Rows[0]["Employer_Eval"].ToString().Split(';');
                    for (int iStrLength = 0; iStrLength < strSection.Length; iStrLength++)
                    {
                        string[] strEval = strSection[iStrLength].Split('#');
                        if (strEval.Length > 0)
                            if (lblQuestionID.Text == strEval[0])
                            {
                                ddlEmployerEval.SelectedValue = strEval[1];
                            }
                    }
                }

                
                Session["oDsRatingScaleTitle"] = oBll.oDsRatingScaleTitle;
            }
        }
        catch (Exception Ex)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Display Error", "<script language=\"javascript\">alert(" + Ex.Message + ");</script>", true);

        }
    }

    //Code to save or update Employee Evaluation Details
    protected void btnSaveEvalDetails_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["EvID"] != null)
        {
            oBll.EvaluationID = new Guid(Request.QueryString["EvID"].ToString());
            oBll.OrgEmpId = new Guid(hdnEmpID.Value);
            oBll.TemplateID = new Guid(hdnTemplID.Value);
            oBll.EvalDocPath = "";
            oBll.Processed = 0;

            foreach (RepeaterItem rptItem in rptSummaryQues.Items)
            {
                Label lblQuestionID = (Label)rptItem.FindControl("lblQuestionID");
                TextBox txtAnswer = (TextBox)rptItem.FindControl("txtAnswer");
                oBll.EmployeeSumm += lblQuestionID.Text + "#" + txtAnswer.Text+";";
            }

            oBll.EmployeeSumm = oBll.EmployeeSumm.Remove(oBll.EmployeeSumm.Length - 1);

            foreach (RepeaterItem rptItem in rptQuestions.Items)
            {
                Label lblQuestionID = (Label)rptItem.FindControl("lblQuestionID");
                DropDownList ddlEmployerEval = (DropDownList)rptItem.FindControl("ddlEmployerEval");
                oBll.EmployerEval += lblQuestionID.Text + "#" + ddlEmployerEval.SelectedItem.Value + ";";

                RadioButton rdoQuestions1 = (RadioButton)rptItem.FindControl("rdoQuestions1");
                CheckBox chkQuestions1 = (CheckBox)rptItem.FindControl("chkQuestions1");

                oBll.oDsRatingScaleTitle = (DataSet)Session["oDsRatingScaleTitle"];
                if (rdoQuestions1.Visible == true)
                {
                    RadioButton rdoQuestions2 = (RadioButton)rptItem.FindControl("rdoQuestions2");
                    RadioButton rdoQuestions3 = (RadioButton)rptItem.FindControl("rdoQuestions3");
                    RadioButton rdoQuestions4 = (RadioButton)rptItem.FindControl("rdoQuestions4");
                    RadioButton rdoQuestions5 = (RadioButton)rptItem.FindControl("rdoQuestions5");
                    oBll.EmployeeEval += lblQuestionID.Text+"#" ;
                    string strRatingScaleTitleID = "";

                    if (rdoQuestions1.Checked == true)
                    {
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[0]["PK_RatingScaleTitleID"].ToString();
                        strRatingScaleTitleID += ",,,,";
                    }
                    else if (rdoQuestions2.Checked == true)
                    {
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[1]["PK_RatingScaleTitleID"].ToString();
                        strRatingScaleTitleID = "," + strRatingScaleTitleID+",,,";
                    }
                    else if (rdoQuestions3.Checked == true)
                    {
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[2]["PK_RatingScaleTitleID"].ToString();
                        strRatingScaleTitleID = ",," + strRatingScaleTitleID + ",,";
                    }
                    else if (rdoQuestions4.Checked == true)
                    {
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[3]["PK_RatingScaleTitleID"].ToString();
                        strRatingScaleTitleID = ",,," + strRatingScaleTitleID + ",";
                    }
                    else if (rdoQuestions5.Checked == true)
                    {
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[4]["PK_RatingScaleTitleID"].ToString();
                        strRatingScaleTitleID = ",,,," + strRatingScaleTitleID ;
                    }
                    

                    oBll.EmployeeEval +=strRatingScaleTitleID+ ";";

                }
                else
                {
                    CheckBox chkQuestions2 = (CheckBox)rptItem.FindControl("chkQuestions2");
                    CheckBox chkQuestions3 = (CheckBox)rptItem.FindControl("chkQuestions3");
                    CheckBox chkQuestions4 = (CheckBox)rptItem.FindControl("chkQuestions4");
                    CheckBox chkQuestions5 = (CheckBox)rptItem.FindControl("chkQuestions5");

                    oBll.EmployeeEval += lblQuestionID.Text + "#";
                    string strRatingScaleTitleID = "";

                    if (chkQuestions1.Checked == true)
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[0]["PK_RatingScaleTitleID"].ToString() + ",";
                    else
                        strRatingScaleTitleID += ",";
                    if (chkQuestions2.Checked == true)
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[1]["PK_RatingScaleTitleID"].ToString() + ",";
                    else
                        strRatingScaleTitleID += ",";
                    if (chkQuestions3.Checked == true)
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[2]["PK_RatingScaleTitleID"].ToString() + ",";
                    else
                        strRatingScaleTitleID += ",";
                    if (chkQuestions4.Checked == true)
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[3]["PK_RatingScaleTitleID"].ToString() + ",";
                    else
                        strRatingScaleTitleID += ",";
                    if (chkQuestions5.Checked == true)
                        strRatingScaleTitleID += oBll.oDsRatingScaleTitle.Tables[0].Rows[4]["PK_RatingScaleTitleID"].ToString() + ",";
                    

                    if (strRatingScaleTitleID.Contains(","))
                        strRatingScaleTitleID = strRatingScaleTitleID.Remove(strRatingScaleTitleID.Length - 1);

                    oBll.EmployeeEval += strRatingScaleTitleID + ";";
                }
            }
            if (oBll.EmployerEval.Contains(";"))
                oBll.EmployerEval = oBll.EmployerEval.Remove(oBll.EmployerEval.Length-1);
            if (oBll.EmployeeEval.Contains(";"))
                oBll.EmployeeEval = oBll.EmployeeEval.Remove(oBll.EmployeeEval.Length - 1);
                       
           
            oBll.OnlyAdmin = Convert.ToByte(Convert.ToBoolean((hdnOnlyAdmin.Value)));
            oBll.EvalGrade = ddlEmpEvalGrade.SelectedItem.Text;
            oBll.SupervComm = txtSuperVisComments.Text;
            if (hdnFileName.Value != "")
                oBll.EvalDocPath = hdnFileName.Value;
            oBll.ActiveStatus = 1;
            oBll.InsOrUpdtEmpEvaluation();            
        }
    }

     //Code to save or update Employee Evaluation Details
    protected void btnReport_Click(object sender, EventArgs e)
    {
        CreateDocument();
    }

    #region "Pdf Creating Methods"

    public void CreateDocument()
    {        
            PdfDocument pdfDocument = new PdfDocument();
            pdfDocument.Info.Title = "Employee Performance Evaluation";
            pdfDocument.Info.Subject = "Evaluation.";
           

            // Create a new MigraDoc document
            Document document = new Document();

            DefineStyles(document);

            CreatePage(document, pdfDocument);


            //document.UseCmykColor = true;

            // Create a renderer for PDF that uses Unicode font encoding
            PdfDocumentRenderer pdfRenderer = new PdfDocumentRenderer(true);

            // Set the MigraDoc document
            pdfRenderer.Document = document;        

            // Create the PDF document
            pdfRenderer.RenderDocument();

             //Save the PDF document...
            hdnFileName.Value = Server.MapPath("~/EmployeeDocs/Eval-" + lblEmployee.Text + ".pdf");

            pdfDocument.Save(hdnFileName.Value);
            // ...and start a viewer.

            ScriptManager.RegisterStartupScript(this, this.GetType(), "doclick", "javascript:document.getElementById('lnkEval').href='EmployeeDocs/Eval-" + lblEmployee.Text + ".pdf';document.getElementById('lnkEval').click();", true);
           // ScriptManager.RegisterStartupScript(this, this.GetType(), "doclick", "javascript:window.open('F:\\Documentation\\Brochures\\HMS Brochure.pdf','resizable,scrollbars');", true); 
        //Process.Start(hdnFileName.Value);

            //MemoryStream stream = new MemoryStream();
            //pdfDocument.Save(stream, false);
            //Response.Clear();
            //Response.ContentType = "application/pdf";
            //Response.AddHeader("content-length", stream.Length.ToString());
            //Response.BinaryWrite(stream.ToArray());
            //Response.Flush();
            //stream.Close();
            //Response.End();
            
        }

    


    void DefineStyles(Document document)
    {
        // Get the predefined style Normal.
        MigraDoc.DocumentObjectModel.Style style = document.Styles["Normal"];
        // Because all styles are derived from Normal, the next line changes the 
        // font of the whole document. Or, more exactly, it changes the font of
        // all styles and paragraphs that do not redefine the font.
        style.Font.Name = "Verdana";
        style.Font.Size = 11;

        style = document.Styles[StyleNames.Header];
        style.ParagraphFormat.AddTabStop("16cm", TabAlignment.Right);

        style = document.Styles[StyleNames.Footer];
        style.ParagraphFormat.AddTabStop("8cm", TabAlignment.Center);

        // Create a new style called Table based on style Normal
        style = document.Styles.AddStyle("Table", "Normal");
        style.Font.Name = "Verdana";
        style.Font.Size = 11;

        // Create a new style called Reference based on style Normal
        style = document.Styles.AddStyle("Reference", "Normal");
        style.ParagraphFormat.SpaceBefore = "5mm";
        style.ParagraphFormat.SpaceAfter = "5mm";
        style.ParagraphFormat.TabStops.AddTabStop("16cm", TabAlignment.Right);
    }

    void CreatePage(Document document, PdfDocument pdfDocument)
    {

        PdfPage page = pdfDocument.AddPage();
        page.Size = PdfSharp.PageSize.A4;

        XGraphics gfx = XGraphics.FromPdfPage(page);
        gfx.MUH = PdfFontEncoding.Unicode;
        gfx.MFEH = PdfFontEmbedding.Default;
        //XFont font = new XFont("Arial", 13, XFontStyle.Bold);
        // Each MigraDoc document needs at least one section.
        Section section = document.AddSection();
        section.PageSetup.LeftMargin = 5;
        section.PageSetup.RightMargin = 2;
        section.PageSetup.TopMargin = 10;
        // Put a logo in the header


        // Create footer
        Paragraph paragraph = section.Footers.Primary.AddParagraph();
        paragraph.AddText(lblOrgName.Text);
        paragraph.Format.Alignment = ParagraphAlignment.Center;

        oBll.GetOrgDetails();
        if (oBll.OrgID != null)
        {
            paragraph = section.AddParagraph(oBll.Address1);
            paragraph.Format.Font.Size = 8;
            paragraph.Format.Alignment = ParagraphAlignment.Right;
            paragraph = section.AddParagraph(oBll.Address2);
            paragraph.Format.Font.Size = 8;
            paragraph.Format.Alignment = ParagraphAlignment.Right;
            paragraph = section.AddParagraph(oBll.City + "," + oBll.State + " " + oBll.PostalCode);
            paragraph.Format.Font.Size = 8;
            paragraph.Format.Alignment = ParagraphAlignment.Right;
            paragraph = section.AddParagraph("Phone:" + oBll.PhoneNumber);
            paragraph.Format.Font.Size = 8;
            paragraph.Format.Alignment = ParagraphAlignment.Right;
            paragraph = section.AddParagraph("Fax:" + oBll.FaxNumber);
            paragraph.Format.Font.Size = 8;
            paragraph.Format.Alignment = ParagraphAlignment.Right;
            paragraph = section.AddParagraph(oBll.WebsiteUrl);
            paragraph.Format.Font.Size = 8;
            paragraph.Format.Alignment = ParagraphAlignment.Right;

        }


        MigraDoc.DocumentObjectModel.Shapes.Image image = section.AddImage(Server.MapPath("~/images/ibs-logo.jpg"));

        image.LockAspectRatio = true;
        image.RelativeVertical = RelativeVertical.Line;
        image.RelativeHorizontal = RelativeHorizontal.Margin;
        image.Top = ShapePosition.Top;
        image.Left = ShapePosition.Left;
        
        
        image.WrapFormat.Style = WrapStyle.Through;
        // Put sender in address frame

        paragraph = section.AddParagraph(lblOrgName.Text);
        paragraph.Format.Font.Bold = true;
        paragraph.Format.Font.Size = 24;
        paragraph.Format.Font.Name = "Courier Sans MS";
        paragraph.Format.Alignment = ParagraphAlignment.Center;


        paragraph.Format.SpaceAfter = "1.5cm";
        paragraph = section.AddParagraph(lblEmployeePerf.Text);
        paragraph.Format.Font.Bold = true;
        paragraph.Format.Font.Color = MigraDoc.DocumentObjectModel.Colors.IndianRed;

        paragraph.Format.SpaceAfter = "0.5cm";
        paragraph = section.AddParagraph("Name of Employee: ");
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(lblEmployee.Text, TextFormat.NotBold);
        paragraph.AddSpace(30);

        paragraph.AddFormattedText("Employee Job Title: ", TextFormat.Bold);
        paragraph.AddFormattedText(lblJobTitle.Text, TextFormat.NotBold);

        paragraph.Format.SpaceAfter = "0.2cm";
        paragraph = section.AddParagraph("Evaluation Period: ");
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(lblEvalPeriod.Text, TextFormat.NotBold);
        paragraph.AddSpace(11);

        paragraph.AddFormattedText("Business Group: ", TextFormat.Bold);
        paragraph.AddFormattedText(lblEmplCateg.Text, TextFormat.NotBold);

        paragraph.Format.SpaceAfter = "0.5cm";
        paragraph = section.AddParagraph("PART A - Completed by employee");
        paragraph.Format.Font.Bold = true;
        paragraph.Format.Font.Color = MigraDoc.DocumentObjectModel.Colors.IndianRed;

        foreach (RepeaterItem rptItem in rptSummaryQues.Items)
        {           
            Label lblQuestions = (Label)rptItem.FindControl("lblQuestions");
            TextBox txtAnswer = (TextBox)rptItem.FindControl("txtAnswer");

            paragraph.Format.SpaceAfter = "0.2cm";
            paragraph = section.AddParagraph(lblQuestions.Text);
            paragraph.Format.Font.Bold = true;
            paragraph.Format.Font.Color = MigraDoc.DocumentObjectModel.Colors.IndianRed;

            paragraph.Format.SpaceAfter = "0.1cm";
            paragraph = section.AddParagraph(txtAnswer.Text);

        }
        
        paragraph.Format.SpaceAfter = "0.5cm";
        paragraph = section.AddParagraph("PART B - Completed by employee and employer");
        paragraph.Format.Font.Bold = true;
        paragraph.Format.Font.Color = MigraDoc.DocumentObjectModel.Colors.IndianRed;

        // Create the item table
        MigraDoc.DocumentObjectModel.Tables.Table table = section.AddTable();
        table.Style = "Table";
        table.Borders.Color = TableBorder;
        table.Borders.Width = 0.25;
        table.Borders.Left.Width = 0.5;
        table.Borders.Right.Width = 0.5;
        table.Rows.LeftIndent = 0;

        // Before you can add a row, you must define the columns
        Column column = table.AddColumn("3.4cm");
        column.Format.Alignment = ParagraphAlignment.Center;

        column = table.AddColumn("3cm");
        column.Format.Alignment = ParagraphAlignment.Right;
        column = table.AddColumn("3cm");
        column.Format.Alignment = ParagraphAlignment.Right;
        column = table.AddColumn("3cm");
        column.Format.Alignment = ParagraphAlignment.Right;
        column = table.AddColumn("3cm");
        column.Format.Alignment = ParagraphAlignment.Right;
        column = table.AddColumn("3cm");
        column.Format.Alignment = ParagraphAlignment.Right;
        column = table.AddColumn("2.5cm");
        column.Format.Alignment = ParagraphAlignment.Right;

        // Create the header of the table
        Row row = table.AddRow();
        row.HeadingFormat = true;
        row.Format.Alignment = ParagraphAlignment.Center;
        row.Format.Font.Bold = true;
        row.Shading.Color = TableBlue;

        row.Cells[0].AddParagraph("Area of Evaluation");
        row.Cells[0].Format.Alignment = ParagraphAlignment.Left;
        row.Cells[0].VerticalAlignment = VerticalAlignment.Bottom;

        row.Cells[0].Format.Font.Color = MigraDoc.DocumentObjectModel.Colors.IndianRed;
        row.Cells[6].Format.Font.Color = MigraDoc.DocumentObjectModel.Colors.OrangeRed;

        if (Session["oDsRatingScaleTitle"] != null)
        {
            oBll.oDsRatingScaleTitle = (DataSet)Session["oDsRatingScaleTitle"];

            for (int iRowCount = 0; iRowCount < oBll.oDsRatingScaleTitle.Tables[0].Rows.Count; iRowCount++)
            {
                switch (iRowCount)
                {
                    case 0:
                        row.Cells[1].AddParagraph("(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[0]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[0]["Title"].ToString());
                        row.Cells[1].Format.Alignment = ParagraphAlignment.Left;
                        row.Cells[1].VerticalAlignment = VerticalAlignment.Bottom;
                        break;
                    case 1:
                        row.Cells[2].AddParagraph("(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[1]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[1]["Title"].ToString());
                        row.Cells[2].Format.Alignment = ParagraphAlignment.Left;
                        row.Cells[2].VerticalAlignment = VerticalAlignment.Bottom;
                        break;
                    case 2:
                        row.Cells[3].AddParagraph("(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[2]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[2]["Title"].ToString());
                        row.Cells[3].Format.Alignment = ParagraphAlignment.Left;
                        row.Cells[3].VerticalAlignment = VerticalAlignment.Bottom;
                        break;
                    case 3:
                        row.Cells[4].AddParagraph("(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[3]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[3]["Title"].ToString());
                        row.Cells[4].Format.Alignment = ParagraphAlignment.Left;
                        row.Cells[4].VerticalAlignment = VerticalAlignment.Bottom;
                        break;
                    case 4:
                        row.Cells[5].AddParagraph("(" + oBll.oDsRatingScaleTitle.Tables[0].Rows[4]["Rating_Order"].ToString() + ")" + oBll.oDsRatingScaleTitle.Tables[0].Rows[4]["Title"].ToString());
                        row.Cells[5].Format.Alignment = ParagraphAlignment.Left;
                        row.Cells[5].VerticalAlignment = VerticalAlignment.Bottom;
                        break;
                }
            }
            row.Cells[6].AddParagraph("Employer Evaluation");
            row.Cells[6].Format.Alignment = ParagraphAlignment.Left;
            row.Cells[6].VerticalAlignment = VerticalAlignment.Bottom;
        }

        foreach (RepeaterItem rptItem in rptQuestions.Items)
        {
            Label lblQuestions = (Label)rptItem.FindControl("lblQuestions");
            row = table.AddRow();
            row.HeadingFormat = true;
            row.Format.Alignment = ParagraphAlignment.Center;
            row.Format.Font.Bold = true;


            row.Cells[0].AddParagraph(lblQuestions.Text);
            row.Cells[0].Format.Alignment = ParagraphAlignment.Left;
            row.Cells[0].Format.Font.Bold = false;

            DropDownList ddlEmployerEval = (DropDownList)rptItem.FindControl("ddlEmployerEval");
            RadioButton rdoQuestions1 = (RadioButton)rptItem.FindControl("rdoQuestions1");
            RadioButton rdoQuestions2 = (RadioButton)rptItem.FindControl("rdoQuestions2");
            RadioButton rdoQuestions3 = (RadioButton)rptItem.FindControl("rdoQuestions3");
            RadioButton rdoQuestions4 = (RadioButton)rptItem.FindControl("rdoQuestions4");
            RadioButton rdoQuestions5 = (RadioButton)rptItem.FindControl("rdoQuestions5");

            CheckBox chkQuestions1 = (CheckBox)rptItem.FindControl("chkQuestions1");
            CheckBox chkQuestions2 = (CheckBox)rptItem.FindControl("chkQuestions2");
            CheckBox chkQuestions3 = (CheckBox)rptItem.FindControl("chkQuestions3");
            CheckBox chkQuestions4 = (CheckBox)rptItem.FindControl("chkQuestions4");
            CheckBox chkQuestions5 = (CheckBox)rptItem.FindControl("chkQuestions5");
            if (rdoQuestions1.Visible == true)
            {
                if (rdoQuestions1.Checked == true)
                {
                    row.Cells[1].AddParagraph("Yes");
                    row.Cells[1].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[1].Format.Font.Bold = false;
                }

                else if (rdoQuestions2.Checked == true)
                {
                    row.Cells[2].AddParagraph("Yes");
                    row.Cells[2].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[2].Format.Font.Bold = false;
                }

                else if (rdoQuestions3.Checked == true)
                {
                    row.Cells[3].AddParagraph("Yes");
                    row.Cells[3].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[3].Format.Font.Bold = false;
                }
                else if (rdoQuestions4.Checked == true)
                {
                    row.Cells[4].AddParagraph("Yes");
                    row.Cells[4].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[4].Format.Font.Bold = false;
                }
                else if (rdoQuestions5.Checked == true)
                {
                    row.Cells[5].AddParagraph("Yes");
                    row.Cells[5].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[5].Format.Font.Bold = false;
                }

            }

            else if (chkQuestions1.Visible == true)
            {
                if (chkQuestions1.Checked == true)
                {
                    row.Cells[1].AddParagraph("Yes");
                    row.Cells[1].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[1].Format.Font.Bold = false;
                }

                if (chkQuestions2.Checked == true)
                {
                    row.Cells[2].AddParagraph("Yes");
                    row.Cells[2].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[2].Format.Font.Bold = false;
                }

                if (chkQuestions3.Checked == true)
                {
                    row.Cells[3].AddParagraph("Yes");
                    row.Cells[3].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[3].Format.Font.Bold = false;
                }
                if (chkQuestions4.Checked == true)
                {
                    row.Cells[4].AddParagraph("Yes");
                    row.Cells[4].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[4].Format.Font.Bold = false;
                }
                if (chkQuestions5.Checked == true)
                {
                    row.Cells[5].AddParagraph("Yes");
                    row.Cells[5].Format.Alignment = ParagraphAlignment.Left;
                    row.Cells[5].Format.Font.Bold = false;
                }

            }

            row.Cells[6].AddParagraph(ddlEmployerEval.SelectedItem.Text);
            row.Cells[6].Format.Alignment = ParagraphAlignment.Left;
            row.Cells[6].Format.Font.Bold = false;

        }


        paragraph = section.AddParagraph(lblEmpEvalGrade.Text + ": ");
        paragraph.Format.Font.Color = MigraDoc.DocumentObjectModel.Colors.IndianRed;
        paragraph.Format.SpaceBefore = "0.5cm";
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(ddlEmpEvalGrade.SelectedItem.Text, TextFormat.NotBold);

        paragraph = section.AddParagraph(lblSuperVisComments.Text);
        paragraph.Format.SpaceBefore = "0.5cm";
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(txtSuperVisComments.Text, TextFormat.NotBold);

        paragraph = section.AddParagraph(lblEmpSignature.Text);
        paragraph.Format.SpaceBefore = "0.5cm";
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(txtEmployeeSign.Text, TextFormat.NotBold);

        paragraph.AddSpace(30);
        paragraph.AddFormattedText(lblSupervSignature.Text);
        paragraph.Format.SpaceBefore = "0.5cm";
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(txtSupervisorSign.Text, TextFormat.NotBold);

        paragraph = section.AddParagraph("Date:");
        paragraph.Format.SpaceBefore = "0.5cm";
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(txtEmployeeSignDate.Text, TextFormat.NotBold);

        paragraph.AddSpace(36);
        paragraph.AddFormattedText("Supervisor Name:");
        paragraph.Format.SpaceBefore = "0.5cm";
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(txtSupervisorName.Text, TextFormat.NotBold);


        paragraph = section.AddParagraph();
        paragraph.AddSpace(63);
        paragraph.AddFormattedText("Date: ");
        paragraph.Format.SpaceBefore = "0.5cm";
        paragraph.Format.Font.Bold = true;
        paragraph.AddFormattedText(txtSupervSignDate.Text, TextFormat.NotBold);

        //paragraph = section.AddParagraph();
        //paragraph.Format.SpaceBefore = "1.2cm";
        //paragraph.AddFormattedText("Signature of Authorized Person ", TextFormat.Bold);


        MigraDoc.Rendering.DocumentRenderer docRenderer = new DocumentRenderer(document);
        docRenderer.PrepareDocument();

        int pageCount = docRenderer.FormattedDocument.PageCount;

        for (int idx = 0; idx < pageCount; idx++)
        {
            docRenderer.RenderPage(gfx, idx + 1);
            if (idx < pageCount - 1)
            {
                
                page = pdfDocument.AddPage();
                page.Size = PdfSharp.PageSize.A4;
                
                //paragraph.Format.SpaceBefore = "0.5cm";
                gfx = XGraphics.FromPdfPage(page);
                gfx.MUH = PdfFontEncoding.Unicode;
                gfx.MFEH = PdfFontEmbedding.Default;
                
            }

        }

    }



    readonly static Color TableBorder = new Color(81, 125, 192);
    readonly static Color TableBlue = new Color(235, 240, 249);
    readonly static Color TableGray = new Color(242, 242, 242);
    readonly static Color ContentColor = new Color(81, 125, 192);

    #endregion

}