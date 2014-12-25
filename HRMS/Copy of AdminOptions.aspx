<%@ Page Title="Admin Options" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="AdminOptions.aspx.cs" Inherits="AdminOptions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <div>
        <table border="0" class="tblStyle FormStyle" cellpadding="3" width="80%" cellspacing="3">
            <tr class="trBg">
                <td colspan="3">
                    <div style="float: left;">
                        Administration:</div>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="lnkClientType" Visible="false" Style="font-size: 10pt;" NavigateUrl="~/OrganizationClientType.aspx"
                        runat="server" CssClass="main" Text="Organization Client Type"></asp:HyperLink>
                    <asp:HyperLink ID="HyperLink1" Style="font-size: 10pt;" NavigateUrl="~/TimeOffType.aspx"
                        runat="server" CssClass="main" Text="Manage TimeOff Types"></asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="lnkOrgRole" Style="font-size: 10pt;" NavigateUrl="~/OrganizationRoles.aspx"
                        CssClass="main" runat="server" Text="Manage Roles"></asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="lnkPagePermissions" Style="font-size: 10pt;" NavigateUrl="~/PagePermission.aspx"
                        CssClass="main" runat="server" Text="Manage Security"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink2" Style="font-size: 10pt;" NavigateUrl="~/Holidays.aspx"
                        CssClass="main" runat="server" Text="Manage Holidays"></asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink3" Style="font-size: 10pt;" NavigateUrl="~/EmailSetting.aspx"
                        CssClass="main" runat="server" Text="Manage Email Notifications"></asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink4" Style="font-size: 10pt;" NavigateUrl="~/EmployeeDocs.aspx"
                        CssClass="main" runat="server" Text="Manage Documents"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink5" Style="font-size: 10pt;" NavigateUrl="~/ImportEmployees.aspx"
                        runat="server" CssClass="main" Text="Import Employees"></asp:HyperLink>
                    
                </td>
                <td></td>
                <td></td>
                </tr>
            </table>
    </div>
</asp:Content>