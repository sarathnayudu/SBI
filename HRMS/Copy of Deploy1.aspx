<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Deploy1.aspx.cs" Inherits="Deploy1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Execute Database Scripts</title>
    <style type="text/css">
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
            background-image: url(images/bg.jpg);
            background-repeat: repeat-x;
            background-position: center top;
            background-color: #5092cf;
            color: #ffffff;
        }
        a.main:link
        {
            color: #16497e;
            text-decoration: none;
            font-size: 8pt;
            font-weight: bold;
            font-family: Verdana;
        }
        input.text
        {
            font-family: Verdana, Arial, Helvetica, sans-serif;
            color: #333333;
            border: 1px solid #e2e9ee;
            padding: 0.15em;
            width: 140px;
            background: #f7fafc;
            font: 0.95em Verdana, sans-serif;
            -moz-border-radius: 0.4em;
            -khtml-border-radius: 0.4em;
            -webkit-border-radius: 0.4em;
        }
        .lblStyle
        {
            font-family:Arial;
            color:#ffffff;
            font-size:13pt;
            font-weight:bold;
        }
        .btnStyle
{ 
  width:80px;
  background-color:Silver;
  color:#222222;
  font-family:Arial;
  border:solid 1px #999999;
 }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" valign="top">
                    <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">
                                <div>
                                    <div style="padding: 250px 0px 0px 310px; text-align: left;">
                                        <table cellpadding="3" cellspacing="3" border="0">
                                        <tr>
                                        <td></td>
                                        <td >
                                        <asp:Label ID="lblLogin" runat="server" Text="Database Credentials" CssClass="lblStyle"></asp:Label>
                                        </td></tr>
                                            <tr>
                                                <td>
                                                    Database Server Address :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtServer" CssClass="text" Style="width: 280px;" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvServer" runat="server" ControlToValidate="txtServer"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Database Server Address" Display="None" ValidationGroup="valDatabase"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Database Name :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDatabaseName" CssClass="text" Style="width: 280px;" 
                                                        runat="server"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="rfvDatabaseName" runat="server" ControlToValidate="txtDatabaseName"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Database Name" Display="None" ValidationGroup="valDatabase"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Database Login ID :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtLogin" CssClass="text" Style="width: 280px;" runat="server"
                                                        ></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLogin"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Database Login ID" Display="None" ValidationGroup="valDatabase"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Database Password :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtDatabasePassword" CssClass="text" Style="width: 280px;" runat="server"
                                                        TextMode="Password"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDatabasePassword"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Database Password" Display="None" ValidationGroup="valDatabase"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td align="right" colspan="2">
                                                <asp:Button ID="btnDbTables" runat="server" Text="Create Tables"
                                                        ValidationGroup="valDatabase" onclick="btnDbTables_Click" />
                                                 <asp:Button ID="btnDatabase" runat="server" Text="Create Stored Procedures"
                                                        ValidationGroup="valDatabase" onclick="btnDatabase_Click" />
                                                        <asp:ValidationSummary ID="vsDatabase" runat="server" ValidationGroup="valDatabase" ShowMessageBox="true" ShowSummary="false" />
                                                        
                                                </td>
                                            </tr>
                                            <tr><td colspan="2"><asp:Label ID="lblMsg" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></td></tr>
                                        </table>
                                    </div>
                                   
                                </div>
                               
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
