<%@ Page Title="Holidays" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Holidays.aspx.cs" Inherits="Holidays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">Holidays:</legend>
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
                      Create Holidays:</div>
            </td>
            </tr>
             <tr>
                <td style="width: 10%;">
                    Holiday Name:
                </td>
                <td >
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 88%;">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtHolidayName" CssClass="txtbox"  runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtHolidayName"
                        ErrorMessage="Please Enter Holiday Name" SetFocusOnError="true" Display="None"
                        ValidationGroup="valHolidays" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td colspan="3"></td>
             
            </tr>
             <tr>
                <td style="width: 100px;">
                    Holiday Date:
                </td>
                <td style="width: 50px;">
                    
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtDate" CssClass="txtbox"  runat="server"></asp:TextBox>
                    </div>
                    <ajaxToolkit:MaskedEditExtender ID="maskTermDate" runat="server" MaskType="Date"
                                    Mask="99/99/9999" TargetControlID="txtDate" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                </td>
                <td colspan="3"></td>
             
            </tr>
            <tr>
                <td style="width: 100px;">
                    Description:
                </td>
                <td style="width: 50px;">
                    
                </td>
                <td>
                    
                        <asp:TextBox ID="txtHolDesc" style="width:300px;" CssClass="txtMultiline" TextMode="MultiLine" runat="server"></asp:TextBox>
                    
                   
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valHolidays"
                        OnClick="btnSave_Click" />&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle"
                        OnClick="btnReset_Click" />
                    <asp:ValidationSummary ID="vsHolidays" ShowMessageBox="true" ShowSummary="false"
                        ValidationGroup="valHolidays" runat="server" />
                        <br />
                        <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                        <br />
                        <asp:GridView ID="gvHolidays" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle" AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" OnSelectedIndexChanging="gvHolidays_SelectedIndexChanging"
                        onrowdeleting="gvHolidays_RowDeleting" OnRowDataBound="gvHolidays_RowDataBound">
                        <Columns>
                        
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblHolidaysID" runat="server" Visible="False" Text='<%#Eval("PK_HolidaysID") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Holidays Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblHolName" runat="server" Text='<%#Eval("Holidays_Name") %>'></asp:Label>
                                    <asp:Label ID="lblHolDesc" runat="server" Visible="false" Text='<%#Eval("Holidays_Description") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   Holidays Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblHolDate" runat="server" Text='<%#Eval("Holidays_Date","{0:MM/dd/yyyy}") %>'></asp:Label>                                   
                                    </ItemTemplate>
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
    <asp:HiddenField ID="hdnHolidaysID" runat="server" />
</asp:Content>