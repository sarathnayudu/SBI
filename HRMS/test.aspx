<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>    
</head>
<body>
    <form id="form1" runat="server">
    <div>    
    
    <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
    <asp:Button ID="btnRemove" runat="server" Text="Remove" onclick="btnRemove_Click" />
    <br />
    <table><tr><td>
    <asp:PlaceHolder ID="phHolder" runat="server"></asp:PlaceHolder>
    </td></tr></table>
   
    <asp:Button ID="btnDisplayContent" runat="server" Text="Display Content" onclick="btnDisplayContent_Click" />
   
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
    </form>
</body>
</html>
