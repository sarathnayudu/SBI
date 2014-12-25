<%@ Page Title="Approve Time Off" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AppTimeOff.aspx.cs" Inherits="AppTimeOff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" type="text/javascript">

    function SelectAllCheckboxes(spanChk) {

        // Added as ASPX uses SPAN for checkbox
        var oItem = spanChk.children;
        var theBox = (spanChk.type == "checkbox") ?
        spanChk : spanChk.children.item[0];
        xState = theBox.checked;
        elm = theBox.form.elements;

        for (i = 0; i < elm.length; i++)
            if (elm[i].type == "checkbox" &&
              elm[i].id != theBox.id) {
            //elm[i].click();
            if (elm[i].checked != xState)
                elm[i].click();
            //elm[i].checked=xState;
        }
    }
</script>
<link href="Styles/lightbox-form.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/lightbox-form.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<div id="divFilterDecline" class="filterSmall">
    </div>
    <div id="divDecline" class="boxSmall">
        <span id="spnTitle" class="boxtitleSmall"></span>
        <table cellpadding="2" cellspacing="1" width="90%" border="0" align="center">
                    
            <tr>
                <td style="width: 110px;" valign="top">
                    Reason to decline:
                </td>
                <td>
                    </td>
                <td>
                    <asp:TextBox ID="txtDeclineReason"  runat="server" CssClass="txtMultiline" TextMode="MultiLine" style="width:260px;height:100px;">
                    </asp:TextBox>
                </td>
            </tr>
           
            
            <tr>
                <td colspan="3" align="center" style="padding-top: 20px;">
                    <asp:Button ID="btnDeclineTS" CssClass="btnStyle"  onclick="btnDecline_Click" 
                        runat="server" Text="Send"  />&nbsp;&nbsp;
                    <input type="button" class="btnStyle" name="cancel" value="Cancel" onclick="closebox('divDecline','divFilterDecline')" /></td>
            </tr>
            
        </table>
    </div>
<fieldset>
        <legend class="MainLegendStyle">Approve Time Off:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            
            <tr class="trBg">
            <td colspan="6">
            <div style="float:left;">
                     Search Time Off:</div>
            </td>
            </tr>
             <tr>
                <td style="width: 10%;">
                    Employee Name:
                </td>
                <td >
                    
                </td>
                <td style="width: 88%;">                    
                        <asp:DropDownList ID="ddlEmployee" runat="server" AppendDataBoundItems="true" CssClass="ddl">
                            </asp:DropDownList>
                    
                   
                </td>
                <td colspan="3"></td>
             
            </tr>
               <tr>
                    <td>
                       Start Date:
                    </td>
                    <td>
                       
                    </td>
                    <td colspan="4">
                     <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtStartDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnCal1" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnCal1" TargetControlID="txtStartDate">
                                    </ajaxToolkit:CalendarExtender>
                         <ajaxToolkit:MaskedEditExtender ID="maskStartDate" runat="server" MaskType="Date"
                                    TargetControlID="txtStartDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                                
                        
                    </td>
                    </tr><tr>
                    <td>
                        End Date:
                    </td>
                    <td>
                       
                    </td>
                    <td colspan="4">
                     <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtEndDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnEndDt" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnEndDt" TargetControlID="txtEndDate">
                                    </ajaxToolkit:CalendarExtender>
                       <ajaxToolkit:MaskedEditExtender ID="maskEndDate" runat="server" MaskType="Date"
                                    TargetControlID="txtEndDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender> 
                                  
                    </td>
                   
                </tr>
            
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSearch" runat="server" Text="Show Details" 
                        style="width:120px;" CssClass="btnStyle" ValidationGroup="valEmpTimeOff" onclick="btnSearch_Click"
                         />&nbsp;
                    <br />
                     <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                     <br />
                     <asp:GridView ID="gvTimeOff" runat="server" CssClass="gridViewStyle" 
                        Width="98%" RowStyle-CssClass="rowStyle" 
                        EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" 
                         AllowPaging="True" OnPageIndexChanging="gvTimeOff_PageIndexChanging" PageSize="10"
                        onrowdatabound="gvTimeOff_RowDataBound" >
                        <PagerSettings Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="<< Previous" NextPageText="Next >>" FirstPageText="First"  LastPageText="Last" />
                <PagerStyle BackColor="#084a73" Font-Bold="true" ForeColor="White" BorderColor="#041e2e" BorderWidth="2px" BorderStyle="Solid" />
                        <Columns>
                        <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    S.No</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblEmpTimeOffID" runat="server" Visible="False" Text='<%#Eval("PK_EmpTimeOffID") %>'></asp:Label>
                                    <asp:Label ID="lblTimeOffTypeID" runat="server" Visible="False" Text='<%#Eval("FK_TimeOffTypeID") %>'></asp:Label>
                                    <asp:Label ID="lblFilePath" runat="server" Visible="False" Text='<%#Eval("FilePath") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                         <asp:TemplateField>
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chkSelectAll" onclick="javascript:SelectAllCheckboxes(this);" runat="server" /> </HeaderTemplate>
                                <ItemTemplate>
                                       <asp:CheckBox ID="chkSelect" runat="server" />                                 
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Employee Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeFName" runat="server" Text='<%#Eval("Emp_Fname") %>'></asp:Label>&nbsp;
                                    <asp:Label ID="lblEmployeeLName" runat="server" Text='<%#Eval("Emp_Lname") %>'></asp:Label>    
                                     <asp:Label ID="lblEmailID" runat="server" Text='<%#Eval("Emp_EmailID") %>' Visible="false"></asp:Label>                                                                     
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
                                   File Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFileName" runat="server" Text='<%#Eval("FileName") %>'></asp:Label>                                     
                                     <asp:HyperLink runat="server" ID="tofflink" Text="View" CssClass="main1" NavigateUrl='<%#Eval("FilePath") %>' Target="_blank">
                                                </asp:HyperLink>                               
                                    </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Approval Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAppStatus" runat="server" Text='<%#Eval("Approved_Status") %>'></asp:Label>                                     
                                                                   
                                    </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                   Approval Status</HeaderTemplate>
                                <ItemTemplate>                                    
                                    <asp:Label ID="lblStatus" runat="server"  Text='<%#Eval("Approved_Status") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>
                </td>
               
            </tr>
            
           
             <tr>
                <td colspan="6" align="left">
                    <asp:Button ID="btnApprove" runat="server" Text="Approve" Visible="false"
                        style="width:120px;" CssClass="btnStyle" onclick="btnApprove_Click"  
                         />&nbsp;&nbsp; 
                    <asp:Button ID="btnDecline" runat="server" Text="Decline" Visible="false"
                        style="width:120px;" CssClass="btnStyle" OnClientClick="openbox('Reason to Decline', 2,'divDecline','divFilterDecline','spnTitle'); return false;"    
                         />
                         <br />
                          <asp:Label ID="lblMsg1" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                    
                </td>
               
            </tr>
             
        </table>
    </fieldset>    
    <asp:HiddenField ID="hdnEmpTimeOffID" runat="server" />
</asp:Content>

