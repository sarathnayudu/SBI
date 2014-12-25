<%@ Page Title="Manage Rating Scales" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="RatingScales.aspx.cs" Inherits="RatingScales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

 <fieldset>
        <legend class="MainLegendStyle">Manage Rating Scales:</legend>
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
                            Rating Scale:</div>
                    </td>
                </tr>
            <tr class="trBorder">
                <td style="width:12%;">
                    Rating Scale Name:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td style="width:85%;" colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtRatingScaleName" CssClass="txtbox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvRatingScale" SetFocusOnError="true"
                        ErrorMessage="Please Enter Rating Scale" ControlToValidate="txtRatingScaleName"
                        ValidationGroup="valRating" Display="None" runat="server"></asp:RequiredFieldValidator>
                    </div>
                </td >               
              
            </tr>
           <tr>
                <td>
                    Selection Type:
                
                </td>
                <td>
                   
                </td>
                <td colspan="4">
                    <asp:RadioButtonList ID="rdlSelectionType"  RepeatDirection="Horizontal" runat="server">                    
                        <asp:ListItem Value="1" Text="RadioButtons" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Checkboxes"></asp:ListItem>
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
                    <asp:DropDownList ID="ddlStatus" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
              
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSaveRatScale" runat="server" Text="Save" CssClass="btnStyle" OnClick="btnSaveRatScale_Click" ValidationGroup="valRating"
                         />&nbsp;
                    <asp:Button ID="btnResetRatScale" runat="server" Text="Reset" OnClick="btnResetRatScale_Click" CssClass="btnStyle"  />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valRating" />
                        <br />
                        <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                       <br />
                        </td>
            </tr>
           
            
        </table>
                       <asp:GridView ID="gvRatingScales" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                         AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false"  OnRowDataBound="gvRatingScales_RowDataBound"
                        OnSelectedIndexChanging="gvRatingScales_SelectedIndexChanging"
                        OnRowDeleting="gvRatingScales_RowDeleting"> 
                        
                        <Columns>
                        <asp:TemplateField>
                                <HeaderTemplate>
                                    View/Add Titles</HeaderTemplate>
                                <ItemTemplate>
                                 <asp:LinkButton ID="lnkBtnView" CssClass="main1" runat="server" OnClick="lnkBtnView_Click" Text="View/Add" ></asp:LinkButton>  
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblRatingScaleID" runat="server" Visible="false" Text='<%#Eval("PK_RatingScaleID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Rating Scale</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRatingScale" runat="server"  Text='<%#Eval("Rating_Scale") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Single Selection</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSingleSel" runat="server"  Text='<%#Eval("Single_Selection") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    <asp:Label ID="lblStatus1" runat="server"  Text='<%#Eval("ActiveFlag") %>'></asp:Label>
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
               
    </fieldset>

    <fieldset id="fldRatingScale" runat="server" visible="false">
        <legend class="MainLegendStyle">Manage Rating Scale Title:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
         <tr>
                <td>
                    Rating Title:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtRatingTitle" CssClass="txtbox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOrgRoleDesc" ControlToValidate="txtRatingTitle"
                        SetFocusOnError="true" ErrorMessage="Please Enter Rating Title"
                        ValidationGroup="valRatingTitle" Display="None" runat="server"></asp:RequiredFieldValidator>
                    </div>
                </td>
                
                
            </tr>
            <tr>
                <td>
                    Rating Order:
                </td>
                <td>
                    <span style="color: Red">*</span>
                </td>
                <td colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtRatOrder" CssClass="txtbox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtRatOrder"
                        SetFocusOnError="true" ErrorMessage="Please Enter The Ratings Order"
                        ValidationGroup="valRatingTitle" Display="None" runat="server"></asp:RequiredFieldValidator>
                    </div>
                </td>
                
                
            </tr>

            <tr>
                <td>
                    Description:
                </td>
                <td>
                   
                </td>
                <td colspan="4">
                        <asp:TextBox ID="txtDescription" style="width:300px;" CssClass="txtMultiline" TextMode="MultiLine"  runat="server"></asp:TextBox>                                           
                </td>
            </tr>
             <tr>
                <td>
                    Status:
                
                </td>
                <td>
                   
                </td>
                <td colspan="4">
                    <asp:DropDownList ID="ddlRatScaleTitStat" CssClass="ddl" runat="server">
                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                        <asp:ListItem Value="0" Text="Inactive"></asp:ListItem>
                    </asp:DropDownList>
                </td>
              
            </tr>
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSaveRatSclTit" runat="server" Text="Save" CssClass="btnStyle" OnClick="btnSaveRatSclTit_Click" ValidationGroup="valRatingTitle"
                         />&nbsp;
                    <asp:Button ID="btnResetRatSclTit" runat="server" Text="Reset" OnClick="btnResetRatSclTit_Click" CssClass="btnStyle"  />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valRatingTitle" />
                        <br />
                        <asp:Label ID="lblMsgRatScaleTit" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                       <br />
                        </td>
            </tr>
            </table>
                       <asp:GridView ID="gvRatingScaleTitle" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                         AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false"  OnRowDataBound="gvRatingScaleTitle_RowDataBound"
                        OnSelectedIndexChanging="gvRatingScaleTitle_SelectedIndexChanging"
                        OnRowDeleting="gvRatingScaleTitle_RowDeleting"> 
                        
                        <Columns>
                        
                            <asp:TemplateField Visible="false">
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblRatingScaleTitleID" runat="server" Visible="false" Text='<%#Eval("PK_RatingScaleTitleID") %>'></asp:Label>
                                     <asp:Label ID="lblDescription" runat="server" Visible="false" Text='<%#Eval("Description") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Title</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTitle" runat="server"  Text='<%#Eval("Title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Rating Order</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRatingOrder" runat="server"  Text='<%#Eval("Rating_Order") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Status</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Visible="false" Text='<%#Eval("ActiveFlag") %>'></asp:Label>
                                    <asp:Label ID="lblStatus1" runat="server"  Text='<%#Eval("ActiveFlag") %>'></asp:Label>
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
               
            </fieldset>

    <asp:HiddenField ID="hdnRatingScaleID" runat="server" />
     <asp:HiddenField ID="hdnRatingScaleTitleID" runat="server" />

</asp:Content>

