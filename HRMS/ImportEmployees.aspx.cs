using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Configuration;
using System.IO;

public partial class ImportEmployees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDbImportEmp_Click(object sender, EventArgs e)
    {

        UploadFile(FileUpload1);
        string strExcelFilePath = Server.MapPath("~/EmployeeData.xlsx");
        ImportDataFromExcel(strExcelFilePath);
    }

    private void UploadFile(FileUpload flFile)
    {
        
        if (flFile.HasFile)
        {
            try
            {
                string empExt = Path.GetExtension(flFile.FileName);
                string SaveLocation = Server.MapPath("~/") + "EmployeeData" + empExt;
                FileUpload1.SaveAs(SaveLocation);

            }

            catch (Exception ex)
            {
            }

        }
       
    }


    private void ImportDataFromExcel(string strExcelFilePath)
    {
        
        // make sure your sheet name is correct, here sheet name is Sheet1, so you can change your sheet name if have different
        string myExcelDataQuery = "Select * from [Sheet1$]";
        try
        {
            //Create our connection strings
           // string sExcelConnectionString1 = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + excelFilePath + ";Extended Properties=" + "\"Excel 8.0;HDR=YES;\"";
            string sExcelConnectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source="+strExcelFilePath+";Extended Properties="+"\"Excel 12.0 Xml;HDR=YES;\"";

            
            OleDbConnection OleDbConn = new OleDbConnection(sExcelConnectionString);
            OleDbCommand OleDbCmd = new OleDbCommand(myExcelDataQuery, OleDbConn);
            OleDbConn.Open();
            OleDbDataReader dr = OleDbCmd.ExecuteReader();
            Guid EmpID;
            string strEmpCode;
            string strEmpFName;
            string strEmpLName;
            string strEmailID;
            string strPwd;
            string strHiredDate;
            
            //SqlBulkCopy bulkCopy = new SqlBulkCopy(sSqlConnectionString);
            //bulkCopy.DestinationTableName = sSQLTable;
            while (dr.Read())
            {
                EmpID = System.Guid.NewGuid();
                strEmpCode = valid(dr, 0);
                strEmpFName = valid(dr, 1);
                strEmpLName = valid(dr, 2);
                strEmailID = valid(dr, 3);
                strPwd = valid(dr, 4);
                strHiredDate = valid(dr, 5);
                insertdataintosql(EmpID, strEmpCode, strEmpFName, strEmpLName, strEmailID, strPwd, Convert.ToDateTime(strHiredDate));
                //bulkCopy.WriteToServer(dr);
            }
            OleDbConn.Close();
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
            //handle exception
        }
    }

    private string valid(OleDbDataReader myreader, int stval)
    {
        object val = myreader[stval];
        if (val != DBNull.Value)
            return val.ToString();
        else
            return Convert.ToString(0);
    }

     private void insertdataintosql(Guid EmpID,string strEmpCode,string strEmpFName,string strEmpLName,string strEmailID,string strPwd,DateTime dtHiredDate)
    {
        string sSqlConnectionString = ConfigurationSettings.AppSettings["constr"].ToString();

        SqlConnection conn = new SqlConnection(sSqlConnectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        //cmd.CommandText = "insert into test(sno,name) values(@sno,@name)";
        cmd.CommandText="insert into tblOrgEmployees(PK_Org_EmpID,Emp_Code,FK_OrgID,Emp_Fname,Emp_MName,Emp_Lname,Emp_Prefix,Emp_CellPhone,Emp_HomePhone,Emp_BusinessPhone,Emp_EmailID,Emp_AlternateEmail,Emp_JobTitle,Emp_LoginPwd,Emp_HireDate,Emp_TerminationDate,Emp_Home_Address1,Emp_Home_Address2,Emp_Home_City,Emp_Home_State,Emp_Home_PostalCode,Emp_Bus_Address1,Emp_Bus_Address2,Emp_Bus_City,Emp_Bus_State,Emp_Bus_PostalCode,FK_Org_Roles,Rec_CreatedBy,Rec_CreatedDate,Rec_ModifiedBy,Rec_ModifiedDate,ActiveFlag)";
        cmd.CommandText += " values(@PK_Org_EmpID,@Emp_Code,NULL,@Emp_Fname,'',@Emp_Lname,1,'','','',@Emp_EmailID,'','',@Emp_LoginPwd,@Emp_HireDate,NULL,'','','',null,'','','','',null,'',(select PK_Org_RoleID=(select top 1 PK_Org_RoleID from tblOrgRoles where Org_Role_Name='Employee')),'',GETDATE(),'',GETDATE(),1)";

        cmd.Parameters.Add("@PK_Org_EmpID", EmpID);
        cmd.Parameters.Add("@Emp_Code", strEmpCode);
        cmd.Parameters.Add("@Emp_Fname", strEmpFName);
        cmd.Parameters.Add("@Emp_Lname", strEmpLName);
        cmd.Parameters.Add("@Emp_EmailID", strEmailID);
        cmd.Parameters.Add("@Emp_LoginPwd", strPwd);
        cmd.Parameters.Add("@Emp_HireDate", dtHiredDate);        
        cmd.CommandType = CommandType.Text;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
    


}