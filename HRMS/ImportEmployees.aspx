<%@ Page Title="Import Employees" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ImportEmployees.aspx.cs" Inherits="ImportEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Import Employees Data:</legend>
        <table border="0" cellpadding="3" cellspacing="3" class="tblStyle FormStyle" width="100%">
            
            <tr class="trBg">
            <td >
            <div style="float:left;">
                     Import Details:</div>
            </td>
            </tr>
             
             <tr>
             <td>
             <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            
                        
                         <tr>
            <td style="width:250px;">Upload Employee Data(Excel File):</td>
           
            <td >
                <asp:UpdatePanel ID="upPnlUpload" runat="server">
                    <Triggers>                        
                        <asp:PostBackTrigger ControlID="btnDbImportEmp" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td></tr>
                                            
                                            <tr>
                                                <td align="left" colspan="2">
                                                <asp:Button ID="btnDbImportEmp" CssClass="btnStyle" style="width:150px;" runat="server" Text="Import Employees Data"
                                                        ValidationGroup="valDatabase" onclick="btnDbImportEmp_Click" />
                                                 
                                                        
                                                </td>
                                            </tr>
                                            <tr><td colspan="2"><asp:Label ID="lblMsg" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></td></tr>
                                        </table>
                                   
                               
                           
                </td>
            </tr>
        </table>
       
    </fieldset> 
</asp:Content>