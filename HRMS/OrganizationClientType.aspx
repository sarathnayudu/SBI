<%@ Page Title="OrganizationClientType" Language="C#" MasterPageFile="~/Main.master"
    AutoEventWireup="true" CodeFile="OrganizationClientType.aspx.cs" Inherits="OrganizationClientType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">Organization Client Type:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            <tr>
                <td colspan="3">
                    <div style="float: right;">
                        All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                </td>
            </tr>
            <tr class="trBg">
            <td colspan="6">
            <div style="float:left;">
                       Client Type:</div>
            </td>
            </tr>
            <tr class="trBorder">
                <td style="width: 100px;">
                    Client Type:<asp:RequiredFieldValidator ID="rfvOrgClntType" ControlToValidate="txtClientType"
                        ErrorMessage="Please Enter Client Type" SetFocusOnError="true" Display="None"
                        ValidationGroup="valOrganizationClientType" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td style="width: 50px;">
                    <span style="color: Red">*</span>
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtClientType" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <td colspan="3"></td>
             
            </tr>
            <tr>
                <td>
                    Status:
                </td>
                <td>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCTypStatus" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSaveClieTyp" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valOrganizationClientType"
                        OnClick="btnSaveClieTyp_Click" />&nbsp;
                    <asp:Button ID="btnResetClieTyp" runat="server" Text="Reset" CssClass="btnStyle"
                        OnClick="btnResetClieTyp_Click" />
                    <asp:ValidationSummary ID="valOrgClintType" ShowMessageBox="true" ShowSummary="false"
                        ValidationGroup="valOrganizationClientType" runat="server" />
                </td>
               
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <asp:GridView ID="gvOrgClientType" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle" EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" OnSelectedIndexChanging="gvOrgClientType_SelectedIndexChanging"
                        onrowdeleting="gvOrgClientType_RowDeleting" OnRowDataBound="gvOrgClientType_RowDataBound">
                        <Columns>
                        
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblSno" runat="server" Visible="False" Text='<%#Eval("Pk_Org_ClientTypeID") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Client Type</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblClientType" runat="server" Text='<%#Eval("Org_ClientType") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Created By</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedBy" runat="server" Text='<%#Eval("Rec_CreatedBy") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Created Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDate" runat="server" Text='<%#Eval("Rec_CreatedDate","{0:MM/dd/yyyy}") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Modified By</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblModifiedBy" runat="server" Text='<%#Eval("Rec_ModifiedBy") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Modified Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblModDate" runat="server" Text='<%#Eval("Rec_ModifiedDate","{0:MM/dd/yyyy}") %>'></asp:Label></ItemTemplate>
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
    <asp:HiddenField ID="hdnOrgID" runat="server" />
    <asp:HiddenField ID="hdnSno" runat="server" />
</asp:Content>