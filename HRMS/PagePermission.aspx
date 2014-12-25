<%@ Page Title="Page Permission" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="PagePermission.aspx.cs" Inherits="PagePermission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
 <fieldset>
        <legend class="MainLegendStyle">Administration:Role Permission</legend>
        
        <table cellpadding="2" cellspacing="2" border="0">
        <tr> <td class="roleStyle">
                        Role
                        </td>
                       
                        <td>
                        <asp:DropDownList ID="ddlRole" AutoPostBack="true" runat="server" AppendDataBoundItems="true" 
                                CssClass="ddl" onselectedindexchanged="ddlRole_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                     <tr> <td class="roleStyle">
                        Pages
                        </td>
                        
                        <td>
                        <asp:DropDownList ID="ddlPages" AutoPostBack="true" runat="server" AppendDataBoundItems="true" 
                                CssClass="ddl" onselectedindexchanged="ddlPages_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
        </table>
        <div style="margin-top: 20px;">
        
            <asp:GridView ID="gvPagePermissions" runat="server" Width="98%" CssClass="gridViewStyle"
                 RowStyle-CssClass="rowStyle"
                EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" 
                onrowdatabound="gvPagePermissions_RowDataBound" >
<RowStyle CssClass="rowStyle"></RowStyle>
                <Columns>
                    <asp:TemplateField>
                    <HeaderStyle Width="200" />
                        <HeaderTemplate > 
                            Roles  
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblRolePermissionID" Visible="false" runat="server" Text='<%#Eval("PK_RolePermission_ID") %>'></asp:Label>
                            <asp:Label ID="lblRoleName" runat="server" Text='<%#Eval("Org_Role_Name") %>'></asp:Label> 
                                                    </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                     <HeaderStyle Width="300" />
                        <HeaderTemplate>
                           Page Description
                            
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPageName" runat="server" Text='<%#Eval("Page_Name") %>'></asp:Label>
                             <asp:Label ID="lblRoleID" Visible="false" runat="server" Text='<%#Eval("PK_Org_RoleID") %>'></asp:Label>
                             <asp:Label ID="lblPageID" Visible="false" runat="server" Text='<%#Eval("Pk_PageID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                     
                        <HeaderTemplate>
                           Permissions                            
                            </HeaderTemplate>
                        <ItemTemplate>
                        <div style="text-align:left;">
                            <asp:CheckBoxList ID="chkPermissions" RepeatDirection="Horizontal"  CellPadding="2" CellSpacing="2" runat="server">
                            <asp:ListItem Text="Add" Value="A"></asp:ListItem>
                            <asp:ListItem Text="View" Value="V"></asp:ListItem>
                            <asp:ListItem Text="Delete" Value="D"></asp:ListItem>
                            <asp:ListItem Text="Edit" Value="E"></asp:ListItem>
                            </asp:CheckBoxList>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>

<HeaderStyle CssClass="gvHeader"></HeaderStyle>

<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
            </asp:GridView>
        <div style="float: left;margin-left:10px;"><asp:Button ID="btnSave" runat="server" 
                Text="Update" CssClass="btnStyle" onclick="btnSave_Click" /> </div>
        </fieldset>
</asp:Content>