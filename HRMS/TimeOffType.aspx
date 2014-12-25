<%@ Page Title="TimeOff Type" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TimeOffType.aspx.cs" Inherits="TimeOffType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">TimeOff Type:</legend>
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
                       TimeOff Type:</div>
            </td>
            </tr>
            <tr class="trBorder">
                <td style="width:8%;">
                    Description:
                </td>
                <td >
                    <span style="color: Red">*</span>
                </td>
                <td style="width:90%;">
                    
                        <asp:TextBox ID="txtTimeOffDesc" style="width:300px;" CssClass="txtMultiline" TextMode="MultiLine" runat="server"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="rfvTimeOffType" ControlToValidate="txtTimeOffDesc"
                        ErrorMessage="Please Enter TimeOff Type Description" SetFocusOnError="true" Display="None"
                        ValidationGroup="valTimeOffType" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td colspan="3"></td>
             
            </tr>
            <tr id="tr" runat="server" visible="false">
                <td>
                    Status:
                </td>
                <td>
                </td>
                <td>
                    <asp:DropDownList ID="ddlStatus" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valTimeOffType"
                        OnClick="btnSave_Click" />&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle"
                        OnClick="btnReset_Click" />
                    <asp:ValidationSummary ID="valTimeOffType" ShowMessageBox="true" ShowSummary="false"
                        ValidationGroup="valTimeOffType" runat="server" />
                        
                        <br />
                         <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                         <br />
                       <asp:GridView ID="gvTimeOffType" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"  AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" OnSelectedIndexChanging="gvTimeOffType_SelectedIndexChanging"
                        onrowdeleting="gvTimeOffType_RowDeleting" OnRowDataBound="gvTimeOffType_RowDataBound">
                        <Columns>
                        
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblTimeOffTypeID" runat="server" Visible="False" Text='<%#Eval("PK_TimeOffTypeID") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    TimeOff Type Description</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTimeOffDesc" runat="server" Text='<%#Eval("TimeOffDescription") %>'></asp:Label></ItemTemplate>
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
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    <asp:Label ID="lblStatus1" runat="server"   Text='<%#Eval("ActiveFlag") %>'></asp:Label>
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
    <asp:HiddenField ID="hdnTimeOffTypeID" runat="server" />
</asp:Content>