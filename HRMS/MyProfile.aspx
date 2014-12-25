<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
 <fieldset>
        <legend class="MainLegendStyle">My Profile:</legend>
        
        <div style="margin-top: 20px;">
            
            <div id="divEmployee" runat="server" >
                <table border="0" class="tblStyle FormStyle" cellpadding="3" width="100%" cellspacing="3">
                    <tr>
                        <td colspan="7">
                            <div style="float: right;">
                                All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                        </td>
                    </tr>
                    <tr class="trBg">
                        <td colspan="6">
                            <div style="float: left;">
                                Personal Info:</div>
                        </td>
                    </tr>
                    <tr class="trBorder" style="display:none;">
                        <td style="width: 200px;">
                            IBSID
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtIBSID" CssClass="txtbox" ReadOnly="true" runat="server"></asp:TextBox>
                            </div>
                           
                        </td>
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr style="display:none;">
                        <td>
                            Prefix
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPrefix" runat="server" CssClass="ddl">
                                <asp:ListItem Value="0" Selected="True">Select</asp:ListItem>
                                <asp:ListItem Value="1">Mr</asp:ListItem>
                                <asp:ListItem Value="2">Mrs</asp:ListItem>
                                <asp:ListItem Value="3">Miss</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlPrefix"
                                ErrorMessage="Please Enter Prefix" InitialValue="0" SetFocusOnError="True" Display="None"
                                ValidationGroup="vgEmployee" runat="server"></asp:RequiredFieldValidator>
                        </td>
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            First Name
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtFName" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtFName"
                                ErrorMessage="Please Enter First Name" SetFocusOnError="True" Display="None"
                                ValidationGroup="vgEmployee" runat="server"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Middle Name
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtMName" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last Name
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtLName" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtLName"
                                ErrorMessage="Please Enter Last Name" SetFocusOnError="True" Display="None" ValidationGroup="vgEmployee"
                                runat="server"></asp:RequiredFieldValidator>
                        </td>
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            E-Mail ID
                        </td>
                        <td>
                          <span style="color: Red">*</span>   
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtEMail" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEMail"
                                ErrorMessage="Please Enter Email ID" SetFocusOnError="True" Display="None" ValidationGroup="vgEmployee"
                                runat="server"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Alternate E-Mail ID
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtAltEmail" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Cellphone Number
                        </td>
                        <td>
                            
                        </td>
                        <td colspan="3">
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtCellphone" CssClass="txtbox" runat="server"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="maskCellNumber" Mask="999-999-9999" MaskType="None"
                                    TargetControlID="txtCellphone" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                            </div>
                           
                        </td>
                        <td style="display:none;">
                            Status:
                        </td>
                        <td>
                        </td>
                        <td style="display:none;">
                            <asp:DropDownList ID="ddlStatus" CssClass="ddl" runat="server">
                                <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                                <asp:ListItem Value="0" Text="Not Active"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                       
                    </tr>
                   
                    <%-- <tr>
                            <td>
                                Fax
                            </td>
                            <td>
                            </td>
                            <td>
                                <div class="Outerdiv">
                                    <asp:TextBox ID="txtFax" CssClass="txtbox" runat="server"></asp:TextBox>
                                </div>
                            </td>
                        </tr>--%>
                    
                    <%--<tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="vgEmployee"
                            CssClass="btnStyle" OnClick="btnSave_Click" />&nbsp;
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnReset_Click" />
                        <asp:ValidationSummary ID="valEmployee" runat="server" ShowMessageBox="True" ShowSummary="False"
                            ValidationGroup="vgEmployee" />
                    </td>
                </tr>--%>
                    <tr class="trBg">
                        <td colspan="6">
                            <div style="float: left;">
                                Business Contact Info:</div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;">
                            Address1
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                            
                        </td>
                        <td style="width: 140px;">
                            Address2
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtAddress2" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtCity" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                          
                        </td>
                        <td>
                            State
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="true" CssClass="ddl">
                            </asp:DropDownList>
                           
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ZipCode
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtZip" runat="server" CssClass="txtbox"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" Mask="99999-9999" MaskType="None"
                                    TargetControlID="txtZip" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                            </div>
                           
                        </td>
                        <td>
                            Business Phone
                        </td>
                        <td>
                        </td>
                        <td>
                        <div style="float:left;">
                            <div class="Outerdiv" >
                                <asp:TextBox ID="txtBusPhone" CssClass="txtbox" runat="server"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="maskBuisPhone" runat="server" Mask="999-999-9999"
                                    MaskType="None" TargetControlID="txtBusPhone">
                                </ajaxToolkit:MaskedEditExtender>
                            </div>
                            </div>
                            
                            <div style="float:left;padding-left:10px;">
                             Ext &nbsp <asp:TextBox ID="txtExt" runat="server" MaxLength="5"  style="width:40px;"></asp:TextBox>
                             </div>
                        </td>
                    </tr>
                    <%--<tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="btnSaveBuss" runat="server" OnClick="btnSave_Click" Text="Save" ValidationGroup="vgEmployeeBus"
                                        CssClass="btnStyle" />&nbsp;
                                    <asp:Button ID="btnResetBuss" OnClick="btnResetBuss_Click" runat="server" Text="Reset"
                                        CssClass="btnStyle" />--%>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
                        ShowSummary="false" ValidationGroup="vgEmployeeBus" />
                    <%--</td>
                            </tr>--%>
                    <tr class="trBg">
                        <td colspan="6">
                            <div style="float: left;">
                                Personal Contact Info:</div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;">
                            Address1
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtPAddrss1" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                            
                        </td>
                        <td style="width: 140px;">
                            Address2
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtpAddress2" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            City
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtpCity" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                           
                        </td>
                        <td>
                            State
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPState" runat="server" AppendDataBoundItems="true" CssClass="ddl">
                            </asp:DropDownList>
                        
                        </td>
                    </tr>
                    <tr>
                        <td>
                            ZipCode
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtPZip" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" Mask="99999-9999" MaskType="None"
                                    TargetControlID="txtPZip" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                         
                        </td>
                         <td>
                            Home Phone
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtHomePhone" CssClass="txtbox" runat="server"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="maskHomePhone" Mask="999-999-9999" MaskType="None"
                                    TargetControlID="txtHomePhone" runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                            </div>
                        </td>
                    </tr>
                    <%--<tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="btnSavePer" runat="server" OnClick="btnSave_Click" Text="Save" ValidationGroup="vgEmployeePer"
                                        CssClass="btnStyle" />&nbsp;
                                    <asp:Button ID="btnResetPer" OnClick="btnResetPer_Click" runat="server" Text="Reset"
                                        CssClass="btnStyle" />--%>
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="true"
                        ShowSummary="false" ValidationGroup="vgEmployeePer" />
                    <%-- </td>
                            </tr>--%>
                    <tr class="trBg">
                        <td colspan="6">
                            <div style="float: left;">
                                Professional Info:</div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;">
                            Job Title
                        </td>
                        <td>
                        
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtJobTitle" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                         
                        </td>
                        <td>
                            Login Password
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="txtbox"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="txtPassword"
                                ErrorMessage="Please Enter Password" SetFocusOnError="true" Display="None" ValidationGroup="vgEmployee"
                                runat="server"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="7" align="center">
                            <%--<asp:Button ID="btnSaveProff" runat="server" OnClick="btnSave_Click" Text="Save"
                            ValidationGroup="vgEmployeeProff" CssClass="btnStyle" />&nbsp;
                        <asp:Button ID="btnResetProff" OnClick="btnResetProff_Click" runat="server" Text="Reset"
                            CssClass="btnStyle" />--%>
                            <%--<asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="true"
                            ShowSummary="false" ValidationGroup="vgEmployeeProff" />--%>
                            <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="vgEmployee"
                                CssClass="btnStyle" OnClick="btnSave_Click" />&nbsp;
                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnReset_Click" />
                            <asp:ValidationSummary ID="valEmployee" runat="server" ShowMessageBox="True" ShowSummary="False"
                                ValidationGroup="vgEmployee" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div align="center">
            <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label></div>
    </fieldset>
    <asp:HiddenField ID="hdnEmpID" runat="server" />
    <asp:HiddenField ID="hdnOrgRoleID" runat="server" />
    <asp:HiddenField ID="hdnHiredDate" runat="server" />
    <asp:HiddenField ID="hdnEmailID" runat="server" />
    <asp:HiddenField ID="hdnAltEmailID" runat="server" />
    <asp:HiddenField ID="hdnCellphoneNo" runat="server" />
    
    <asp:HiddenField ID="hdnAddr1" runat="server" />
    <asp:HiddenField ID="hdnAddr2" runat="server" />
    <asp:HiddenField ID="hdnCity" runat="server" />
    <asp:HiddenField ID="hdnState" runat="server" />
    <asp:HiddenField ID="hdnZip" runat="server" />
    <asp:HiddenField ID="hdnBusPhone" runat="server" />
    
    <asp:HiddenField ID="hdnPAddr1" runat="server" />
    <asp:HiddenField ID="hdnPAddr2" runat="server" />
    <asp:HiddenField ID="hdnPCity" runat="server" />
    <asp:HiddenField ID="hdnPState" runat="server" />
    <asp:HiddenField ID="hdnPZip" runat="server" />
    <asp:HiddenField ID="hdnPHomePhone" runat="server" />
    
</asp:Content>

