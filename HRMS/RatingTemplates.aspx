<%@ Page Title="Rating Template" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RatingTemplates.aspx.cs" Inherits="RatingTemplates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset id="fldRatTemplate" runat="server">
        <legend class="MainLegendStyle">Manage Rating Template:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            <tr>
                <td colspan="3">
                    <div style="float: right;">
                        All Fields Marked With <span style="color: Red">*</span>Are Mandatory</div>
                </td>
            </tr>
            <tr class="trBg">
                <td colspan="6">
                    <div style="float: left;">
                        Rating Template:</div>
                </td>
            </tr>
            <tr >
                <td style="width: 12%;">
                    Template Name:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 85%;" colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtTemplateName" CssClass="txtbox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" ErrorMessage="Please Enter Template Name"
                            ControlToValidate="txtTemplateName" ValidationGroup="valTemplate" Display="None"
                            runat="server"></asp:RequiredFieldValidator>
                    </div>
                </td>
            </tr>

            <tr >
                <td >
                    Rating Scale:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td colspan="4">
                     <asp:DropDownList ID="ddlRatingScale" runat="server" AppendDataBoundItems="true" 
                                CssClass="ddl" >
                            </asp:DropDownList>                        
                    
                </td>
            </tr>

             <tr>
                <td >
                    Review Period:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td colspan="4">
                    <asp:DropDownList ID="ddlReviewPeriod" runat="server" AppendDataBoundItems="true" 
                                CssClass="ddl" >
                            </asp:DropDownList>
                </td>
            </tr>

             <tr >
                <td >
                    Instructions:
                </td>
                <td>
                   
                </td>
                <td colspan="4">  
                <asp:TextBox ID="txtInstructions" style="width:400px;height:120px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
                        
                </td>
            </tr>

                        
            <tr>
                <td>
                    Status:
                </td>
                <td>
                </td>
                <td colspan="4">
                    <asp:DropDownList ID="ddlStatus" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSaveTemplate" runat="server" OnClick="btnSaveTemplate_Click" Text="Save"
                        CssClass="btnStyle" ValidationGroup="valTemplate" />&nbsp;
                    <asp:Button ID="btnResetTemplate" runat="server" Text="Reset" OnClick="btnResetTemplate_Click" CssClass="btnStyle" />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valTemplate" />
                    <br />
                    <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                    <br />
                    <asp:GridView ID="gvRatingTemplate" runat="server" CssClass="gridViewStyle" Width="98%"
                        RowStyle-CssClass="rowStyle" AlternatingRowStyle-CssClass="alternateRow" HeaderStyle-CssClass="gvHeader"
                        AutoGenerateColumns="false" OnRowDataBound="gvRatingTemplate_RowDataBound"
                        OnSelectedIndexChanging="gvRatingTemplate_SelectedIndexChanging" 
                        OnRowDeleting="gvRatingTemplate_RowDeleting" >
                        <Columns>
                        <asp:TemplateField>
                                <HeaderTemplate>
                                    View/Add Questions</HeaderTemplate>
                                <ItemTemplate>
                                 <asp:LinkButton ID="lnkBtnView" CssClass="main1" runat="server" OnClick="lnkBtnView_Click" Text="View/Add" ></asp:LinkButton>  
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblTemplateID" runat="server" Visible="false" Text='<%#Eval("PK_TemplateID") %>'></asp:Label>
                                    <asp:Label ID="lblRatingScaleID" runat="server" Visible="false" Text='<%#Eval("FK_RatingScaleID") %>'></asp:Label>
                                    <asp:Label ID="lblReviewPeriodID" runat="server" Visible="false" Text='<%#Eval("FK_ReviewPeriodID") %>'></asp:Label>
                                     <asp:Label ID="lblInstructions" runat="server" Visible="false" Text='<%#Eval("Instructions") %>'></asp:Label>                                     
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Period Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTemplateName" runat="server" Text='<%#Eval("Template_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                           
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    <asp:Label ID="lblStatus1" runat="server" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                </ItemTemplate>
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
                </td>
            </tr>
        </table>
    </fieldset>
    
    <fieldset id="fldQuestion" runat="server" visible="false">
    <div style="float:right">
    <asp:LinkButton ID="lnkBtnBack" CssClass="main" runat="server" Visible="false" OnClick="lnkBtnBack_Click" Text="Back" ></asp:LinkButton>  
    </div>
        <legend class="MainLegendStyle">Manage Questions:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
                        
            <tr >
                <td style="width: 12%;">
                    Question:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width: 85%;" colspan="4">
                    <asp:TextBox ID="txtQuestions" style="width:400px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                 
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" SetFocusOnError="true" ErrorMessage="Please Enter Question"
                            ControlToValidate="txtQuestions" ValidationGroup="valQuestion" Display="None"
                            runat="server"></asp:RequiredFieldValidator>
               
                </td>
            </tr>
            <tr>
                <td>
                    To be completed by:
                
                </td>
                <td>
                   
                </td>
                <td colspan="4">
                    <asp:RadioButtonList ID="rdlCompletedBy"  RepeatDirection="Horizontal" runat="server">                    
                        <asp:ListItem Value="0" Text="Employee" ></asp:ListItem>
                        <asp:ListItem Value="1" Text="Both (Employee & Employer)" Selected="True"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
              
            </tr>
         
            
            <tr>
                <td>
                    Status:
                </td>
                <td>
                </td>
                <td colspan="4">
                    <asp:DropDownList ID="ddlQuesStatus" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSaveQuestion" runat="server" OnClick="btnSaveQuestion_Click" Text="Save"
                        CssClass="btnStyle" ValidationGroup="valQuestion" />&nbsp;
                    <asp:Button ID="btnResetQues" runat="server" Text="Reset" OnClick="btnResetQues_Click" CssClass="btnStyle" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valQuestion" />
                    <br />
                    <asp:Label ID="lblQuesMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                    <br />
                    <asp:GridView ID="gvQuestions" runat="server" CssClass="gridViewStyle" Width="98%"
                        RowStyle-CssClass="rowStyle" AlternatingRowStyle-CssClass="alternateRow" HeaderStyle-CssClass="gvHeader"
                        AutoGenerateColumns="false" OnRowDataBound="gvQuestions_RowDataBound"
                        OnSelectedIndexChanging="gvQuestions_SelectedIndexChanging"  OnRowDeleting="gvQuestions_RowDeleting" >
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblQuesID" runat="server" Visible="false" Text='<%#Eval("PK_QuesID") %>'></asp:Label>                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Questions</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQues" runat="server" Text='<%#Eval("Questions") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                           
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    <asp:Label ID="lblStatus1" runat="server" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                </ItemTemplate>
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
                </td>
            </tr>
        </table>
    </fieldset>

    <asp:HiddenField ID="hdnTemplateID" runat="server" />
    <asp:HiddenField ID="hdnQuesID" runat="server" />
</asp:Content>

