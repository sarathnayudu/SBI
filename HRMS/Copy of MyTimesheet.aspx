<%@ Page Title="Timesheet" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MyTimesheet.aspx.cs" Inherits="MyTimesheet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="JavaScript" type="text/JavaScript">
    function cal_total() 
    {
        var mon = document.getElementById("<%=txtmon.ClientID%>").value;
        var tue = document.getElementById("<%=txttue.ClientID%>").value;
        var wed = document.getElementById("<%=txtwed.ClientID%>").value;
        var thu = document.getElementById("<%=txtthu.ClientID%>").value;
        var fri = document.getElementById("<%=txtfri.ClientID%>").value;
        var sat = document.getElementById("<%=txtsat.ClientID%>").value;
        var sun = document.getElementById("<%=txtsun.ClientID%>").value;
        var tot = document.getElementById("<%=txttotal.ClientID%>");
        var tot1 = document.getElementById("<%=hdnTotal.ClientID%>");
        
        var total=0;
        if (mon.trim() != "")
            total += parseFloat(mon.trim());
        if (tue.trim() != "")
            total += parseFloat(tue.trim());
        if (wed.trim() != "")
            total += parseFloat(wed.trim());
        if (thu.trim() != "")
            total += parseFloat(thu.trim());
        if (fri.trim() != "")
            total += parseFloat(fri.trim());
        if (sat.trim() != "")
            total += parseFloat(sat.trim());
        if (sun.trim() != "")
            total += parseFloat(sun.trim());
        tot.value = total;
        tot1.value = total;
       
        
    }
    String.prototype.trim = function() 
    {
        return this.replace(/^\s+|\s+$/g, "");
    }

    function allowOnlyNumbers(event) {
        if ((event.keyCode >= 48) && (event.keyCode <= 57)) {
            return;
        }
        else if (event.keyCode == 13) {
            return;
        }
        event.cancelBubble = true;
        event.returnValue = false;
    }

    function validate_form(vstring, vtype, fieldname) 
    {
        var err_stat = false;
        var errmsg = "";
        if (vtype == "Number") 
        {
            var status = true;
            status = isEmpty(vstring);
            if (status == true) 
            {
                errmsg = "The field '" + fieldname + "' should be a number! Ex: 123.12" + "\n";
                err_stat = true;
            }
            else  {
               
                status = isInteger(vstring);
                if (status == false) {
                    errmsg = "The field '" + fieldname + "' should be a number! Ex: 123.12" + "\n";
                    err_stat = true;
                }
            }
        }
        if (err_stat == true)
        { return errmsg; }
        else
        { return ""; }
    }

    function isEmpty(vstring) 
    {
        var emptyc = 0;
        if (vstring.length <= 0) 
        {
            return true;
        }
        for (j = 0; j < vstring.length; j++) 
        {
            var c = vstring.charAt(j);
            if (c == ' ')
            { emptyc = emptyc + 1; }
        }
        if (emptyc == vstring.length) 
        {
            return true;
        }
        return false;
    }

    function isInteger(vstring) 
    {
        var digits = "0123456789.";
        for (j = 0; j < vstring.length; j++) 
        {
            var c = vstring.charAt(j);
            if (digits.indexOf(c) == -1) 
            {
                return false;
            }
        }
        return true;
    }
    function ValidateSubmit() {
        
        var msg="";
        var mon = document.getElementById("<%=txtmon.ClientID%>").value;
        var tue = document.getElementById("<%=txttue.ClientID%>").value;
        var wed = document.getElementById("<%=txtwed.ClientID%>").value;
        var thu = document.getElementById("<%=txtthu.ClientID%>").value;
        var fri = document.getElementById("<%=txtfri.ClientID%>").value;
        var sat = document.getElementById("<%=txtsat.ClientID%>").value;
        var sun = document.getElementById("<%=txtsun.ClientID%>").value;
        msg += validate_form(mon, 'Number', 'Monday');
        msg += validate_form(tue, 'Number', 'Tuesday');
        msg += validate_form(wed, 'Number', 'Wednesday');
        msg += validate_form(thu, 'Number', 'Thursday');
        msg += validate_form(fri, 'Number', 'Friday');
        msg += validate_form(sat, 'Number', 'Saturday');
        msg += validate_form(sun, 'Number', 'Sunday');
        if (msg != '') 
        {
            alert(msg);
            return false;        
        }
        return true;
    
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
   <asp:UpdatePanel ID="upPnl" runat="server">
                                <ContentTemplate>
 <fieldset class="fieldSetStyle1">
        <legend class="MainLegendStyle">Timesheet: <span style="color:#245343;text-transform:uppercase;"> <%=Session["UserName"]%></span></legend>
<div align="left" >
<table width="100%" border="0" cellpadding="0" cellspacing="0"   >
      <tr>        
            <td valign="top" >
                <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0">                                       
                   <tr style="display:none;">
                   
                   <td>
                    <table border="0" align="left" width="60%" style="margin-left:5px;"  class="titleStyle1" cellpadding="0" cellspacing="0" >
                    <tr>
                    <td >Start Date:</td>
                    <td>
                     <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                     <ajaxToolkit:MaskedEditExtender ID="maskStartDate" runat="server" MaskType="Date"
                                    TargetControlID="txtStartDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td>End Date:</td>
                    <td>
                     <asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                     <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender1" runat="server" MaskType="Date"
                                    TargetControlID="txtEndDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                    </td>
                    <td><asp:Button ID="btnDtTimesheet" runat="server" Text="Go" 
                            onclick="btnDtTimesheet_Click" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" 
                            onclick="btnReset_Click" />
                             </td>
                    </tr></table>
                  </td></tr>
                    <tr>
                        <td valign="top" class="bodytext" style="height:100px;padding-top:6px;" align="left">                
                            <table border="0" align="left" cellpadding="0" width="100%" cellspacing="0" style="background-color:#dee4e6;" >
                                <tr>
                                    <td colspan="2"><asp:label ID="lblerrormessage" CssClass="lblStyle" runat="server"></asp:label></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" style=" height: 10px;"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" style=" border-bottom:solid 5px #bfd0d4;">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr class="InnerLegendStyle">
                                                <td style=" padding:0px 0px 0px 230px; width:307px;" align="left"><b>Week Start Date : <asp:label ID="lblwkstart" runat="server"></asp:label></b></td>
                                                <td align="left"><b>Week End Date :<asp:label ID="lblwkend" runat="server"></asp:label></b></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>                                
                                <tr>
                                    <td colspan="2" align="center">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style=" width:220px;"></td>
                                                <td>
                                                    <asp:label ID="lblhmon" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblhtue" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblhwed" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblhthu" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblhfri" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblhsat" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblwkday" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblhMon1" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblhTue2" visible="false" runat="server"></asp:label>
                                                    <asp:label ID="lblcurrentweek" visible="false" runat="server"></asp:label> 
                                                </td>
                                            </tr>
                                        </table>
                                    </td>                                    
                                </tr>                                
                                <tr>
                                    <td valign="top" style=" width:100px;">        
                                        <asp:Calendar id="cal" runat="server" OnSelectionChanged="Selection_Change" runat="server" BackColor="White" 
                                                BorderColor="#5a86b1" BorderWidth="1px" CellPadding="1" 
                                                DayNameFormat="Shortest" FirstDayOfWeek="Monday" Font-Names="Verdana" 
                                                Font-Size="8pt" ForeColor="#2f6686" Font-Bold="true" Height="200px" SelectionMode="DayWeek" 
                                                Width="220px">
                                                 <SelectedDayStyle BackColor="#2b5e90" Font-Bold="True" ForeColor="#ffffff" />
                                            <SelectorStyle BackColor="#f2f7fb" ForeColor="#336666" />
                                            <WeekendDayStyle BackColor="#d8e3e9" ForeColor="#444444" />
                                            <TodayDayStyle BackColor="#688fb6" ForeColor="#ffffff" />                                            
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <NextPrevStyle Font-Size="8pt" ForeColor="#ddf4ff" />
                                            <DayHeaderStyle BackColor="#f2f7fb" ForeColor="#336666" Height="1px" />
                                            <TitleStyle BackColor="#2b5e90" BorderColor="#3366CC" BorderWidth="1px" 
                                                Font-Bold="True" Font-Size="10pt" ForeColor="#e7f0f9" Height="25px" />
                                        </asp:Calendar>
                                    </td>
                                    <td valign="top" align="left">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr valign="top">
                                                <td valign="top" align="center" style=" width:65px;">Mon<br/>
                                                    <asp:label ID="lblmon" runat="server"></asp:label>
                                                </td>
                                                <td valign="top" align="center" style=" width:65px;">Tue<br/>
                                                    <asp:label ID="lbltue" runat="server"></asp:label>
                                                </td>
                                                <td valign="top" align="center" style=" width:65px;">Wed<br/>
                                                    <asp:label ID="lblwed" runat="server"></asp:label>
                                                </td>
                                                <td valign="top" align="center" style=" width:65px;">Thu<br/>
                                                    <asp:label ID="lblthu" runat="server"></asp:label>
                                                </td>                                                
                                                <td valign="top" align="center" style=" width:65px;">Fri<br/>
                                                    <asp:label ID="lblfri" runat="server"></asp:label>
                                                </td>                                                
                                                <td valign="top" align="center" style=" width:65px;">Sat<br/>
                                                    <asp:label ID="lblsat" runat="server"></asp:label>
                                                </td>                                                
                                                <td valign="top" align="center" style=" width:65px;">Sun<br/>
                                                    <asp:label ID="lblsun" runat="server"></asp:label>
                                                </td>                                                
                                                <td valign="top" align="center" style=" width:100px;">Total</td>
                                            </tr>        
                                            <tr>                    
                                                <td align="center"><asp:TextBox id="txtmon"  MaxLength="4" CssClass="text1" runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);"/></td>
                                                <td align="center"><asp:TextBox id="txttue"  MaxLength="4" CssClass="text1" runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);"/></td>
                                                <td align="center"><asp:TextBox id="txtwed"  MaxLength="4" CssClass="text1" runat="server"  onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);" /></td>
                                                <td align="center"><asp:TextBox id="txtthu"  MaxLength="4" CssClass="text1" runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);"/></td>
                                                <td align="center"><asp:TextBox id="txtfri"  MaxLength="4" CssClass="text1" runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);"/></td>
                                                <td align="center"><asp:TextBox id="txtsat"  MaxLength="4" CssClass="text1" text="0"  runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);"/></td>
                                                <td align="center"><asp:TextBox id="txtsun"  MaxLength="4" CssClass="text1"  text="0" runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);" /></td>
                                                 <td align="center"><asp:TextBox id="txttotal"  CssClass="disabledText" runat="server" Enabled="false"  /></td>                          
                                            </tr> 
                                            <tr><%--<td align="center"><asp:TextBox id="txtMon1"  MaxLength="2" CssClass="text1"  text="0" runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);" /></td>
                                            <td align="center"><asp:TextBox id="txtTue1"  MaxLength="2" CssClass="text1"  text="0" runat="server" onblur="cal_total();" onKeyPress="allowOnlyNumbers(event);" /></td>--%>
                                            <td colspan="5"></td>                                           
                                                    <asp:HiddenField ID="hdnTotal" runat="server"  />  
                                                    <asp:HiddenField ID="hdfld" runat="server"  />  
                                            </tr>
                                            <tr>
                                                <td colspan="8" style=" height:20px;"></td>
                                            </tr>                    
                                             <tr>                    
                                                <td colspan="8" style=" padding:0px 0px 0px 10px;" align="left">
                                                <asp:HyperLink runat="server" ID="tslink" Text="view timesheet" Enabled="false" Target="_blank">
                                                </asp:HyperLink>
                                                </td>                                                                        
                                            </tr>
                                            <%--<tr>
                                                <td>
                                                    <asp:RequiredFieldValidator id="RequiredFieldValidator1" ControlToValidate="txtmon" 
                                                    Text="Monday is required." runat="server"/>
                                                    <asp:RangeValidator id="RangeValidator1" ControlToValidate="txtmon"  MinimumValue="0" MaximumValue="100" 
                                                    Type="Double" Text="The value must be a integer"    runat="server"/>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator id="RequiredFieldValidator2" ControlToValidate="txttue" 
                                                    Text="Tueday is required." runat="server"/>
                                                    <asp:RangeValidator id="RangeValidator2" ControlToValidate="txttue"  MinimumValue="0" MaximumValue="100" 
                                                    Type="Double" Text="The value must be a integer"    runat="server"/>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator id="RequiredFieldValidator3" ControlToValidate="txtwed" 
                                                    Text="Wednesday is required." runat="server"/>
                                                    <asp:RangeValidator id="RangeValidator3" ControlToValidate="txtwed"  MinimumValue="0" MaximumValue="100" 
                                                    Type="Double" Text="The value must be a integer"    runat="server"/>
                                                </td>   
                                                <td>
                                                    <asp:RequiredFieldValidator id="RequiredFieldValidator4" ControlToValidate="txtthu" 
                                                    Text="Thursday is required." runat="server"/>
                                                    <asp:RangeValidator id="RangeValidator4" ControlToValidate="txtthu"  MinimumValue="0" MaximumValue="100" 
                                                    Type="Double" Text="The value must be a integer"    runat="server"/>
                                                </td>                                                
                                                 <td>
                                                    <asp:RequiredFieldValidator id="RequiredFieldValidator5" ControlToValidate="txtfri" 
                                                    Text="Friday is required." runat="server"/>
                                                    <asp:RangeValidator id="RangeValidator5" ControlToValidate="txtfri"  MinimumValue="0" MaximumValue="100" 
                                                    Type="Double" Text="The value must be a integer" runat="server"/>
                                                </td>                                                                                               
                                                 <td>
                                                     <asp:RequiredFieldValidator id="RequiredFieldValidator6" ControlToValidate="txtsat" 
                                                    Text="'Number' cannot be blank." runat="server"/>
                                                    <asp:RangeValidator id="RangeValidator6" ControlToValidate="txtsat"  MinimumValue="0" MaximumValue="100" 
                                                    Type="Double" Text="The value must be a integer"    runat="server"/>
                                                </td>   
                                                 <td>
                                                     <asp:RequiredFieldValidator id="RequiredFieldValidator7" ControlToValidate="txtsun" 
                                                    Text="'Number' cannot be blank." runat="server"/>
                                                    <asp:RangeValidator id="RangeValidator7" ControlToValidate="txtsun"  MinimumValue="0" MaximumValue="100" 
                                                    Type="Double" Text="The value must be a integer" runat="server"/>
                                                </td> 
                                                <td></td>  
                                            </tr>    --%>            
                                            <tr>
                                                <td colspan="8"><asp:label ID="lblerrormessage1" runat="server"></asp:label></td>
                                            </tr>
                                            <tr>
                                                <td colspan="8" style=" height:20px;"></td>
                                            </tr>
                                            <tr>
                                                <td colspan="8" style="" align="left">
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>                                    
                                                            <td style=" padding:0px 0px 0px 10px;" align="left">
                                                                <font color="red">Do you have a client approved timesheet?</font>
                                                                  <asp:radiobuttonlist id="rdts" runat="server">
                                                                        <asp:listitem id="option1" runat="server" value="YES" Selected="true" />
                                                                        <asp:listitem id="option2" runat="server" value="NO" />
                                                                  </asp:radiobuttonlist>
                                                            </td>
                                                        </tr>
                                                        <tr>                                    
                                                            <td style=" padding:0px 0px 0px 10px;" align="left">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:UpdatePanel ID="upPnlUpload" runat="server">
                                                                                <Triggers>
                                                                                    <asp:PostBackTrigger ControlID="btnupload" />
                                                                                    <asp:PostBackTrigger ControlID="btnSubmit" />
                                                                                </Triggers>
                                                                                <ContentTemplate>
                                                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                            
                                                                        </td>
                                                                        
                                                                        <td  valign="top">                                                                           
                                                                            <asp:Button id="btnupload" CssClass="btnStyle" style="width:150px;display:none;" OnClick="btnupload_Click" text="Upload Time Sheet" runat="server" Enabled="false" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2">
                                                                     
                                                                    </td></tr>
                                                                </table>
                                                            </td>      
                                                        </tr>   
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                 
                            </table>                
                        </td>
                    </tr>
                    <tr>
                    <td valign="top">
                     <div id="divTaskMain" runat="server"  style="border: solid 1px #e2e9ee; padding-top: 6px;background-color:#d9e2e5; color:#116d87;font-size:11pt;">
                             <div style="padding-left:10px;" > Weekly Project Status </div>   
                                <div style="margin: 0px 10px 10px 10px; padding: 10px 0px 0px 10px; border: solid 1px #e2e9ee;">
                               &nbsp;&nbsp; <asp:TextBox ID="txtTaskDetails" runat="server" style="width:800px;height:250px;" TextMode="MultiLine" CssClass="txtMultiline" ></asp:TextBox>
                               <div style="margin: 0px 10px 10px 10px; padding: 10px 0px 0px 10px;">
                               <asp:Button id="btnSubmit" CssClass="btnStyle"  text="Submit" OnClick="btnSubmit_Click" runat="server" OnClientClick="javascript:if (ValidateSubmit()==false) {return false;}"/>
                               <asp:Button ID="btnSubmitTask"  runat="server" Text="Save Task" Visible="false" CssClass="btnStyle1"
                                            Style="width: 130px;" OnClick="btnSubmitTask_Click" />
                                            </div>
                                            <br />
                                        <asp:Label ID="lblMsg1" runat="server"></asp:Label>
                                </div></div>
                    </td></tr>
                    
                </table>
            </td>
      </tr>
    
</table>
</div>
</fieldset>
 </ContentTemplate>
                                </asp:UpdatePanel>
<asp:HiddenField ID="hdnTimeSheetID" runat="server" />
<asp:HiddenField ID="hdnTaskID" runat="server" />
<asp:HiddenField ID="hdnStartDate" runat="server" />
<asp:HiddenField ID="hdnEndDate" runat="server" />
<asp:HiddenField ID="hdnAttach" runat="server" />
</asp:Content>

