<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ViewEmployeeEvaluation.aspx.cs"
    Inherits="ViewEmployeeEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title></title>
    <link href="Styles/CustomStyles.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" href="Styles/HomeStyle.css" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
<body>
        <a id="lnkEval" target="_blank"  ></a>
    <div>
        <fieldset>
            <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
                <tr>
                    <td width="30px">
                        <asp:Image ID="imgLogo" runat="server" />
                    </td>
                    <td colspan="2" >
                        <asp:Label ID="lblOrgName"  CssClass="LogoText" runat="server"></asp:Label>
                    </td>
                    <td>
                        <div id="divOrgAddress"  runat="server" style="text-align: right; font-size: 8pt;">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Label ID="lblEmployeePerf" Style="color: #bf1f24; font-size: 11pt; font-weight: bold;
                            font-style: italic;" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 130px;">
                        <b>Name of Employee:</b>
                    </td>
                    <td>
                        <asp:Label ID="lblEmployee" runat="server"></asp:Label>
                    </td>
                    <td>
                        <b>Job Title:</b>
                    </td>
                    <td>
                        <asp:Label ID="lblJobTitle" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Evaluation Period:</b>
                    </td>
                    <td>
                        <asp:Label ID="lblEvalPeriod" runat="server"></asp:Label>
                    </td>
                    <td>
                        <b>Business Group:</b>
                    </td>
                    <td>
                        <asp:Label ID="lblEmplCateg" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <b><asp:Label ID="lblInsTitle" runat="server" Text="Instructions"></asp:Label></b><br />
                        <asp:Label ID="lblInstructions" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                    <asp:Label ID="lblEmployeeEvalArea" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Part A-"></asp:Label>
                    <b>To be completed by Employee</b> <br /><br />
                     <%-- <asp:Repeater ID="rptSummaryQues" runat="server"  >  --%>                          
                            <ItemTemplate>
                             <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle"  width="100%">
                                <tr>
                                    <td>
                                     <%--<asp:Label ID="lblQuestionID" Visible="false" runat="server" Text='<%#Eval("PK_QuesID")%>'></asp:Label>--%>
                                        <asp:Label ID="lblSummarytitle1" runat="server" Text="SUMMARY OF KEY ACCOMPLISHMENTS AND CAREER DEVELOPMENT ACTIVITIES" style="color:red; font-size:110%"></asp:Label>
                                   <br />
                                    <asp:TextBox ID="txtAnswer" style="width:750px;height:150px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
                                    </td>
                                    
                                </tr>

                                <tr>
                                    <td>
                                     <%--<asp:Label ID="lblQuestionID" Visible="false" runat="server" Text='<%#Eval("PK_QuesID")%>'></asp:Label>--%>
                                        <asp:Label ID="Label1" runat="server" Text="CAREER DEVELOPMENT PLAN - UPCOMING YEAR" style="color:red; font-size:110%"></asp:Label>
                                        <b>(NOTE: ATLEAST ONE TRAINING OR CERTIFICATION REQUIRED FOR NEXT EVALUATION PERIOD)</b>
                                   <br />
                                    <asp:TextBox ID="TextBox1" style="width:750px;height:150px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
                                    </td>
                                    
                                </tr>

                                </table>
                            </ItemTemplate>                           
                       <%-- </asp:Repeater> --%>               
                    </td>
                </tr>
               
                <tr>
                    <td colspan="4">
                    <asp:Label ID="Label7" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Part B-"></asp:Label>
                    <b>To be completed by Employee and Employer </b>
                       
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        
                             <HeaderTemplate>
                                <table border="1" cellpadding="3" cellspacing="3" class="tblStyle FormStyle"  width="50%">
                               
                                <tr><th style="width: 200px;">
                                <asp:Label ID="lblEmployeeEvalArea1" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="AREA OF EVALUATION"></asp:Label>
                                </th><th style="width: 130px;">
                                <asp:Label ID="lblHeading1" Text="(1)Exceptional" Style="font-weight: bold" runat="server"></asp:Label>
                                </th>
                                <th style="width: 130px;">
                                <asp:Label ID="lblHeading2" Text="(2)Exceeds" Style="font-weight: bold" runat="server"></asp:Label>
                                </th>
                                <th style="width: 130px;"><asp:Label ID="lblHeading3" Text="(3)Fully Meets" Style="font-weight: bold" runat="server"></asp:Label>
                                </th>
                                <th style="width: 130px;">
                                <asp:Label ID="lblHeading4" Text="(4)Transitional"  Style="font-weight: bold" runat="server"></asp:Label>
                                </th>
                                <th style="width: 130px;">
                                <asp:Label ID="lblHeading5" Text="(5)Fails to Meet" Style="font-weight: bold" runat="server"></asp:Label>
                                </th>
                                <th><b>Employer Evaluation</b></th>
                                </tr>
                            </HeaderTemplate>

                            <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td >
                                    <asp:Label ID="lblQuestionID" Visible="false" runat="server" Text='<%#Eval("PK_QuesID")%>'></asp:Label>
                                        <asp:Label ID="lblQuestions" runat="server" Text='<%#Eval("Questions")%>'></asp:Label>
                                    </td>
                                    <td align="center">
                                    <asp:RadioButton ID="rdoQuestions1"  runat="server" Visible="true" GroupName="EmpEval" />
                                    <%--<asp:CheckBox ID="chkQuestions1" runat="server" Visible="false" />--%>
                                    </td>
                                    <td align="center">
                                     <asp:RadioButton ID="rdoQuestions2" runat="server" Visible="true" GroupName="EmpEval" />
                                     <%--<asp:CheckBox ID="chkQuestions2" runat="server" Visible="false" />--%>
                                    </td>
                                    <td align="center">
                                     <asp:RadioButton ID="rdoQuestions3" runat="server" Visible="true" GroupName="EmpEval" />
                                     <%--<asp:CheckBox ID="chkQuestions3" runat="server" Visible="false" />--%>
                                    </td>
                                    <td align="center">
                                     <asp:RadioButton ID="rdoQuestions4" runat="server" Visible="true" GroupName="EmpEval" />
                                  <%--   <asp:CheckBox ID="chkQuestions4" runat="server" Visible="false" />--%>
                                    </td>
                                    <td align="center">
                                     <asp:RadioButton ID="rdoQuestions5" runat="server" Visible="true" GroupName="EmpEval" />
                                     <%--<asp:CheckBox ID="chkQuestions5" runat="server" Visible="false" />--%>
                                    </td>
                                    <td align="center">
                                    <asp:DropDownList ID="ddlEmployerEval" runat="server" CssClass="ddl" AppendDataBoundItems="false"> <%--AppendDataBoundItems="true"--%>
                                     <asp:ListItem Text="Exceptional"></asp:ListItem>
                                     <asp:ListItem Text="Exceeds"></asp:ListItem>
                                     <asp:ListItem Text="Fully Meets"></asp:ListItem>
                                     <asp:ListItem Text="Transitional"></asp:ListItem>
                                     <asp:ListItem Text="Fails to Meet"></asp:ListItem>
                                                                                                    
                                    </asp:DropDownList>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                    <asp:Label ID="lblEmpEvalGrade" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Employee Overall Evaluation Grade"></asp:Label>
                        
                         <asp:DropDownList ID="ddlEmpEvalGrade" runat="server" CssClass="ddl">
                          <asp:ListItem Text="EE-Exceeds Expectations"></asp:ListItem>
                          <asp:ListItem Text="ME-Meets Expectations"></asp:ListItem>
                          <asp:ListItem Text="BE-Below Expectations"></asp:ListItem>
                          </asp:DropDownList>
                    </td>
                </tr>

                 <tr>
                    <td colspan="4">
                    <asp:Label ID="lblSuperVisComments" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Supervisor Comments"></asp:Label>
                        <br />
                         <asp:TextBox ID="txtSuperVisComments" style="width:760px;height:120px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                    <asp:Label ID="lblEmpSignature" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Employee Signature"></asp:Label>
                        <br />
                         <asp:TextBox ID="txtEmployeeSign" style="width:200px;height:60px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
                    </td>
                     <td colspan="2">
                    <asp:Label ID="lblSupervSignature" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Supervisor Signature"></asp:Label>
                        <br />
                         <asp:TextBox ID="txtSupervisorSign" style="width:200px;height:60px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <asp:Label ID="Label4" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Date:"></asp:Label>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtEmployeeSignDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        
                    </div>
                    </td>
                     <td colspan="2">
                   <asp:Label ID="Label5" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Supervisor Name:"></asp:Label>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtSupervisorName" CssClass="txtbox" runat="server"></asp:TextBox>
                        
                    </div>
                    <asp:Label ID="Label6" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="Date:"></asp:Label>
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtSupervSignDate" CssClass="txtbox" runat="server"></asp:TextBox>
                        
                    </div>
                    </td>
                </tr>
                <tr><td colspan="4">
                <asp:Button ID="btnSaveEvalDetails" runat="server" OnClick="btnSaveEvalDetails_Click" Text="Save"
                     style="width:130px;"   CssClass="btnStyle" />
                     <asp:Button ID="btnReport" runat="server" OnClick="btnReport_Click" Text="Report"
                     style="width:130px;"   CssClass="btnStyle" />
                </td></tr>
            </table>
        </fieldset>
    </div>
    <asp:HiddenField ID="hdnEmpID" runat="server" />
    <asp:HiddenField ID="hdnTemplID" runat="server" />
    <asp:HiddenField ID="hdnOnlyAdmin" runat="server" />
    <asp:HiddenField ID="hdnFileName" runat="server" />
    <asp:HiddenField ID="hdnRatScaTitCount" runat="server" />
   
</body>
        </table>

</asp:Content>
