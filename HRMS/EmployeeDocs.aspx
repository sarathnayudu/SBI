<%@ Page Title="Employee Documents" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="EmployeeDocs.aspx.cs" Inherits="EmployeeDocs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Upload Documents:</legend>
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
                            Upload Documents:</div>
                    </td>
                </tr>
              <tr>
                <td style="width: 10%;">
                    Document Type:
                
                </td>
                <td>
                    <%--<span style="color: Red">*</span>--%>
                </td>
                <td style="width: 88%;" colspan="4">
                    <asp:DropDownList ID="ddlDocType" CssClass="ddl" runat="server">
                        <asp:ListItem Value="0" Text="HR Documents"></asp:ListItem>
                        <asp:ListItem Value="1" Text="My Benefits"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Educational Documents"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Company Notification"></asp:ListItem>
                    </asp:DropDownList>
                </td>
               <%-- <td colspan="3"></td>--%>
            </tr>  
            <tr class="trBorder">
                <td style="width: 160px;">
                    Document Title:
                </td>
                <td>
                   
                </td>
                <td colspan="4">
                    <div class="Outerdiv">
                        <asp:TextBox ID="txtDocTitle" CssClass="txtbox" runat="server"></asp:TextBox>
                    </div>
                </td>
                <%--<td colspan="3"></td>--%>
              
            </tr>
            <tr>
                <td>
                    Upload Document:
                </td>
                <td>
                    
                </td>
                <td colspan="4">
                    <asp:UpdatePanel ID="upPnlUpload" runat="server">
                    <Triggers>                        
                        <asp:PostBackTrigger ControlID="btnSaveDoc" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                </td>
                <%--<td>OR Save</td>
                <td colspan="2">
                
                <asp:GridView ID="gvFilesDirUploaded" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                        AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" 
                         > 
                        
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    File Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocTitle" runat="server"  Text='<%#Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                   Last Write Time</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocumentName" runat="server"  Text='<%#Eval("LastWriteTime","{0:d}") %>'></asp:Label>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    File Size</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocType" runat="server"  Text='<%#Eval("Length") %>'></asp:Label> bytes
                                    </ItemTemplate>
                            </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>
                
                </td>--%>
                
            </tr>

            <tr >
                <td>
                    Select Employee
                </td>
                <td>
                   
                </td>
                <td colspan="4">
                 <asp:DropDownList ID="ddlEmployee" CssClass="ddl" AppendDataBoundItems="true" runat="server">
                        
                    </asp:DropDownList>   
                </td>
                
              
            </tr>
            
            <tr>
                <td colspan="6" align="center">
                    <asp:Button ID="btnSaveDoc" runat="server" Text="Save" CssClass="btnStyle" 
                        ValidationGroup="valOrganizationRoles" onclick="btnSaveDoc_Click"
                        />&nbsp;
                    <asp:Button ID="btnResetDoc" runat="server" Text="Reset" CssClass="btnStyle" 
                        onclick="btnResetDoc_Click" />
                    <asp:ValidationSummary ID="valOrganization" runat="server" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="valOrganizationRoles" />
                        <br />
                        <asp:Label ID="lblMsg" CssClass="lblMsgStyle" Visible="false" runat="server"></asp:Label>
                        <br />
                        <asp:GridView ID="gvDocuments" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                        AlternatingRowStyle-CssClass="alternateRow"
                        HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" 
                         OnRowDataBound="gvDocuments_RowDataBound" OnSelectedIndexChanging="gvDocuments_SelectedIndexChanging" 
                        onrowdeleting="gvDocuments_RowDeleting" > 
                        
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblDocID" runat="server" Visible="false" Text='<%#Eval("DocID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Document Title</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocTitle" runat="server"  Text='<%#Eval("Doc_Title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Document Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocumentName" runat="server"  Text='<%#Eval("Doc_Path") %>'></asp:Label>
                                    <asp:HyperLink runat="server" ID="lnkPath" Text="Download" CssClass="main1" NavigateUrl='<%#Eval("Doc_Path") %>' Target="_blank">
                                                </asp:HyperLink> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Document Type</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocType" runat="server"  Text='<%#Eval("Doc_Type") %>'></asp:Label>
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
                    <br />

                    <asp:GridView ID="gvEmpDocuments" runat="server" CssClass="gridViewStyle" Width="98%" RowStyle-CssClass="rowStyle"
                        AlternatingRowStyle-CssClass="alternateRow" OnRowDataBound="gvEmpDocuments_RowDataBound" OnSelectedIndexChanging="gvEmpDocuments_SelectedIndexChanging" 
                        onrowdeleting="gvEmpDocuments_RowDeleting" HeaderStyle-CssClass="gvHeader" AutoGenerateColumns="false" > 
                        
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    S.NO</HeaderTemplate>
                                <ItemTemplate>
                                    <%#Container.DataItemIndex + 1%>
                                    <asp:Label ID="lblDocID" runat="server" Visible="false" Text='<%#Eval("DocID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Document Title</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocTitle" runat="server"  Text='<%#Eval("Doc_Title") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Document Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDocumentName" runat="server"  Text='<%#Eval("Doc_Path") %>'></asp:Label>
                                    <asp:HyperLink runat="server" ID="lnkPath" Text="Download" CssClass="main1" NavigateUrl='<%#Eval("Doc_Path") %>' Target="_blank">
                                                </asp:HyperLink> 
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Employee Name</HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpFName" runat="server"  Text='<%#Eval("Emp_Fname") %>'></asp:Label>
                                    <asp:Label ID="lblEmpLName" runat="server"  Text='<%#Eval("Emp_Lname") %>'></asp:Label>
                                    <asp:Label ID="lblEmpID" runat="server" Visible="false"  Text='<%#Eval("PK_Org_EmpID") %>'></asp:Label>
                                    </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField >
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
    <asp:HiddenField ID="hdnDocID" runat="server" />
    <asp:HiddenField ID="hdnAttach" runat="server" />
</asp:Content>