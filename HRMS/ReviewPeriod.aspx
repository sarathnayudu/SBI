<%@ Page Title="Manage Review Period" Language="C#" MasterPageFile="~/Main.master"
    AutoEventWireup="true" CodeFile="ReviewPeriod.aspx.cs" Inherits="ReviewPeriod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">Manage Review Period:</legend>
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
                        Review Period:</div>
                </td>
            </tr>
            <tr class="trBorder">
                <td style="width: 12%;">
                    Review Period Name:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 85%;" colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtRevPerName" CssClass="txtbox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" ErrorMessage="Please Enter Review Period Name"
                            ControlToValidate="txtRevPerName" ValidationGroup="valReview" Display="None"
                            runat="server"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>
            <tr class="trBorder">
                <td>
                    Start Date:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 85%;" colspan="4">
                    <div style="float: left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtStartDate" CssClass="txtbox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvOrgRoleName" SetFocusOnError="true" ErrorMessage="Please Enter Start Date"
                                ControlToValidate="txtStartDate" ValidationGroup="valReview" Display="None" runat="server"></asp:RequiredFieldValidator>
                            <ajaxToolkit:MaskedEditExtender ID="maskDate" runat="server" MaskType="Date" TargetControlID="txtStartDate"
                                Mask="99/99/9999" UserDateFormat="MonthDayYear">
                            </ajaxToolkit:MaskedEditExtender>
                        </div>
                    </div>
                    <div style="float: left; padding-left: 6px;">
                        <asp:ImageButton ID="imgBtnCal1" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                    </div>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" FirstDayOfWeek="Sunday"
                        PopupButtonID="imgBtnCal1" TargetControlID="txtStartDate">
                    </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td style="width: 12%;">
                    End Date:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 85%;" colspan="4">
                    <div style="float: left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtEndDate" CssClass="txtbox" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ErrorMessage="Please Enter End Date"
                                ControlToValidate="txtEndDate" ValidationGroup="valReview" Display="None" runat="server"></asp:RequiredFieldValidator>
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Date" TargetControlID="txtEndDate"
                                Mask="99/99/9999" UserDateFormat="MonthDayYear">
                            </ajaxToolkit:MaskedEditExtender>
                        </div>
                    </div>
                    <div style="float: left; padding-left: 6px;">
                        <asp:ImageButton ID="imgBtnCal2" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                    </div>
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" FirstDayOfWeek="Sunday"
                        PopupButtonID="imgBtnCal2" TargetControlID="txtEndDate">
                    </ajaxToolkit:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    Status:
                </td>
                <td>
                </td>
                <td colspan="4">
                    <asp:DropDownList ID="ddlStatus" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSavePeriod" runat="server" OnClick="btnSavePeriod_Click" Text="Save"
                        CssClass="btnStyle" ValidationGroup="valReview" />&nbsp;
                    <asp:Button ID="btnResetPeriod" runat="server" Text="Reset" OnClick="btnResetPeriod_Click" CssClass="btnStyle" />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valReview" />
                    <br />
                    <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                    <br />
                    <asp:GridView ID="gvReviewPeriod" runat="server" CssClass="gridViewStyle" Width="98%"
                        RowStyle-CssClass="rowStyle" AlternatingRowStyle-CssClass="alternateRow" HeaderStyle-CssClass="gvHeader"
                        AutoGenerateColumns="false" OnRowDataBound="gvReviewPeriod_RowDataBound"
                        OnSelectedIndexChanging="gvReviewPeriod_SelectedIndexChanging"
                        OnRowDeleting="gvReviewPeriod_RowDeleting" >
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblReviewPerID" runat="server" Visible="false" Text='<%#Eval("PK_ReviewPeriodID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Period Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPeriodName" runat="server" Text='<%#Eval("Period_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Start Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDate" runat="server" Text='<%#Eval("Start_Date","{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    End Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server" Text='<%#Eval("End_Date","{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    <asp:Label ID="lblStatus1" runat="server" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
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
    <asp:HiddenField ID="hdnReviewPeriodID" runat="server" />
</asp:Content>
