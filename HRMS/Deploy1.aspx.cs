using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;
using System.Data.SqlClient;


public partial class Deploy1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    private void CreateBatchFileTable()
    {
        try
        {
           // //StreamWriter sw = new StreamWriter(Server.MapPath("~/scriptsTB.bat"));
           // string strSqlPath = Server.MapPath("~/scriptsTB.sql");
           // strSqlPath = '"' + strSqlPath + '"';
           // string strBatch = "sqlcmd -S " + txtServer.Text + " -d " + txtDatabaseName.Text + " -U " + txtLogin.Text + " -P " + txtDatabasePassword.Text + " -i " + strSqlPath;
           // //sw.WriteLine(strBatch);
           // //sw.Close();
           // //Process.Start(Server.MapPath("~/scriptsTB.bat"));

           

           // // Create the ProcessInfo object
           // System.Diagnostics.ProcessStartInfo psi =
           //         new System.Diagnostics.ProcessStartInfo("cmd.exe");
           // psi.UseShellExecute = false;
           // psi.RedirectStandardOutput = true;
           // psi.RedirectStandardInput = true;
           // psi.RedirectStandardError = true;
           //psi.CreateNoWindow = true;
           // // Start the process
           // System.Diagnostics.Process proc =
           //            System.Diagnostics.Process.Start(psi);

           // // Open the batch file for reading
           // //System.IO.StreamReader strm = 
           // //           System.IO.File.OpenText(strFilePath);
           // System.IO.StreamReader strm = proc.StandardError;
           // // Attach the output for reading
           // System.IO.StreamReader sOut = proc.StandardOutput;

           // // Attach the in for writing
           // System.IO.StreamWriter sIn = proc.StandardInput;

           // // Write each line of the batch file to standard input
           // /*while(strm.Peek() != -1)
           // {
           //     sIn.WriteLine(strm.ReadLine());
           // }*/
           // sIn.WriteLine(strBatch);
            
           // strm.Close();

            string sqlConnectionString = "uid=" + txtLogin.Text + ";password=" + txtDatabasePassword.Text + ";database=" + txtDatabaseName.Text + ";server=" + txtServer.Text + ";";
            FileInfo file = new FileInfo(Server.MapPath("~/test.sql"));
            string script = file.OpenText().ReadToEnd();
            SqlConnection conn = new SqlConnection(sqlConnectionString);
            SqlCommand cmd = new SqlCommand(script, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            lblMsg.Text = "Tables Created Successfully";
        }
        catch (Exception Ex)
        {
            lblMsg.Text = "Invalid Details Entered.Please verify";
        }
    }

    private void CreateBatchFileProc()
    {
        try
        {
            ////StreamWriter sw = new StreamWriter(Server.MapPath("~/scriptsSP.bat"));
            //string strSqlPath = Server.MapPath("~/scriptsSP.sql");
            //strSqlPath ='"'+ strSqlPath+'"';
            //string strBatch = "sqlcmd -S " + txtServer.Text + " -d " + txtDatabaseName.Text + " -U " + txtLogin.Text + " -P " + txtDatabasePassword.Text + " -i " + strSqlPath;
            ////sw.WriteLine(strBatch);
            ////sw.Close();
            ////Process.Start(Server.MapPath("~/scriptsSP.bat"));

            //System.Diagnostics.ProcessStartInfo psi =
            //      new System.Diagnostics.ProcessStartInfo("cmd.exe");
            //psi.UseShellExecute = false;
            //psi.RedirectStandardOutput = true;
            //psi.RedirectStandardInput = true;
            //psi.RedirectStandardError = true;
            //psi.CreateNoWindow = true;
            //// Start the process
            //System.Diagnostics.Process proc =
            //           System.Diagnostics.Process.Start(psi);

            //// Open the batch file for reading
            ////System.IO.StreamReader strm = 
            ////           System.IO.File.OpenText(strFilePath);
            //System.IO.StreamReader strm = proc.StandardError;
            //// Attach the output for reading
            //System.IO.StreamReader sOut = proc.StandardOutput;

            //// Attach the in for writing
            //System.IO.StreamWriter sIn = proc.StandardInput;

            //// Write each line of the batch file to standard input
            ///*while(strm.Peek() != -1)
            //{
            //    sIn.WriteLine(strm.ReadLine());
            //}*/
            //sIn.WriteLine(strBatch);
            //strm.Close();

            string sqlConnectionString = "uid=" + txtLogin.Text + ";password=" + txtDatabasePassword.Text + ";database=" + txtDatabaseName.Text + ";server=" + txtServer.Text + ";";
            FileInfo file = new FileInfo(Server.MapPath("~/testsp.sql"));
            string script = file.OpenText().ReadToEnd();
            SqlConnection conn = new SqlConnection(sqlConnectionString);
            SqlCommand cmd = new SqlCommand(script, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            lblMsg.Text = "Procedures Created Successfully";
        }
        catch (Exception Ex)
        {
            lblMsg.Text = Ex.Message;
            
        }
    }

    protected void btnDatabase_Click(object sender, EventArgs e)
    {
        CreateBatchFileProc();
    }

    protected void btnDbTables_Click(object sender, EventArgs e)
    {
        CreateBatchFileTable();
    }
}
