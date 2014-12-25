<%@ Page Title="Approve Timesheet" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AppTimesheet.aspx.cs" Inherits="AppTimesheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">
 function SelectAllCheckboxes(spanChk){

   // Added as ASPX uses SPAN for checkbox
   var oItem = spanChk.children;
   var theBox= (spanChk.type=="checkbox") ? 
        spanChk : spanChk.children.item[0];
   xState=theBox.checked;
   elm=theBox.form.elements;

   for(i=0;i<elm.length;i++)
     if(elm[i].type=="checkbox" && 
              elm[i].id!=theBox.id)
     {
       //elm[i].click();
       if(elm[i].checked!=xState)
         elm[i].click();
       //elm[i].checked=xState;
     }
 }

 function Checked_All(obj) {

     var GrdView = obj.parentNode.parentNode.parentNode;

     var Input_List = GrdView.getElementsByTagName("input");
     for (var i = 0; i < Input_List.length; i++) {

         var Row = Input_List[i].parentNode.parentNode;

         if (Input_List[i].type == "checkbox" && obj != Input_List[i]) {

             if (obj.checked) {

                 Input_List[i].checked = true;

             }

             else {

                 Input_List[i].checked = false;

             }

         }

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
   
        <legend class="MainLegendStyle">Approve Timesheets:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            
            <tr class="trBg">
            <td colspan="6">
            <div style="float:left;">
                     Search Timesheet:</div>
            </td>
            </tr>
                       
             <tr>
                <td style="width: 12%;">
                    Employee Name:
                </td>
                <td style="width: 50px;">
                    
                </td>
                <td style="width: 86%;">                    
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
                    <span style="color: Red">*</span> 
                    </td>
                    <td colspan="4">
                     <div style="float:left;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtStartDate" onchange="ValidateDate(this.id);" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnStartDt" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnStartDt" TargetControlID="txtStartDate">
                                    </ajaxToolkit:CalendarExtender>
                         <ajaxToolkit:MaskedEditExtender ID="maskStartDate" runat="server" MaskType="Date"
                                    TargetControlID="txtStartDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                                
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtStartDate"
                                ErrorMessage="Please Enter Start Date" SetFocusOnError="True" Display="None"
                                ValidationGroup="valEmpTimeOff" runat="server"></asp:RequiredFieldValidator>   
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
                            <asp:TextBox ID="txtEndDate" onchange="ValidateDate(this.id);" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnEndDt" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnEndDt" TargetControlID="txtEndDate">
                                    </ajaxToolkit:CalendarExtender>
                       <ajaxToolkit:MaskedEditExtender ID="maskEndDate" runat="server" MaskType="Date"
                                    TargetControlID="txtEndDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender> 
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtEndDate"
                                ErrorMessage="Please Enter End Date" SetFocusOnError="True" Display="None"
                                ValidationGroup="valEmpTimeOff" runat="server"></asp:RequiredFieldValidator>         
                    </td>
                   
                </tr>
                 <tr><td>Timesheet Type</td>
                 <td><span style="color: Red">*</span> </td>
                 <td colspan="4"> <asp:DropDownList ID="ddlSelectTS" CssClass="ddl" runat="server">
                <asp:ListItem Text="Select" Value="0"></asp:ListItem> 
                <asp:ListItem Text="Missing" Value="1"></asp:ListItem>
                <asp:ListItem Text="Submitted" Value="2"></asp:ListItem>               
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="ddlSelectTS"
                                ErrorMessage="Please Select the Timesheet Type" InitialValue="0" SetFocusOnError="True" Display="None"
                                ValidationGroup="valEmpTimeOff" runat="server"></asp:RequiredFieldValidator>       
                </td></tr>
            
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSearch" runat="server" Text="Show Details" 
                        style="width:120px;" CssClass="btnStyle" ValidationGroup="valEmpTimeOff" onclick="btnSearch_Click"
                         />&nbsp;
                   <asp:ValidationSummary ID="vsEmpTS" runat="server" ShowMessageBox="true"
                        ShowSummary="false" ValidationGroup="valEmpTimeOff" /> 
                        <br />
                        <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                        <br />
                         <asp:GridView ID="gvTimesheet" runat="server" CssClass="gridViewStyle" 
                        Width="98%" RowStyle-CssClass="rowStyle" AllowPaging="True" OnPageIndexChanging="gvTimesheet_PageIndexChanging" PageSize="10"
                        EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" 
                        
                        onrowdatabound="gvTimesheet_RowDataBound" >
                         <PagerSettings Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="<< Previous" NextPageText="Next >>" FirstPageText="First"  LastPageText="Last" />
                <PagerStyle BackColor="#084a73" Font-Bold="true" ForeColor="White" BorderColor="#041e2e" BorderWidth="2px" BorderStyle="Solid" />
                        <Columns>
                        <asp:TemplateField Visible="false" >
                                <HeaderTemplate>
                                    S.No</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblTimesheetID" runat="server" Visible="False" Text='<%#Eval("PK_TimeSheetID") %>'></asp:Label>
                                                                        
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
                                   MON</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMon" runat="server" Text='<%#Eval("Mon") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   TUE</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTue" runat="server" Text='<%#Eval("Tue") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   WED</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblWed" runat="server" Text='<%#Eval("Wed") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   THU</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblThu" runat="server" Text='<%#Eval("Thu") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   FRI</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFri" runat="server" Text='<%#Eval("Fri") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   SAT</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSat" runat="server" Text='<%#Eval("Sat") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   SUN</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSun" runat="server" Text='<%#Eval("Sun") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   TOT</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTot" runat="server" Text='<%#Eval("Total") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                           
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Client Approved TS</HeaderTemplate>
                                <ItemTemplate>                                                                       
                                    <asp:HyperLink runat="server" ID="tslink" Text="View" CssClass="main1" NavigateUrl='<%#Eval("TSFilePath") %>' Target="_blank">
                                                </asp:HyperLink>                                  
                                    </ItemTemplate>
                            </asp:TemplateField>
                               
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Approval Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAppStatus" runat="server" Text='<%#Eval("TSStatus") %>'></asp:Label>  
                                    </ItemTemplate>
                            </asp:TemplateField>
                           
                           
                        </Columns>
                    </asp:GridView>
                    <asp:GridView ID="gvMissingTimesheet" runat="server" CssClass="gridViewStyle"  Visible="false"
                        Width="98%" RowStyle-CssClass="rowStyle" AllowPaging="True" OnPageIndexChanging="gvMissingTimesheet_PageIndexChanging" PageSize="10"
                        EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" >
                        <PagerSettings Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="<< Previous" NextPageText="Next >>" FirstPageText="First"  LastPageText="Last" />
                <PagerStyle BackColor="#084a73" Font-Bold="true" ForeColor="White" BorderColor="#041e2e" BorderWidth="2px" BorderStyle="Solid" />
                        <Columns>
                         <asp:TemplateField>
                                <HeaderTemplate>
                                   <asp:CheckBox ID="chkSelectAllMS" onclick="javascript:SelectAllCheckboxes(this);" runat="server" /> </HeaderTemplate>
                                <ItemTemplate>
                                       <asp:CheckBox ID="chkSelectMS" runat="server" />                                 
                                    </ItemTemplate>
                            </asp:TemplateField>
                        
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Employee Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeFName" runat="server" Text='<%#Eval("Emp_Name") %>'></asp:Label>&nbsp;
                                                                                                          
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Email ID</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmailID" runat="server" Text='<%#Eval("Emp_EmailID") %>'></asp:Label>&nbsp;
                                                                                                          
                                    </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Start Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStartDate" runat="server" Text='<%#Eval("WeekStartDate","{0:MM/dd/yyyy}") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                                <HeaderTemplate>
                                   End Date</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEndDate" runat="server" Text='<%#Eval("WeekEndDate","{0:MM/dd/yyyy}") %>'></asp:Label>                                    
                                    </ItemTemplate>
                            </asp:TemplateField>                          
                           
                           
                        </Columns>
                    </asp:GridView>
                     <div style="float:right;padding-right:362px;" id="divTotal" runat="server" visible="false">
                Total: <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </div>
                </td>
               
            </tr>
           
             <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnApprove" runat="server" Text="Approve" Visible="false"
                        style="width:120px;" CssClass="btnStyle" onclick="btnApprove_Click"  
                         />&nbsp;&nbsp; 
                    <asp:Button ID="btnDecline" runat="server" Text="Decline" Visible="false"
                        style="width:120px;" CssClass="btnStyle" OnClientClick="openbox('Reason to Decline', 2,'divDecline','divFilterDecline','spnTitle'); return false;"  
                         />
                    
               
                 <asp:Button ID="btnSendMail" runat="server" Text="Send E-Mail" Visible="false"
                        style="width:120px;" CssClass="btnStyle" onclick="btnSendMail_Click"    
                         />
                         <asp:Button ID="btnSendMailMs" runat="server" Text="Send E-Mail" Visible="false"
                        style="width:120px;" CssClass="btnStyle" onclick="btnSendMailMs_Click"    
                         />
                         <br />
                          <asp:Label ID="lblMsg1" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
                </td>
               
            </tr>
            
        </table>
    </fieldset>    
    
</asp:Content>

