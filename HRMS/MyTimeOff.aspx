<%@ Page Title="My TimeOff" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MyTimeOff.aspx.cs" Inherits="MyTimeOff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Submit Time Off:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            <tr>
                <td colspan="6">
                    <div style="float: right;">
                        All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                </td>
            </tr>
            <tr class="trBg">
            <td colspan="6">
            <div style="float:left;">
                      Time Off:</div>
            </td>
            </tr>
             <tr>
                <td style="width: 10%;">
                    Time Off Type:
                </td>
                <td >
                    
                </td>
                <td  style="width: 88%;">                    
                        <asp:DropDownList ID="ddlTimeOffType" runat="server" AppendDataBoundItems="true" CssClass="ddl">
                            </asp:DropDownList>
                    
                   
                </td>
                <td colspan="3"></td>
             
            </tr>
               <tr>
                    <td>
                       Start Date:
                    </td>
                    <td>
                      <span style="color: Red">*</span>  
                    </td>
                    <td colspan="4">
                    <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtStartDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnCal" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnCal" TargetControlID="txtStartDate">
                                    </ajaxToolkit:CalendarExtender>
                         <ajaxToolkit:MaskedEditExtender ID="maskStartDate" runat="server" MaskType="Date"
                                    TargetControlID="txtStartDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtStartDate"
                                ErrorMessage="Please Enter Start Date" SetFocusOnError="True" Display="None" ValidationGroup="valEmpTimeOff"
                                runat="server"></asp:RequiredFieldValidator>
                               
                        
                    </td>
                    </tr><tr>
                    <td>
                        End Date:
                    </td>
                    <td>
                     <span style="color: Red">*</span>   
                    </td>
                    <td colspan="4">
                     <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtEndDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnCal1" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnCal1" TargetControlID="txtEndDate">
                                    </ajaxToolkit:CalendarExtender>
                       <ajaxToolkit:MaskedEditExtender ID="maskEndDate" runat="server" MaskType="Date"
                                    TargetControlID="txtEndDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender> 
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEndDate"
                                ErrorMessage="Please Enter End Date" SetFocusOnError="True" Display="None" ValidationGroup="valEmpTimeOff"
                                runat="server"></asp:RequiredFieldValidator>
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        Reason:
                    </td>
                    <td>
                        
                    </td>
                    <td colspan="4">                        
                            <asp:TextBox ID="txtComments" CssClass="txtMultiline" TextMode="MultiLine" style="width:350px;height:70px;"  runat="server"></asp:TextBox>                        
                       
                    </td>
                   
                </tr>
            <tr>
            <td>Attach Document:</td>
            <td></td>
            <td colspan="4">
                <asp:UpdatePanel ID="upPnlUpload" runat="server">
                    <Triggers>                        
                        <asp:PostBackTrigger ControlID="btnSave" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td></tr>
            <tr style="display:none;" >
                <td>
                   Approval Status:
                </td>
                <td>
                </td>
                <td>
                <asp:Label ID="lblAppStatus" runat="server" Text="Pending"></asp:Label>
                   
                </td>
                <td colspan="3"></td>
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnStyle" ValidationGroup="valEmpTimeOff"
                        OnClick="btnSave_Click" />&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle"
                        OnClick="btnReset_Click" />
                    <asp:ValidationSummary ID="vsEmpTImeOff" ShowMessageBox="true" ShowSummary="false"
                        ValidationGroup="valEmpTimeOff" runat="server" />
                </td>
               
            </tr>
            
            <tr >
                <td colspan="6">
                    <asp:GridView ID="gvTimeOff" runat="server" CssClass="gridViewStyle" 
                        Width="98%" RowStyle-CssClass="rowStyle" 
                         AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" OnSelectedIndexChanging="gvTimeOff_SelectedIndexChanging"
                        onrowdeleting="gvTimeOff_RowDeleting" 
                        onrowdatabound="gvTimeOff_RowDataBound" >
                        <Columns>
                        
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblEmpTimeOffID" runat="server" Visible="False" Text='<%#Eval("PK_EmpTimeOffID") %>'></asp:Label>
                                    <asp:Label ID="lblTimeOffTypeID" runat="server" Visible="False" Text='<%#Eval("FK_TimeOffTypeID") %>'></asp:Label>
                                    <asp:Label ID="lblFilePath" runat="server" Visible="False" Text='<%#Eval("FilePath") %>'></asp:Label>
                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Start Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDate" runat="server" Text='<%#Eval("StartDate","{0:MM/dd/yyyy}") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   End Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server" Text='<%#Eval("EndDate","{0:MM/dd/yyyy}") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   Reason</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblComments" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   File Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("FileName") %>'></asp:Label>                                     
                                    <asp:HyperLink runat="server" ID="tofflink" Text="Download" CssClass="main1" NavigateUrl='<%#Eval("FilePath") %>' Target="_blank">
                                                </asp:HyperLink>                                  
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Approval Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Approved_Status") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    Created By</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedBy" runat="server" Text='<%#Eval("Rec_CreatedBy") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <HeaderTemplate>
                                    Created Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedDate" runat="server" Text='<%#Eval("Rec_CreatedDate","{0:MM/dd/yyyy}") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    Modified By</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblModifiedBy" runat="server" Text='<%#Eval("Rec_ModifiedBy") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    Modified Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblModDate" runat="server" Text='<%#Eval("Rec_ModifiedDate","{0:MM/dd/yyyy}") %>'></asp:Label></ItemTemplate>
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
                    <br />
                     <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>    
    <asp:HiddenField ID="hdnEmpTimeOffID" runat="server" />
    <asp:HiddenField ID="hdnAttach" runat="server" />
    <asp:HiddenField ID="hdnAttachName" runat="server" />
</asp:Content>