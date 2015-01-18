<%@ Page Title="Projects Detail" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ProjectsDetail.aspx.cs" Inherits="ProjectsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <fieldset>
        <legend class="MainLegendStyle">Projects:</legend>
        <table>
      <tr>
      <td>
        &nbsp   &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp
         &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp 
          &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp 
            &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp  &nbsp                            
      </td>
      <td>
       <asp:Panel ID="pnlSearch" runat="server">
       
        <asp:Label ID="lblSearch" runat="server" Text="Search" CssClass="newStyle1" ></asp:Label>
       

         
        <asp:TextBox ID="txtSearch"  runat="server"  ></asp:TextBox> 
       
        
        <asp:Button ID="btnProjSearch" Text="Search" runat="server" 
                onclick="btnProjSearch_Click" />

                 </asp:Panel>
      </td>
      <td>
       <asp:LinkButton ID="lnkBtnProj" CssClass="main" CommandArgument="Add" OnClick="lnkBtnProj_Click"
                Text="Add New Project Detail" runat="server"></asp:LinkButton>
      </td>
      </tr>
      </table>

        <div style="margin-top: 20px;">
            <asp:GridView ID="gvProjectDetails" runat="server" Width="98%" CssClass="gridViewStyle" RowStyle-CssClass="rowStyle"
                EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" OnSelectedIndexChanging="gvProjectDetails_SelectedIndexChanging"
                OnRowDeleting="gvProjectDetails_RowDeleting" OnRowDataBound="gvProjectDetails_RowDataBound">
                <Columns>
                    <%--<asp:TemplateField>
                        <HeaderTemplate>
                            S.NO</HeaderTemplate>
                        <ItemTemplate>
                            <%#Container.DataItemIndex + 1%>
                            
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Project Code</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblProjCode" runat="server" Text='<%#Eval("Proj_Code") %>'></asp:Label>
                            <asp:Label ID="lblProjID" runat="server" Visible="false" Text='<%#Eval("PK_Org_ProjectID") %>'></asp:Label>
                            <asp:Label ID="lblOrgEmpID" runat="server" Visible="false" Text='<%#Eval("FK_Org_EmpID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Project Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblProjName" runat="server" Text='<%#Eval("Proj_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Client Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblClientName" runat="server" Text='<%#Eval("Cust_Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Description</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblProjDesc" runat="server" Text='<%#Eval("Proj_Description") %>'></asp:Label>
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
            <div id="divProject" runat="server" visible="false">
            
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
                            Project Details:</div>
                    </td>
                    
                </tr>
                <tr >
                    <td style="width: 200px;">
                        Project Code:
                    </td>
                    <td>
                        <span style="color: Red">*</span>
                    </td>
                    <td style="width: 320px;">
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtProjCode" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvProjCode" ControlToValidate="txtProjCode" ErrorMessage="Please Enter Project Code"
                            SetFocusOnError="True" Display="None" ValidationGroup="vgProjects" runat="server"></asp:RequiredFieldValidator>
                    </td>
              
                    <td>
                        Project Name:
                    </td>
                    <td>
                       <span style="color: Red">*</span>  
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtProjName" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtProjName" ErrorMessage="Please Enter Project Name"
                            SetFocusOnError="True" Display="None" ValidationGroup="vgProjects" runat="server"></asp:RequiredFieldValidator>
                        
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        Project Description:
                    </td>
                    <td>
                        
                    </td>
                    <td >
                       
                            <asp:TextBox ID="txtProjDesc" CssClass="txtMultiline" style="width:280px;" TextMode="MultiLine" runat="server"></asp:TextBox>
                        
                    </td>
<td>
                        Employee
                        </td>
                        <td>
                         <span style="color: Red">*</span>
                        </td>
                        <td>
                        <asp:DropDownList ID="ddlEmployee" runat="server" AppendDataBoundItems="true" CssClass="ddl">
                            </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlEmployee"
                                ErrorMessage="Please Select Employee" InitialValue="0" SetFocusOnError="True" Display="None" ValidationGroup="vgProjects"
                                runat="server"></asp:RequiredFieldValidator>
                        </td>                   
                    
                </tr>
                <tr>
                    <td>
                       Start Date:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtStartDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                         <ajaxToolkit:MaskedEditExtender ID="maskStartDate" runat="server" MaskType="Date"
                                    TargetControlID="txtStartDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                        
                    </td>
                    <td>
                        End Date:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtEndDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                       <ajaxToolkit:MaskedEditExtender ID="maskEndDate" runat="server" MaskType="Date"
                                    TargetControlID="txtEndDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender> 
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        Client1:
                    </td>
                    <td>   
                    </td>
                    <td>                      
                     <asp:DropDownList ID="ddlClient1" CssClass="ddl" AppendDataBoundItems="true" runat="server">
                            </asp:DropDownList>
                    </td>
                    <td>
                        Client2:
                    </td>
                    <td>
                    </td>
                    <td>
                       <asp:DropDownList ID="ddlClient2" CssClass="ddl" AppendDataBoundItems="true" runat="server">
                            </asp:DropDownList>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        End Client:
                    </td>
                    <td>
                    </td>
                    <td colspan="4">
                     <asp:DropDownList ID="ddlEndClient" CssClass="ddl" AppendDataBoundItems="true" runat="server">
                            </asp:DropDownList>   
                    </td>
                    
                    
                </tr>                
               
                <tr>
                <td>
                        Bill Rate:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtBillRate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
                    </td>
                    <td>
                        Timesheet Cycle:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                         <asp:DropDownList ID="ddlTmCycle" CssClass="ddl" runat="server">
                            <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Daily"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Weekly"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Bi-Weekly"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Monthly"></asp:ListItem>
                        </asp:DropDownList>                     
                        
                    </td>
                   
                </tr> 
                <tr>
                <td>
                        Overtime Allowed:
                    </td>
                     <td></td>
                    <td>
                      <asp:DropDownList ID="ddlOvertime" CssClass="ddl" runat="server">
                      <asp:ListItem Value="-1" Text="Select"></asp:ListItem>
                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                        </asp:DropDownList>  
                    </td>
                   
                <td>
                        Overtime Rate:
                    </td>
                    <td>
                    </td>
                    <td>
                        <div class="Outerdiv">
                            <asp:TextBox ID="txtOvertimeRate" CssClass="txtbox" runat="server"></asp:TextBox>
                        </div>
                        
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
                    <td >
                    Terms:
                    </td>
                    <td></td>
                    <td>
                    <div class="Outerdiv">
                     <asp:TextBox ID="txtTerms" CssClass="txtbox" runat="server"></asp:TextBox>
                     </div>
                    </td>
                </tr> 
                 <tr>
                    <td>
                       E-Mail To:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                     
                   <asp:TextBox ID="txtEmailTo" CssClass="txtMultiline" style="width:280px;" TextMode="MultiLine" runat="server"></asp:TextBox>
                   </td>

                    <td>
                        E-Mail CC:
                    </td>
                    <td>
                        
                    </td>
                    <td>
                    <asp:TextBox ID="txtEmailCC" CssClass="txtMultiline" style="width:280px;" TextMode="MultiLine"  runat="server"></asp:TextBox>
                   </td>
                   
                </tr>
                             
                <tr>
                    <td colspan="6" align="center">
                        <asp:Button ID="btnSave" ValidationGroup="vgProjects" runat="server" Text="Save" CssClass="btnStyle"
                            OnClick="btnSave_Click" />&nbsp;
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btnStyle" OnClick="btnReset_Click" />
                        <asp:ValidationSummary ID="valProjects" runat="server" ShowMessageBox="True" ShowSummary="False"
                            ValidationGroup="vgProjects" />
                    </td>
                   
                </tr>
                
            </table>
            </div>
            
        </div>
        <div align="center">
            <asp:Label ID="lblMsg" runat="server" Visible="False" CssClass="lblMsgStyle"></asp:Label></div>
    </fieldset>
    <asp:HiddenField ID="hdnProjectsID" runat="server" />
    <asp:HiddenField ID="hdnOrgEmpID" runat="server" />
</asp:Content>