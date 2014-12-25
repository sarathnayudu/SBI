using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class test : System.Web.UI.Page
{
    private List<string> ControlsList
    {
        get
        {
            if (ViewState["controls"] == null)
            {
                ViewState["controls"] = new List<string>();
            }

            return (List<string>)ViewState["controls"];
        }
    }

     private int NextTextID
     {
         get
         {
             return ControlsList.Count + 1;
         }
     }

     protected override void LoadViewState(object savedState)
     {         
         base.LoadViewState(savedState);
         int iCount = 1,iCountRow=0;
         phHolder.Controls.Add(new LiteralControl("<table border='1' width='400' cellspacing='0' cellpadding='0'>"));
         foreach (string controlID in ControlsList)
         {
             if (iCountRow % 3 == 0)
                 phHolder.Controls.Add(new LiteralControl("<tr>"));
             if (controlID.Contains("lblSno"))
             {
                 phHolder.Controls.Add(new LiteralControl("<td valign='top' style='width:10px;'>"));
                 Label lblSno = new Label();
                 lblSno.ID = controlID;                 
                 string[] strSeq = controlID.Split('-');
               Session["lblid"]= lblSno.Text = strSeq[1];
                 phHolder.Controls.Add(lblSno);
                 phHolder.Controls.Add(new LiteralControl(". "));
                 phHolder.Controls.Add(new LiteralControl("</td>"));
                 iCountRow++;
             }
             else
             {
                 if (iCount % 2 != 0)
                 {
                     phHolder.Controls.Add(new LiteralControl("<td valign='top'>"));
                     TextBox txtProject = new TextBox();
                     txtProject.TextMode = TextBoxMode.MultiLine;
                     txtProject.ID = controlID;

                     phHolder.Controls.Add(txtProject);
                     phHolder.Controls.Add(new LiteralControl("    "));
                     phHolder.Controls.Add(new LiteralControl("</td>"));
                     iCountRow++;

                 }
                 else
                 {
                     phHolder.Controls.Add(new LiteralControl("<td valign='top'>"));
                     TextBox txtDescription = new TextBox();
                     txtDescription.TextMode = TextBoxMode.MultiLine;
                     phHolder.Controls.Add(txtDescription);
                     txtDescription.ID = controlID;
                     phHolder.Controls.Add(new LiteralControl("</td>"));                    
                     iCountRow++;
                 }
                 if (iCountRow % 3 == 0)
                     phHolder.Controls.Add(new LiteralControl("</tr>"));
                 iCount++;
             }

         }
         phHolder.Controls.Add(new LiteralControl("</table>"));

     }
    protected void Page_Load(object sender, EventArgs e)
    {       
       
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
       
        TextBox txtProject = new TextBox();
        TextBox txtDescription = new TextBox();
        Label lblSno = new Label();
        int i = 1;
        if (NextTextID > 1)
        {
            if (Session["lblid"] != null)
                i = Convert.ToInt32(Session["lblid"].ToString());
            i++;
        }
        lblSno.ID = "lblSno-" + i.ToString();
        lblSno.Text = i.ToString();
        txtProject.ID = "txtProject" + NextTextID.ToString();
        txtDescription.ID = "txtDescription" + NextTextID.ToString();
        txtProject.TextMode = TextBoxMode.MultiLine;
        txtDescription.TextMode = TextBoxMode.MultiLine;

        phHolder.Controls.Add(new LiteralControl("<table border='1' width='400' cellspacing='0' cellpadding='0'><tr><td valign='top' style='width:10px;'>"));
        phHolder.Controls.Add(lblSno);
        phHolder.Controls.Add(new LiteralControl(". "));
        phHolder.Controls.Add(new LiteralControl("</td><td>"));
        phHolder.Controls.Add(txtProject);
        phHolder.Controls.Add(new LiteralControl("    "));
        phHolder.Controls.Add(new LiteralControl("</td><td>"));
        phHolder.Controls.Add(txtDescription);
        phHolder.Controls.Add(new LiteralControl("</td></tr></table>"));
        

        ControlsList.Add(lblSno.ID);
        ControlsList.Add(txtProject.ID);
        ControlsList.Add(txtDescription.ID);
        
        if (NextTextID > 15)
        {
            btnAdd.Visible = false;
        }
           
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        for (int iRowCount = phHolder.Controls.Count-1,j=0; iRowCount >= 0; iRowCount--)
        {
            if (j < 3)
            {
                Control ctl = phHolder.Controls[iRowCount];
                if (ctl is TextBox)
                {
                    TextBox txt = (TextBox)ctl;
                    phHolder.Controls.Remove(ctl);
                    ControlsList.Remove(txt.ID);
                    j++;
                }
                else if (ctl is Label)
                {
                    Label lbl = (Label)ctl;
                    phHolder.Controls.Remove(ctl);
                    ControlsList.Remove(lbl.ID);
                    j++;
                }
                else if (ctl is LiteralControl)
                {
                    phHolder.Controls.Remove(ctl);
                }
            }
        }
        btnAdd.Visible = true;
        
        
    }
    protected void btnDisplayContent_Click(object sender, EventArgs e)
    {
        StringBuilder sbText = new StringBuilder();

        foreach (Control ctl in phHolder.Controls)
        {
            if (ctl is TextBox)
            {
                TextBox txt = ctl as TextBox;
                if (ctl != null)
                {
                    sbText.Append(txt.ID);
                    sbText.Append(": ");
                    sbText.Append(txt.Text);
                    sbText.Append("<br>");
                }
            }
        }

        lblMsg.Text = sbText.ToString();        
           
    }

}
