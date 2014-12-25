<%@ Page Title="Organization" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Organization.aspx.cs" Inherits="Organization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">Organization:</legend>
        <table border="0" cellpadding="3" class="tblStyle FormStyle" width="100%" cellspacing="3">
            <tr>
                <td colspan="3">
                    <div style="float: right;">
                        All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                </td>
            </tr>
            <tr class="trBg">
            <td colspan="6">
            <div style="float:left;">
                            Organization Info:</div>
            </td>
            </tr>
            <tr class="trBorder">
                <td style="width: 200px;">
                    Organization Name:<asp:RequiredFieldValidator ID="rfvOrgName" ControlToValidate="txtOrgName"
                        ErrorMessage="Please Enter Organization Name" SetFocusOnError="true" Display="None"
                        ValidationGroup="valOrganization" runat="server"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td>
                    <div class="Outerdiv1">
                        <asp:TextBox ID="txtOrgName" CssClass="txtbox1" runat="server"></asp:TextBox>
                    </div>
                </td>
               
            </tr>
            <tr>
                <td>
                    Address1:<%--<asp:RequiredFieldValidator ID="rfvOrgAdrs1" ControlToValidate="txtAdrs1"
                        ErrorMessage="Please Enter Address1" SetFocusOnError="true" Display="None" ValidationGroup="valOrganization"
                        runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                    
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtAdrs1" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    Address2:
                </td>
                <td>
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtAdrs2" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    City:<%--<asp:RequiredFieldValidator ID="rfvOrgCity" ControlToValidate="txtCity" ErrorMessage="Please Enter City"
                        SetFocusOnError="true" Display="None" ValidationGroup="valOrganization" runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                   
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtCity" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    State:<%--<asp:RequiredFieldValidator ID="rfvOrgState" ControlToValidate="ddlState" ErrorMessage="Please Select State"
                        InitialValue="Select" SetFocusOnError="true" Display="None" ValidationGroup="valOrganization"
                        runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                    
                </td>
                <td>
                    <asp:DropDownList ID="ddlState" CssClass="ddl" AppendDataBoundItems="true" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Postal Code:<%--<asp:RequiredFieldValidator ID="rfvOrgPoCode" ControlToValidate="txtPostCode"
                        ErrorMessage="Please Enter PosatlCode" SetFocusOnError="true" Display="None"
                        ValidationGroup="valOrganization" runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                    
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtPostCode" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    Phone Number:<%--<asp:RequiredFieldValidator ID="rfvOrgPhNum" ControlToValidate="txtPhNum"
                        ErrorMessage="Please Enter Phone Number" SetFocusOnError="true" Display="None"
                        ValidationGroup="valOrganization" runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                   
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtPhNum" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    Email id:<%--<asp:RequiredFieldValidator ID="rfvOrgMailId" ControlToValidate="txtMailid"
                        ErrorMessage="Please Enter Emailid" SetFocusOnError="true" Display="None" ValidationGroup="valOrganization"
                        runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                   
                </td>
                <td>
                    <div class="Outerdiv1">
                        <asp:TextBox ID="txtMailid" CssClass="txtbox1" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;
                    </div>
                    <asp:RegularExpressionValidator ID="regOrgMailId" Display="None" ControlToValidate="txtMailid"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="valOrganization"
                        ErrorMessage="Invalid Emailid" runat="server"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Fax Number:<%--<asp:RequiredFieldValidator ID="rfvOrgFaxNum" ControlToValidate="txtFaxNum"
                        ErrorMessage="Please Enter Fax Number" SetFocusOnError="true" Display="None"
                        ValidationGroup="valOrganization" runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                   
                </td>
                <td>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtFaxNum" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    Website URL:<%--<asp:RequiredFieldValidator ID="rfvOrgWebUrl" ControlToValidate="txtWebUrl"
                        ErrorMessage="Please Enetr WebSite URL" SetFocusOnError="true" Display="None"
                        ValidationGroup="valOrganization" runat="server"></asp:RequiredFieldValidator>--%>
                </td>
                <td>
                    
                </td>
                <td>
                    <div class="Outerdiv1">
                        <asp:TextBox ID="txtWebUrl" CssClass="txtbox1" runat="server"></asp:TextBox>
                    </div>
                </td>
               
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="btnSaveOrg" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valOrganization"
                        OnClick="btnSaveOrg_Click" />&nbsp;
                    <asp:Button ID="btnResetOrg" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnResetOrg_Click" />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="true"
                        ShowSummary="false" ValidationGroup="valOrganization" />
                </td>
            </tr>
            
        </table>
        <div align="center">
                    <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                </div>
    </fieldset>
    <asp:HiddenField ID="hdnOrgID" runat="server" />
</asp:Content>