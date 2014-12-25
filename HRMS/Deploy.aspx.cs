using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Data;

public partial class Deploy : System.Web.UI.Page
{
    private string sql_con = "Data Source=ADMIN-PC\\SQLEXPRESS;Initial Catalog=HRMS;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {

    }  

    protected void btnDatabase_Click(object sender, EventArgs e)
    {
        CreateBatchFileProc();
    }

    protected void btnDbTables_Click(object sender, EventArgs e)
    {
        CreateBatchFileTable();
    }

    private void CreateBatchFileTable()
    {
        try
        {
            string sqlConnectionString = sql_con;
            SqlConnection conn = new SqlConnection(sqlConnectionString);
          
            SqlDataAdapter da = new SqlDataAdapter("sp_ScriptTable",conn);
            DataSet oDs = new DataSet();
            da.Fill(oDs);
            sqlConnectionString = "uid=" + txtLogin.Text + ";password=" + txtDatabasePassword.Text + ";database=" + txtDatabaseName.Text + ";server=" + txtServer.Text + ";";          
            conn = new SqlConnection(sqlConnectionString);
            SqlCommand cmd;
            for (int iRowCount = 0; iRowCount < oDs.Tables[0].Rows.Count; iRowCount++)
            {
                cmd = new SqlCommand(oDs.Tables[0].Rows[iRowCount]["Script"].ToString(), conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            lblMsg.Text = "Tables Created Successfully";
        }
        catch (Exception Ex)
        {
            lblMsg.Text = Ex.Message;
            //lblMsg.Text = "Invalid Details Entered.Please verify";
        }
    }

    private void CreateBatchFileProc()
    {
        try
        {
            
            string sqlConnectionString = sql_con;
            SqlConnection conn = new SqlConnection(sqlConnectionString);
          
            SqlDataAdapter da = new SqlDataAdapter("sp_ScriptSP",conn);
            DataSet oDs = new DataSet();
            da.Fill(oDs);
            sqlConnectionString = "uid=" + txtLogin.Text + ";password=" + txtDatabasePassword.Text + ";database=" + txtDatabaseName.Text + ";server=" + txtServer.Text + ";";          
            conn = new SqlConnection(sqlConnectionString);
            SqlCommand cmd;
            for (int iRowCount = 0; iRowCount < oDs.Tables[0].Rows.Count; iRowCount++)
            {
                cmd = new SqlCommand(oDs.Tables[0].Rows[iRowCount]["Script"].ToString(), conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            lblMsg.Text = "Procedures Created Successfully";
        }
        catch (Exception Ex)
        {
            lblMsg.Text = Ex.Message;
            //lblMsg.Text = "Invalid Details Entered.Please verify";
        }
       
    }
}
