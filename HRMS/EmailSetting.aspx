<%@ Page Title="Emails Setting" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="EmailSetting.aspx.cs" Inherits="EmailSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Set Emails:</legend>
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
                            Set From Email:</div>
                    </td>
                </tr>
            <tr class="trBorder">
                <td style="width: 10%;">
                    Email ID:<asp:RequiredFieldValidator ID="rfvOrgEmailID" SetFocusOnError="true"
                        ErrorMessage="Please Enter From Email ID" ControlToValidate="txtFrmEmailID"
                        ValidationGroup="valFrmEmail" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 88%;">
                    <div class="Outerdiv1">
                        <asp:TextBox ID="txtFrmEmailID" CssClass="txtbox1" runat="server"></asp:TextBox>
                    </div>
                </td>
                
              
            </tr>
            
            <tr>
                <td>
                    Password:<asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword"
                        SetFocusOnError="true" ErrorMessage="Please Enter Password"
                        ValidationGroup="valFrmEmail" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td>
                    <div class="Outerdiv1">
                        <asp:TextBox ID="txtPassword" CssClass="txtbox1" TextMode="Password" runat="server"></asp:TextBox>
                    </div>
                </td>
                <%--<td colspan="3"></td>--%>
                
            </tr>
            
             <tr class="trBorder">
                <td style="width: 10%;">
                    SMTP Host:<asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true"
                        ErrorMessage="Please Enter SMTP Host" ControlToValidate="txtSmtpHost"
                        ValidationGroup="valFrmEmail" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 88%;">
                    <div class="Outerdiv1">
                        <asp:TextBox ID="txtSmtpHost" CssClass="txtbox1" runat="server"></asp:TextBox>
                    </div>
                </td>
                
              
            </tr>
             <tr class="trBorder">
                <td style="width: 10%;">
                    SMTP Port:<asp:RequiredFieldValidator ID="RequiredFieldValidator3" SetFocusOnError="true"
                        ErrorMessage="Please Enter SMTP Port" ControlToValidate="txtSmtpPort"
                        ValidationGroup="valFrmEmail" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 88%;">
                    <div class="Outerdiv1">
                        <asp:TextBox ID="txtSmtpPort" CssClass="txtbox1" runat="server"></asp:TextBox>
                    </div>
                </td>
                
              
            </tr>
            
            <tr>
                <td colspan="3" align="left">
                    <asp:Button ID="btnSaveEmails" runat="server" Text="Save" CssClass="btnStyle" 
                        ValidationGroup="valFrmEmail" onclick="btnSaveEmails_Click"
                         />&nbsp;
                    <asp:Button ID="btnResetEmails" runat="server" Text="Reset" CssClass="btnStyle" 
                        onclick="btnResetEmails_Click"  />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valFrmEmail" />
                </td>
            </tr>
            <tr><td style="padding-top:10px;border:none;"></td></tr>
             <tr class="trBg">
                    <td colspan="6" >
                        <div style="float: left;">
                            Set To Emails(Alerts will be received on these Email Ids,enter comma separated):</div>
                    </td>
                </tr>
            <tr class="trBorder">
                <td  valign="top">
                    Email ID:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true"
                        ErrorMessage="Please Enter Email IDs to receive alerts" ControlToValidate="txtMultipleEmails"
                        ValidationGroup="valToEmail" Display="None" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td valign="top">
                    <span style="color: Red">*</span>
                </td>
                <td>
                    
                        <asp:TextBox ID="txtMultipleEmails" style="width:300px;height:80px;" CssClass="txtMultiline" TextMode="MultiLine" runat="server"></asp:TextBox>
                    
                </td>
                
              
            </tr>
            
            
            <tr>
                <td colspan="3" align="left">
                    <asp:Button ID="btnToEmail" runat="server" Text="Save" CssClass="btnStyle" 
                        ValidationGroup="valToEmail" onclick="btnToEmail_Click"
                         />&nbsp;
                    <asp:Button ID="btnResetToEmail" runat="server" Text="Reset" CssClass="btnStyle" 
                        onclick="btnResetToEmail_Click"  />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valToEmail" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            
        </table>
    </fieldset>
    <asp:HiddenField ID="hdnID" runat="server" />
</asp:Content>