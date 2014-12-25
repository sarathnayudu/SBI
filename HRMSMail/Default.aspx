<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="IBSMail._Default" validaterequest="false"%>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
 <form id="form1" runat="server">
<table><tr>
   
    <td>
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
	</td>
	<td valign="top">
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
             <td valign="top">Subject:</td>
            <td valign="top"><asp:TextBox ID="txtsubject" runat="server"  name="txtsubject" Width="250"></asp:TextBox></td>
            </tr>
            
             <tr>
             <td valign="top">GMail ID:</td>
            <td valign="top"><asp:TextBox ID="txtgmail" runat="server"  name="txtgmail" Width="250"></asp:TextBox></td>
            </tr>
             <tr>
             <td valign="top">GMail Pwd:</td>
            <td valign="top"><asp:TextBox ID="txtgmailpwd" runat="server"  TextMode="Password" name="ToEmail" Width="250" ></asp:TextBox></td>
            </tr>
            
             <tr>
             
            <td colspan="2" valign="top">
            
            <asp:Button  ID="btnSendMail" runat="server" Text="Send Email Using GMAIL SMTP"/>
            </tr>
            <tr>
            <td>&nbsp;</td>
            </tr>
             <tr>
             <td valign="top">TimeWarnet ID:</td>
            <td valign="top"><asp:TextBox ID="txttimewarner" runat="server"  name="txttimewarner" Width="250" Text=""></asp:TextBox></td>
            </tr>
             <tr>
             <td valign="top">TimeWarner Pwd:</td>
            <td valign="top"><asp:TextBox ID="txttimewarnerpwd" runat="server"  TextMode="Password" name="txttimewarnerpwd" Width="250" ></asp:TextBox></td>
            </tr>
             <td colspan="2" valign="top">
            
            <asp:Button  ID="btnTimeWarner" runat="server" Text="Send Email Using TimeWarner SMTP"/>
            </tr>
        </table>
    </td>
    </tr>
    </table>
    </form>
</body>
</html>
