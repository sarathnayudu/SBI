<%@ Page Title="Vendor" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" 
    CodeFile="Vendor.aspx.cs" Inherits="Vendor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">

    <fieldset>
        <legend class="MainLegendStyle">Vendor:</legend>
        <div style="float: right;">
            <asp:LinkButton ID="lnkBtnNewVend" CssClass="main" CommandArgument="Add" OnClick="lnkBtnNewVend_Click"
                Text="Add New Vendor Details" runat="server"></asp:LinkButton></div>
        <div style="margin-top: 20px;">
            <asp:GridView ID="gvVendorDetails" runat="server" Width="98%" CssClass="gridViewStyle" RowStyle-CssClass="rowStyle"
                 AlternatingRowStyle-CssClass="alternateRow"
                HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" OnSelectedIndexChanging="gvVendorDetails_SelectedIndexChanging"
                OnRowDeleting="gvVendorDetails_RowDeleting" OnRowDataBound="gvVendorDetails_RowDataBound">

                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            S.NO</HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                            <asp:Label ID="lblSno" runat="server" Visible="false" Text='<%#Eval("PKCustID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Vendor Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblVendorName" runat="server" Text='<%#Eval("Vendor_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            WebSite URL</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblWebUrl" runat="server" Text='<%#Eval("Vendor_WebSiteURL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Phone Number</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNo" runat="server" Text='<%#Eval("Vendor_Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Fax Number</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFaxNo" runat="server" Text='<%#Eval("Vendor_fax") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Contact Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContName" runat="server" Text='<%#Eval("Vendor_Contact_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Contact EmailId</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContMailId" runat="server" Text='<%#Eval("Vendor_Contact_EmailAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Contact Phone Number</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContctPhNum" runat="server" Text='<%#Eval("Vendor_Contact_Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Status</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("ActiveFlag") %>'></asp:Label></ItemTemplate>
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
            <div id="divVendor" runat="server" visible="false">
            
            <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
                <tr>
                    <td colspan="6">
                        <div style="float: right;">
                            All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                    </td>
                </tr>
                <tr class="trBg">
                    <td colspan="6">
                        <div style="float: left;">
                            Primary Details:</div>
                    </td>
                    
                </tr>
                <tr >
                    <td style="width: 200px;">
                        Vendor Name:
                    </td>
                    <td>
                        <span style="color: Red">*</span>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtVendName" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvVendName" ControlToValidate="txtVendName" ErrorMessage="Please Enter Vendor Name"
                            SetFocusOnError="True" Display="None" ValidationGroup="vgVendor" runat="server"></asp:RequiredFieldValidator>
                    </td>
              
                    <td>
                        WebSite URL:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtWebUrl" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        Phone Number:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtPhNum" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                          <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" Mask="999-999-9999-99999" MaskType="None"
                                    TargetControlID="txtPhNum" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                        
                    </td>
                    <td>
                        Fax Number:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtFaxNum" CssClass="txtbox" runat="server"></asp:TextBox>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender6" Mask="999-999-9999" MaskType="None"
                                    TargetControlID="txtFaxNum" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                        </div>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Contact Name:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtContName" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
                    <td>
                        Contact Email ID:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtContmailid"  CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        Contact Phone Number:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtContPhnum" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender2" Mask="999-999-9999" MaskType="None"
                                    TargetControlID="txtContPhnum" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                        
                    </td>
                    <td>
                        Alternate Contact Name:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtAltContName" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Alternate Contact Email ID:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtAltContEmail" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    <td>
                        Alternate Contact Phone Number:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtAltContPhnum" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" Mask="999-999-9999" MaskType="None"
                                    TargetControlID="txtAltContPhnum" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                    </td>
                    
                </tr>
                <tr>
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
                   <td>
                            Login Password
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtPassword" runat="server"  CssClass="txtbox"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="txtPassword"
                                ErrorMessage="Please Enter Password" SetFocusOnError="true" Display="None" ValidationGroup="vgVendor"
                                runat="server"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                
                <tr class="trBg">
                    <td colspan="6">
                        <div style="float: left;">
                            Shipment Address:</div>
                    </td>
                    
                </tr>
                <tr>
                    <td style="width: 150px;">
                        Ship To Address1:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtShipAdrs1" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
                   
                
                    <td>
                        Ship To Address2:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtShipAdrs2" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Ship To City:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtShipCity" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
               
                    <td>
                        Ship To State:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        
                            <asp:DropDownList ID="ddlShipState" CssClass="ddl" AppendDataBoundItems="true" runat="server">
                            </asp:DropDownList>
                        
                        
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Ship To PostalCode:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtShipPcode" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" Mask="99999-9999" MaskType="None"
                                    TargetControlID="txtShipPcode" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                        
                    </td>
                    <td colspan="3"></td>
                </tr>
                <tr class="trBg">
                    <td colspan="6">
                    <div style="float:left;">
                        Billing Address:</div>
                    </td>
                </tr>
                <tr><td colspan="6">Same As Shipping Address&nbsp;&nbsp;&nbsp;<asp:CheckBox 
                        ID="chkSameShipping" runat="server"  AutoPostBack="true" 
                        oncheckedchanged="chkSameShipping_CheckedChanged" /></td></tr>
                <tr>
                    <td style="width: 150px;">
                        Bill To Address1:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtBillAdrs1" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
                
                    <td>
                        Bill To Address2:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtBillAdrs2" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Bill To City:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtBillCity" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
               
                    <td>
                        Bill To State:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        
                            <asp:DropDownList ID="ddlBillState" CssClass="ddl" AppendDataBoundItems="true" runat="server">
                            </asp:DropDownList>
                      
                        
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        Bill To PostalCode:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtBillPcode" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender5" Mask="99999-9999" MaskType="None"
                                    TargetControlID="txtBillPcode" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                        
                    </td>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="6" align="center">
                        <asp:Button ID="btnSave" ValidationGroup="vgVendor" runat="server" Text="Save" CssClass="btnStyle"
                            OnClick="btnSave_Click" />&nbsp;
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnReset_Click" />
                        <asp:ValidationSummary ID="valVendor" runat="server" ShowMessageBox="True" ShowSummary="False"
                            ValidationGroup="vgVendor" />
                    </td>
                   
                </tr>
                
            </table>
            </div>
            
        </div>
        <div align="center">
            <asp:Label ID="lblMsg" runat="server" Visible="False" CssClass="lblMsgStyle"></asp:Label></div>
    </fieldset>
    <asp:HiddenField ID="hdnVendorID" runat="server" />
</asp:Content>