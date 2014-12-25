<%@ Page Title="Vendor Invoices" Language="C#" MasterPageFile="~/Vendor.master" AutoEventWireup="true" CodeFile="VendorInvoices.aspx.cs" Inherits="VendorInvoices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Vendor Invoices:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            <tr>
                <td colspan="3">
                    <div style="float: right;">
                        All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                </td>
            </tr>
            <tr class="trBg">
                    <td colspan="3">
                        <div style="float: left;">
                            Invoices:</div>
                    </td>
                </tr>
            <tr class="trBorder">
                <td style="width: 12%;">
                    Invoice Amount:<asp:RequiredFieldValidator ID="rfvOrgRoleName" SetFocusOnError="true"
                        ErrorMessage="Please Enter Invoice Amount" ControlToValidate="txtInvAmnt"
                        ValidationGroup="valVendInv" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 86%;">
                
                
                <div style="float:left;">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtInvAmnt" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                    </div>
                    <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" TargetControlID="txtInvAmnt"
            Mask="NNNNNNNNN" MaskType="None" MessageValidatorTip="true" OnFocusCssClass="MaskedEditFocus"
            OnInvalidCssClass="MaskedEditError" DisplayMoney="none" AcceptNegative="Left"
            ClearMaskOnLostFocus="true" Filtered="." />
                </td>
                <%--<td colspan="3"></td>--%>
              
            </tr>
            <tr>
                <td>
                    Consultant Name:<asp:RequiredFieldValidator ID="rfvOrgRoleDesc" ControlToValidate="txtConsultName"
                        SetFocusOnError="true" ErrorMessage="Please Enter Consultant Name"
                        ValidationGroup="valVendInv" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtConsultName" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
                
                
            </tr>
            <tr>
                    <td>
                       Start Date:
                    </td>
                    <td>
                      <span style="color: Red">*</span>  
                    </td>
                    <td >
                    <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtStartDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnEndDt" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnEndDt" TargetControlID="txtStartDate">
                                    </ajaxToolkit:CalendarExtender>
                         <ajaxToolkit:MaskedEditExtender ID="maskStartDate" runat="server" MaskType="Date"
                                    TargetControlID="txtStartDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtStartDate"
                                ErrorMessage="Please Enter Start Date" SetFocusOnError="True" Display="None" ValidationGroup="valVendInv"
                                runat="server"></asp:RequiredFieldValidator>
                        
                    </td>
                    </tr><tr>
                    <td>
                        End Date:
                    </td>
                    <td>
                     <span style="color: Red">*</span>   
                    </td>
                    <td >
                    <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtEndDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnEndDt1" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnEndDt1" TargetControlID="txtEndDate">
                                    </ajaxToolkit:CalendarExtender>
                       <ajaxToolkit:MaskedEditExtender ID="maskEndDate" runat="server" MaskType="Date"
                                    TargetControlID="txtEndDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender> 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEndDate"
                                ErrorMessage="Please Enter End Date" SetFocusOnError="True" Display="None" ValidationGroup="valVendInv"
                                runat="server"></asp:RequiredFieldValidator>
                    </td>
                   
                </tr>
                <tr>
            <td>Upload Invoice:</td>
            <td></td>
            <td >
                <asp:UpdatePanel ID="upPnlUpload" runat="server">
                    <Triggers>                        
                        <asp:PostBackTrigger ControlID="btnSave" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td></tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valVendInv"
                        OnClick="btnSave_Click" />&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnReset_Click"  />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valVendInv" />
                        <br />
                        <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td colspan="3">
                    <asp:GridView ID="gvVendInvoice" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                         AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" 
                        OnSelectedIndexChanging="gvVendInvoice_SelectedIndexChanging" onrowdatabound="gvVendInvoice_RowDataBound"
                        > 
                        
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblInvID" runat="server" Visible="false" Text='<%#Eval("InvoiceID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Invoice Amount</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblInvAmnt" runat="server"  Text='<%#Eval("Invoice_Amnt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Consultant Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblConsultName" runat="server"  Text='<%#Eval("Consult_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Start Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDate" runat="server"  Text='<%#Eval("Start_Date","{0:MM/dd/yyyy}") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                    End Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server"  Text='<%#Eval("End_Date","{0:MM/dd/yyyy}") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Invoice Path</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblInvPath" runat="server"  Text='<%#Eval("Invoice_Path") %>'></asp:Label>   
                                    <asp:HyperLink runat="server" ID="lnkPath" Text="Download" CssClass="main1" NavigateUrl='<%#Eval("Invoice_Path") %>' Target="_blank">
                                                </asp:HyperLink>                                     
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" CssClass="main1" runat="server" Text="Edit" CommandName="Select"></asp:LinkButton>&nbsp;&nbsp;
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            
        </table>
    </fieldset>
   <asp:HiddenField ID="hdnInvID" runat="server" />
    <asp:HiddenField ID="hdnAttach" runat="server" />
</asp:Content>