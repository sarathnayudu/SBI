﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewEmployeeEvaluation.aspx.cs"
    Inherits="ViewEmployeeEvaluation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/CustomStyles.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" href="Styles/HomeStyle.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <a id="lnkEval" target="_blank"  ></a>
    <div>
        <fieldset>
            <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
                <tr>
                    <td>
                        <asp:Image ID="imgLogo" runat="server" />
                    </td>
                    <td colspan="2">
                        <asp:Label ID="lblOrgName" CssClass="LogoText" runat="server"></asp:Label>
                    </td>
                    <td>
                        <div id="divOrgAddress" runat="server" style="text-align: right; font-size: 8pt;">
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
                      <asp:Repeater ID="rptSummaryQues" runat="server"  >                            
                            <ItemTemplate>
                             <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle"  width="100%">
                                <tr>
                                    <td>
                                     <asp:Label ID="lblQuestionID" Visible="false" runat="server" Text='<%#Eval("PK_QuesID")%>'></asp:Label>
                                        <asp:Label ID="lblQuestions" runat="server" Text='<%#Eval("Questions")%>'></asp:Label>
                                   <br />
                                    <asp:TextBox ID="txtAnswer" style="width:750px;height:150px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
                                    </td>
                                    
                                </tr>
                                </table>
                            </ItemTemplate>                           
                        </asp:Repeater>                
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
                        <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
                            <HeaderTemplate>
                                <table border="1" cellpadding="3" cellspacing="3" class="tblStyle FormStyle"  width="100%">
                                <tr><th style="width: 180px;">
                                <asp:Label ID="lblEmployeeEvalArea" Style="color: #bf1f24; font-size: 10pt; font-weight: bold;" runat="server" Text="AREA OF EVALUATION"></asp:Label>
                                </th><th>
                                <asp:Label ID="lblHeading1" runat="server"></asp:Label>
                                </th>
                                <th>
                                <asp:Label ID="lblHeading2" runat="server"></asp:Label>
                                </th>
                                <th><asp:Label ID="lblHeading3" runat="server"></asp:Label>
                                </th>
                                <th>
                                <asp:Label ID="lblHeading4" runat="server"></asp:Label>
                                </th>
                                <th>
                                <asp:Label ID="lblHeading5" runat="server"></asp:Label>
                                </th>
                                <th><b>Employer Evaluation</b></th>
                                </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td >
                                    <asp:Label ID="lblQuestionID" Visible="false" runat="server" Text='<%#Eval("PK_QuesID")%>'></asp:Label>
                                        <asp:Label ID="lblQuestions" runat="server" Text='<%#Eval("Questions")%>'></asp:Label>
                                    </td>
                                    <td>
                                    <asp:RadioButton ID="rdoQuestions1" runat="server" Visible="false" GroupName="EmpEval" />
                                    <asp:CheckBox ID="chkQuestions1" runat="server" Visible="false" />
                                    </td>
                                    <td>
                                     <asp:RadioButton ID="rdoQuestions2" runat="server" Visible="false" GroupName="EmpEval" />
                                     <asp:CheckBox ID="chkQuestions2" runat="server" Visible="false" />
                                    </td>
                                    <td>
                                     <asp:RadioButton ID="rdoQuestions3" runat="server" Visible="false" GroupName="EmpEval" />
                                     <asp:CheckBox ID="chkQuestions3" runat="server" Visible="false" />
                                    </td>
                                    <td>
                                     <asp:RadioButton ID="rdoQuestions4" runat="server" Visible="false" GroupName="EmpEval" />
                                     <asp:CheckBox ID="chkQuestions4" runat="server" Visible="false" />
                                    </td>
                                    <td>
                                     <asp:RadioButton ID="rdoQuestions5" runat="server" Visible="false" GroupName="EmpEval" />
                                     <asp:CheckBox ID="chkQuestions5" runat="server" Visible="false" />
                                    </td>
                                    <td>
                                    <asp:DropDownList ID="ddlEmployerEval" runat="server" CssClass="ddl" AppendDataBoundItems="true">
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
    </form>
</body>
</html>