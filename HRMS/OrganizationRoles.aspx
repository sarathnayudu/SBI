<%@ Page Title="Organization Roles" Language="C#" MasterPageFile="~/Main.master"
    AutoEventWireup="true" CodeFile="OrganizationRoles.aspx.cs" Inherits="OrganizationRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">Organization Roles:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            <tr>
                <td colspan="3">
                    <div style="float: right;">
                        All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                </td>
            </tr>
            <tr class="trBg">
                    <td colspan="6">
                        <div style="float: left;">
                            Roles:</div>
                    </td>
                </tr>
            <tr class="trBorder">
                <td style="width:12%;">
                    Role Name:<asp:RequiredFieldValidator ID="rfvOrgRoleName" SetFocusOnError="true"
                        ErrorMessage="Please Enter Organization Role" ControlToValidate="txtRoleName"
                        ValidationGroup="valOrganizationRoles" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width:85%;" colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtRoleName" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td >
                <%--<td colspan="3"></td>--%>
              
            </tr>
            <tr>
                <td>
                    Role Description:<asp:RequiredFieldValidator ID="rfvOrgRoleDesc" ControlToValidate="txtRoleDesc"
                        SetFocusOnError="true" ErrorMessage="Please Enter Organization Role Description"
                        ValidationGroup="valOrganizationRoles" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtRoleDesc" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <%--<td colspan="3"></td>--%>
                
            </tr>
            <tr>
                <td>
                    Status:
                
                </td>
                <td>
                    <%--<span style="color: Red">*</span>--%>
                </td>
                <td colspan="4">
                    <asp:DropDownList ID="ddlStatus" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
               <%-- <td colspan="3"></td>--%>
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSaveRole" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valOrganizationRoles"
                        OnClick="btnSaveRole_Click" />&nbsp;
                    <asp:Button ID="btnResetRole" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnResetRole_Click" />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valOrganizationRoles" />
                        <br />
                        <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                       <br />
                       <asp:GridView ID="gvOrgRoles" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                         AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" 
                        OnSelectedIndexChanging="gvOrgRoles_SelectedIndexChanging" 
                        onrowdeleting="gvOrgRoles_RowDeleting" OnRowDataBound="gvOrgRoles_RowDataBound"> 
                        
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblSno" runat="server" Visible="false" Text='<%#Eval("PK_Org_RoleID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    RoleName</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleName" runat="server"  Text='<%#Eval("Org_Role_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    RoleDescription</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleDesc" runat="server"  Text='<%#Eval("Org_Role_Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    <asp:Label ID="lblStatus1" runat="server"  Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" CssClass="main1" runat="server" Text="Edit" CommandName="Select"></asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="lnkDelete" CssClass="main1" runat="server" Text="Delete" CommandName="Delete"
                                        OnClientClick="javascript:return confirm('Are you sure you want to delete this record?')"></asp:LinkButton>&nbsp;&nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView> 
                </td>
            </tr>
           
            
        </table>
    </fieldset>
   <asp:HiddenField ID="hdnOrgRoleID" runat="server" />
    <asp:HiddenField ID="hdnSno" runat="server" />
</asp:Content>