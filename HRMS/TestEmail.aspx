<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestEmail.aspx.cs" Inherits="TestEmail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="btnSendMail" runat="server" Text="Send Test Email" CssClass="btnStyle" 
                        OnClick="btnSendMail_Click" />
    </div>
    </form>
</body>
</html>
