<%@ Page Title="Customer" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Customer.aspx.cs" Inherits="Customer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">Customer:</legend>
        <div style="float: right;">
            <asp:LinkButton ID="lnkBtnNewCust" CssClass="main" CommandArgument="Add" OnClick="lnkBtnNewCust_Click"
                Text="Add New Customer Details" runat="server"></asp:LinkButton></div>
        <div style="margin-top: 20px;">
            <asp:GridView ID="gvCustomerDetails" runat="server" Width="98%" CssClass="gridViewStyle"
                RowStyle-CssClass="rowStyle" EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                OnRowDataBound="gvCustomerDetails_RowDataBound" HeaderStyle-CssClass="gvHeader"
                AutoGenerateColumns="false" OnSelectedIndexChanging="gvCustomerDetails_SelectedIndexChanging"
                OnRowDeleting="gvCustomerDetails_RowDeleting">
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
                            Customer Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCustName" runat="server" Text='<%#Eval("Cust_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            WebSite URL</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblWebUrl" runat="server" Text='<%#Eval("Cust_WebSiteURL") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Phone Number</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNo" runat="server" Text='<%#Eval("Cust_Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Fax Number</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFaxNo" runat="server" Text='<%#Eval("Cust_fax") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Contact Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContName" runat="server" Text='<%#Eval("Cust_Contact_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Contact EmailId</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContMailId" runat="server" Text='<%#Eval("Cust_Contact_EmailAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Contact Phone Number</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblContctPhNum" runat="server" Text='<%#Eval("Cust_Contact_Phone") %>'></asp:Label>
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
            <div id="divCustomer" runat="server" visible="false">
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
                            Customer Name:
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtCustName" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvCustName" ControlToValidate="txtCustName" ErrorMessage="Please Enter Customer Name"
                                SetFocusOnError="True" Display="None" ValidationGroup="vgCustomer" runat="server"></asp:RequiredFieldValidator>
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
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" Mask="999-999-9999" MaskType="None"
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
                                <asp:TextBox ID="txtContEmailid" CssClass="txtbox" runat="server"></asp:TextBox>
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
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr class="trBg">
                        <td colspan="6">
                            <div style="float: left;">
                                Shipment Address:</div>
                        </td>
                    </tr>
                    
                    <tr>
                        <td style="width: 200px;">
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
                           
                                <asp:DropDownList ID="ddlShipState" CssClass="ddl" runat="server" AppendDataBoundItems="true">
                                </asp:DropDownList>
                           
                           
                        </td>
                       
                    </tr>
                    <tr>
                        <td>
                            Ship To Postal Code:
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
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr class="trBg">
                        <td colspan="6">
                            <div style="float: left;">
                                Billing Address:</div>
                        </td>
                    </tr>
                     <tr><td colspan="6">Same As Shipping Address&nbsp;&nbsp;&nbsp;<asp:CheckBox 
                        ID="chkSameShipping" runat="server"  AutoPostBack="true" 
                        oncheckedchanged="chkSameShipping_CheckedChanged" /></td></tr>
                    <tr>
                        <td style="width: 200px;">
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
                            Bill To Postal Code:
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
                        <td colspan="3">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="vgCustomer"
                                OnClick="btnSave_Click" />&nbsp;
                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnReset_Click" />
                            <asp:ValidationSummary ID="valCustomer" runat="server" ShowMessageBox="True" ShowSummary="False"
                                ValidationGroup="vgCustomer" />
                        </td>
                        
                    </tr>
                   
                </table>
            </div>
        </div>
        <div align="center">
            <asp:Label ID="lblMsg" runat="server" Visible="False" CssClass="lblMsgStyle"></asp:Label></div>
    </fieldset>
    <asp:HiddenField ID="hdnCustID" runat="server" />
</asp:Content>
