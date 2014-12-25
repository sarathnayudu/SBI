<%@ Page Title="Send Email" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="SendMail.aspx.cs" Inherits="SendMail" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
<fieldset>
        <legend class="MainLegendStyle">Send Email to Employees:</legend>
    <table cellpadding="2" cellspacing="2" border="0">
     <tr>
             <td valign="top" width="50">Subject:</td>
            <td valign="top"><asp:TextBox ID="txtsubject" runat="server" CssClass="text"  name="txtsubject" Width="540"></asp:TextBox></td>
            </tr>
            <tr>
             <td valign="top" width="50">CC:</td>
            <td valign="top"><asp:TextBox ID="txtCC" runat="server" CssClass="text"  name="txtCC" Width="540"></asp:TextBox></td>
            </tr>
    <tr>
   
    <td colspan="2">
    <div>
    <FTB:FreeTextBox ID="FreeTextBox1"  Focus="true" SupportFolder="FreeTextBox/"
                                    JavaScriptLocation="ExternalFile" ButtonImagesLocation="ExternalFile" ToolbarImagesLocation="ExternalFile"
                                    ToolbarStyleConfiguration="OfficeXP" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,                                   

FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,

Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,

JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;

CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print,Save|SymbolsMenu,

StylesMenu,InsertHtmlMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;

InsertTableRowAfter,InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,

DeleteTableColumn|InsertForm,InsertTextBox,InsertTextArea,InsertRadioButton,

InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,

InsertImageFromGallery,Preview,SelectAll,WordClean,NetSpell"
runat="Server" GutterBackColor="red" DesignModeCss="designmode.css" ButtonSet="Office2000" />

    </div>
    <div>
			<asp:Literal id="Output" runat="server" />
	</div>
	<asp:Button  ID="btnSendMailEmp" runat="server" Text="Send Email to All Employees"  CssClass="btnStyle" style="width:280px;"
            onclick="btnSendMailEmp_Click"/>
            <br />
            <asp:Label ID="lblMsg" runat="server" Visible="false" CssClass="lblMsgStyle"></asp:Label>
	</td>
	<td valign="top" style="display:none;">
	    <table>
	        <tr>
	        <td valign="top">From Email:</td>
            <td valign="top"><asp:TextBox runat="server" ID="txtfromemail" name="txtfromemail" Width="250"></asp:TextBox></td>
            </tr>
            <tr>
             <td valign="top">To Email:</td>
            <td valign="top"><asp:TextBox ID="txttoemail" runat="server"  name="txttoemail" Width="250"></asp:TextBox></td>
            </tr>
            
            
             <tr>
             <td valign="top">GMail ID:</td>
            <td valign="top"><asp:TextBox ID="txtgmail" runat="server"  name="txtgmail" Width="250"></asp:TextBox></td>
            </tr>
             <tr>
             <td valign="top">GMail Pwd:</td>
           GMail Pwd:</td>
            <td valign="top"><asp:TextBox ID="txtgmailpwd" runat="server"  TextMode="Password" name="ToEmail" Width="250" ></asp:TextBox></td>
            </tr>
            
             <tr>
             
            <td colspan="3" valign="top">
            
            <asp:Button  ID="btnSendMail" runat="server" Text="Send Email Using GMAIL SMTP" 
                    onclick="btnSendMail_Click"/>
                    </td>
            </tr>
           
             <tr>
             <td valign="top">TimeWarnet ID</td><td><asp:TextBox ID="txttimewarner" runat="server"  name="txttimewarner" Width="250" Text=""></asp:TextBox></td>
            </tr>
             <tr>
             <td valign="top">TimeWarner Pwd:</td>
            <td valign="top"><asp:TextBox ID="txttimewarnerpwd" runat="server"  TextMode="Password" name="txttimewarnerpwd" Width="250" ></asp:TextBox></td>
            </tr>
            <tr>
             <td colspan="2" valign="top">
            
            <asp:Button  ID="btnTimeWarner" runat="server" Text="Send Email Using TimeWarner SMTP"/></td>
            </tr>
            </table>
            </td></tr>
        </table>
</fieldset>
</asp:Content>