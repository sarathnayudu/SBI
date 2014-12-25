<%@ Page Title="Assign Rating Template" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AssignRatTemplate.aspx.cs" Inherits="AssignRatTemplate" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Assign Rating Template:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            <tr >
                <td  style="width:120px;">
                    Rating Template:
                </td>
               
                <td >
                     <asp:DropDownList ID="ddlRatingTempl" runat="server" AppendDataBoundItems="true" 
                                CssClass="ddl" >
                            </asp:DropDownList>                        
                    
                </td>
            </tr>
            <tr >
                <td >
                    Submission only by Admin:
                </td>
               
                <td >
                    <asp:RadioButtonList ID="rdlOnlyAdmin" RepeatDirection="Horizontal" runat="server" >
                    <asp:ListItem Value="1" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="0" Text="No" Selected="True" ></asp:ListItem>
                    </asp:RadioButtonList>
                                          
                    
                </td>
            </tr>
            <tr >
            <td colspan="2">
<asp:GridView ID="gvEmployeeDetails" runat="server" CssClass="gridViewStyle" 
                        Width="98%" RowStyle-CssClass="rowStyle" 
                        EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" 
                         AllowPaging="True" OnPageIndexChanging="gvEmployeeDetails_PageIndexChanging" PageSize="10"
                        >
                        <PagerSettings Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="<< Previous" NextPageText="Next >>" FirstPageText="First"  LastPageText="Last" />
                <PagerStyle BackColor="#084a73" Font-Bold="true" ForeColor="White" BorderColor="#041e2e" BorderWidth="2px" BorderStyle="Solid" />
                        <Columns>
                        <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    S.No</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                   <asp:Label ID="lblEmpid" Visible="false" runat="server" Text='<%#Eval("PK_Org_EmpID") %>'></asp:Label>
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
                                    </ItemTemplate>
                            </asp:TemplateField>
                            
                             <asp:TemplateField>
                        <HeaderTemplate>
                            Cell Phone
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCellPhone" runat="server" Text='<%#Eval("Emp_CellPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Business Phone
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBuisinsPhone" runat="server" Text='<%#Eval("Emp_BusinessPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Email Id
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("Emp_EmailId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>
                    
</td></tr>
                     <tr>
                <td  align="left" colspan="2">
                    <asp:Button ID="btnAssignTempl" runat="server" Text="Assign Rating Template" 
                        style="width:180px;" CssClass="btnStyle" onclick="btnAssignTempl_Click"  
                         />                  
                        
                          
                    
                </td>
               
            </tr>
            <tr >
            <td colspan="2">
<asp:GridView ID="gvAssignedTemplate" runat="server" CssClass="gridViewStyle" 
                        Width="98%" RowStyle-CssClass="rowStyle" 
                        EmptyDataText="Sorry! no Employees Evaluation has yet started" AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="False" 
                         AllowPaging="True" OnPageIndexChanging="gvAssignedTemplate_PageIndexChanging" PageSize="10"                        
                        OnRowDeleting="gvAssignedTemplate_RowDeleting">
                        <PagerSettings Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="<< Previous" NextPageText="Next >>" FirstPageText="First"  LastPageText="Last" />
                <PagerStyle BackColor="#084a73" Font-Bold="true" ForeColor="White" BorderColor="#041e2e" BorderWidth="2px" BorderStyle="Solid" />
                        <Columns>
                        <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    S.No</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                   <asp:Label ID="lblEvaluationID" Visible="false" runat="server" Text='<%#Eval("PK_EvaluationID") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                         
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Employee Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmployeeFName" runat="server" Text='<%#Eval("Emp_Fname") %>'></asp:Label>&nbsp;
                                    <asp:Label ID="lblEmployeeLName" runat="server" Text='<%#Eval("Emp_Lname") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField>
                        <HeaderTemplate>
                            Email Id
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("Emp_EmailId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                             <asp:TemplateField>
                        <HeaderTemplate>
                            Template Name
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblTemplName" runat="server" Text='<%#Eval("Template_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Review Period
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPeriodName" runat="server" Text='<%#Eval("Period_Name") %>'></asp:Label>
                           ( <asp:Label ID="lblStartDate" runat="server" Text='<%#Eval("Start_Date","{0:MM/dd/yyyy}") %>'></asp:Label>
                            <asp:Label ID="lblEndDate" runat="server" Text='<%#Eval("End_Date","{0:MM/dd/yyyy}") %>'></asp:Label>
                            )
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                     <asp:TemplateField>
                        <HeaderTemplate>
                            Process Rating Template
                            </HeaderTemplate>
                        <ItemTemplate>
                        <a  onclick="window.open('ViewEmployeeEvaluation.aspx?EvID=<%#Eval("PK_EvaluationID") %>','_blank','toolbar=yes, location=yes, directories=no, status=no, menubar=yes, scrollbars=yes, resizable=no, copyhistory=yes,left=200,top=5, width=800, height=650')" href="#" class="btnStyle">Process</a>
                           
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" Visible="false" CssClass="main1" runat="server" Text="Edit" CommandName="Select"></asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="lnkDelete" CssClass="main1" runat="server" Text="Delete" CommandName="Delete"
                                        OnClientClick="javascript:return confirm('Are you sure you want to delete this record?')"></asp:LinkButton>&nbsp;&nbsp;
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>
                    
</td></tr>
<tr><td colspan="2">
<asp:Label ID="lblMsg1" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
</td></tr>
            </table>
                    </fieldset>
</asp:Content>

