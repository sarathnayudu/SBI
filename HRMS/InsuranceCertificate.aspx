<%@ Page Title="Insurance Certificate" Language="C#" MasterPageFile="~/Vendor.master" AutoEventWireup="true" CodeFile="InsuranceCertificate.aspx.cs" Inherits="InsuranceCertificate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Insurance Certificate:</legend>
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
                            Insurance Certificate:</div>
                    </td>
                </tr>
           
            <tr>
                    <td style="width: 12%;">
                      Effective End Date:
                    </td>
                    <td>
                      <span style="color: Red">*</span>  
                    </td>
                    <td style="width: 86%;">
                     <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtEffectEndDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnEndDt" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnEndDt" TargetControlID="txtEffectEndDate">
                                    </ajaxToolkit:CalendarExtender>
                         <ajaxToolkit:MaskedEditExtender ID="maskStartDate" runat="server" MaskType="Date"
                                    TargetControlID="txtEffectEndDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtEffectEndDate"
                                ErrorMessage="Please Enter Date" SetFocusOnError="True" Display="None" ValidationGroup="valInsCert"
                                runat="server"></asp:RequiredFieldValidator>
                        
                    </td>
                    </tr>
                    
                <tr>
            <td>Upload Certificate:</td>
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valInsCert"
                    OnClick="btnSave_Click"    />&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnReset_Click"  />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valInsCert" />
                        <br />
                        <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            
           <tr>
                <td colspan="3">
                    <asp:GridView ID="gvInsCert" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                        AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" 
                        OnSelectedIndexChanging="gvInsCert_SelectedIndexChanging"  onrowdatabound="gvInsCert_RowDataBound"
                        > 
                        
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblInsID" runat="server" Visible="false" Text='<%#Eval("InsID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Effective End Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server"  Text='<%#Eval("Effect_End_Date","{0:MM/dd/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField>
                                <HeaderTemplate>
                                   Insurance Certificate</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCertifpath" runat="server" Text='<%#Eval("Certif_path") %>'></asp:Label>                                     
                                    <asp:HyperLink runat="server" ID="lnkPath" Text="Download" CssClass="main1" NavigateUrl='<%#Eval("Certif_path") %>' Target="_blank">
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
    <asp:HiddenField ID="hdnInsID" runat="server" />
    <asp:HiddenField ID="hdnAttach" runat="server" />
</asp:Content>