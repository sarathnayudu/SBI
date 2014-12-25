<%@ Page Title="Employee" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="Employee.aspx.cs" Inherits="Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <fieldset>
        <legend class="MainLegendStyle">Employee:</legend>
        <div style="float: right;">
            <asp:LinkButton ID="lnkBtnNewEmp" CssClass="main" CommandArgument="Add" OnClick="lnkBtnNewEmp_Click"
                Text="Add New Employee Details" runat="server"></asp:LinkButton></div>
        <div style="margin-top: 20px;">
        
            <asp:GridView ID="gvEmployeeDetails" runat="server" Width="98%" CssClass="gridViewStyle"
                OnRowDataBound="gvEmployeeDetails_RowDataBound" RowStyle-CssClass="rowStyle" AllowPaging="True" OnPageIndexChanging="gvEmployeeDetails_PageIndexChanging" PageSize="10"
                EmptyDataText="Sorry! no records found" AlternatingRowStyle-CssClass="alternateRow"
                HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" OnSelectedIndexChanging="gvEmployeeDetails_SelectedIndexChanging"
                OnRowDeleting="gvEmployeeDetails_RowDeleting" >
                <%--<PagerSettings Mode="NumericFirstLast" PageButtonCount="4"  FirstPageText="First" LastPageText="Last"/>--%>
                <PagerSettings Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="<< Previous" NextPageText="Next >>" FirstPageText="First"  LastPageText="Last" />
                <PagerStyle BackColor="#084a73" Font-Bold="true" ForeColor="White" BorderColor="#041e2e" BorderWidth="2px" BorderStyle="Solid" />
<RowStyle CssClass="rowStyle"></RowStyle>
                <Columns>
                    <asp:TemplateField>
                    
                        <HeaderTemplate > 
                            First Name   <br />                         
                            <asp:TextBox ID="txtName" AutoPostBack="true" CssClass="text"  runat="server" ontextchanged="txtName_TextChanged"></asp:TextBox>                            
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblIbsid" Visible="false" runat="server" Text='<%#Eval("PK_Org_EmpID") %>'></asp:Label>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("Emp_Fname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Last Name<br />
                             <asp:TextBox ID="txtLastName" AutoPostBack="true" CssClass="text"  runat="server" ontextchanged="txtName_TextChanged"></asp:TextBox>
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("Emp_LName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Cell Phone<br />
                             <asp:TextBox ID="txtCellPhone" AutoPostBack="true" CssClass="text"  runat="server" ontextchanged="txtName_TextChanged"></asp:TextBox>
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCellPhone" runat="server" Text='<%#Eval("Emp_CellPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="false">
                        <HeaderTemplate>
                            Home Phone<br />
                             <asp:TextBox ID="txtHomePhone" AutoPostBack="true" CssClass="text"  runat="server" ontextchanged="txtName_TextChanged"></asp:TextBox>
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblHomePhone" runat="server" Text='<%#Eval("Emp_HomePhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Business Phone<br />
                             <asp:TextBox ID="txtBusinessPhone" AutoPostBack="true" CssClass="text"  runat="server" ontextchanged="txtName_TextChanged"></asp:TextBox>
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBuisinsPhone" runat="server" Text='<%#Eval("Emp_BusinessPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Email Id<br />
                             <asp:TextBox ID="txtEmailID" AutoPostBack="true" CssClass="text"  runat="server" ontextchanged="txtName_TextChanged"></asp:TextBox>
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmailId" runat="server" Text='<%#Eval("Emp_EmailId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Status<br />
                            <asp:DropDownList ID="ddlActiveStatus" AutoPostBack="true" OnSelectedIndexChanged="ddlActiveStatus_SelectedIndexChanged" runat="server" CssClass="ddl">
                                <asp:ListItem Value="Select" >Select</asp:ListItem>
                                <asp:ListItem Value="All">All</asp:ListItem>
                                <asp:ListItem Value="1">Active</asp:ListItem>
                                <asp:ListItem Value="0">InActive</asp:ListItem>                               
                            </asp:DropDownList> 
                            </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("ActiveFlag") %>'></asp:Label></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                    <HeaderStyle Width="100" />
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" CssClass="main1" runat="server" Text="Edit" CommandName="Select"></asp:LinkButton>&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkDelete" CssClass="main1" runat="server" Text="Delete" CommandName="Delete"
                                OnClientClick="javascript:return confirm('Are you sure you want to delete this record?')"></asp:LinkButton>&nbsp;&nbsp;
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<HeaderStyle CssClass="gvHeader"></HeaderStyle>

<AlternatingRowStyle CssClass="alternateRow"></AlternatingRowStyle>
            </asp:GridView>
            <div id="divEmployee" runat="server" visible="false">
                <table border="0" class="tblStyle FormStyle" cellpadding="2" width="100%" cellspacing="2">
                    <tr>
                        <td colspan="6">
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
                    <tr >
                        <td style="width: 200px;">
                            Employee ID
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtIBSID" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtIBSID"
                                ErrorMessage="Please Enter ID" SetFocusOnError="True" Display="None" ValidationGroup="vgEmployee"
                                runat="server"></asp:RequiredFieldValidator>
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
                                <asp:ListItem Value="0" >Select</asp:ListItem>
                                <asp:ListItem Value="1" Selected="True">Mr</asp:ListItem>
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
                            <div class="Outerdiv" >
                                <asp:TextBox ID="txtLName" CssClass="txtbox" runat="server"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtLName"
                                ErrorMessage="Please Enter Last Name" SetFocusOnError="True" Display="None" ValidationGroup="vgEmployee"
                                runat="server"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        Role
                        </td>
                        <td>
                         <span style="color: Red">*</span>
                        </td>
                        <td>
                        <asp:DropDownList ID="ddlRole" runat="server" AppendDataBoundItems="true" CssClass="ddl">
                            </asp:DropDownList>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="ddlRole"
                                ErrorMessage="Please Enter Employee Role" InitialValue="0" SetFocusOnError="True" Display="None" ValidationGroup="vgEmployee"
                                runat="server"></asp:RequiredFieldValidator>
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
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtCellphone" CssClass="txtbox" runat="server"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="maskCellNumber" Mask="999-999-9999" MaskType="None"
                                    TargetControlID="txtCellphone" MessageValidatorTip="true" ErrorTooltipEnabled="True"
                                    runat="server">
                                </ajaxToolkit:MaskedEditExtender>
                            </div>
                           
                        </td>
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
                            <div class="Outerdiv">
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
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ControlToValidate="txtPassword"
                                ErrorMessage="Please Enter Password" SetFocusOnError="true" Display="None" ValidationGroup="vgEmployee"
                                runat="server"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Hired Date
                        </td>
                        <td>
                            <span style="color: Red">*</span>
                        </td>
                        <td>
                        <div style="float:left;">
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtHiredDate" runat="server" onchange="ValidateDate(this.id);getdays(this.id);getdays1('ctl00_ContentPlaceHolderMain_txtTerminatDate',this.id);" CssClass="txtbox"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="maskHireDate" runat="server" MaskType="Date"
                                    TargetControlID="txtHiredDate" Mask="99/99/9999" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                            </div>
                            
                             </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnCal1" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnCal1" TargetControlID="txtHiredDate">
                                    </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ControlToValidate="txtHiredDate"
                                ErrorMessage="Please Enter Hired Date" SetFocusOnError="true" Display="None"
                                ValidationGroup="vgEmployee" runat="server"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            Termination Date
                        </td>
                        <td>
                        </td>
                        <td>
                        <div style="float:left;">
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtTerminatDate" runat="server" onchange="ValidateDate(this.id);getdays(this.id);getdays1(this.id,'ctl00_ContentPlaceHolderMain_txtHiredDate');" CssClass="txtbox"></asp:TextBox>
                                <ajaxToolkit:MaskedEditExtender ID="maskTermDate" runat="server" MaskType="Date"
                                    Mask="99/99/9999" TargetControlID="txtTerminatDate" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                            </div>
                             </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnCal" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnCal" TargetControlID="txtTerminatDate">
                                    </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr class="trBg">
                        <td colspan="6">
                            <div style="float: left;">
                                Additional Info:</div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 200px;">
                            Employee Category
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtEmpCateg" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                            
                        </td>
                         <td>
                            Employee Salary
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtEmpSal" CssClass="txtbox" runat="server"></asp:TextBox>                               
                            </div>
                        </td>
                       
                    </tr>
                    <tr>
                     <td style="width: 140px;">
                            Document Number
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtDocNumber" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                        </td>
                        <td>
                            Document Expiry Date
                        </td>
                        <td>
                           
                        </td>
                        <td>
                        <div style="float:left;">
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtDocExpDt" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                            </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnExpDt" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnExpDt" TargetControlID="txtDocExpDt">
                                    </ajaxToolkit:CalendarExtender>
                            <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender3" runat="server" MaskType="Date"
                                    Mask="99/99/9999" TargetControlID="txtDocExpDt" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                           
                        </td>
                        
                    </tr>
                    <tr>
                    <td>
                            LCA Number
                        </td>
                        <td>
                           
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtLCANo" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                        
                        </td>
                        <td>
                            LCA Expiry Date
                        </td>
                        <td>
                            
                        </td>
                        <td>
                        <div style="float:left;">
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtLCAExpDt" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                            </div>
                        <div style="float:left;padding-left:6px;">
                        <asp:ImageButton ID="imgBtnLCAExpDt" runat="server" OnClientClick="return false;" ImageUrl="~/images/cal.bmp" />
                        </div>
                         <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" FirstDayOfWeek="Sunday" PopupButtonID="imgBtnLCAExpDt" TargetControlID="txtLCAExpDt">
                                    </ajaxToolkit:CalendarExtender>
                           <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtender4" runat="server" MaskType="Date"
                                    Mask="99/99/9999" TargetControlID="txtLCAExpDt" UserDateFormat="MonthDayYear">
                                </ajaxToolkit:MaskedEditExtender>
                         
                        </td>
                        
                    </tr>
                     <tr>
                      <td>
                            Perm Certification Number
                        </td>
                        <td>
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtPermCertNo" CssClass="txtbox" runat="server"></asp:TextBox>
                                
                            </div>
                        </td>
                        <td>
                            I140 Number
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtI140No" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                           
                         
                        </td>
                        
                    </tr>
                    <tr>
                     <td>
                            I485 Number
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            <div class="Outerdiv">
                                <asp:TextBox ID="txtI485No" runat="server" CssClass="txtbox"></asp:TextBox>
                            </div>
                           
                         
                        </td>
                        
                    </tr>
                    <tr>
                        <td colspan="6" align="center">
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
</asp:Content>
