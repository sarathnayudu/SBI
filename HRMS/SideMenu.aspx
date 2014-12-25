<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SideMenu.aspx.cs" Inherits="SideMenu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="SpryAssets/SpryAccordion.css" rel="stylesheet" type="text/css" />
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="background-color:#053346;">
    <form id="form1" runat="server">
    <div>
    <table align="left" valign="top" width="100%" cellpadding="0"  cellspacing="0" border="5">
				<tr  width="100%" valign="top">
					<td width="100%" valign="top" style="background-color:#084761;">
						<a href="#"><img src="testimages/monthleft.gif" id="imgResize" alt="Hide Menu" onClick="ToggleMenu();" width="14" height="13" border="0" hspace="0" vspace="0"></a>
					</td>
				</tr>
				<tr valign="top">
					<td valign="top">
						<span id="spnMenu" style="display:''">
							<table align="left" valign="top" width="100%" cellpadding="0" cellspacing="0" border="0">	
								<tr>
									<td width="100%" height="100%" valign="top">
									<table id="Table_01" width="100%"  border="0" height="660" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left" valign="top" >
                                        <div class="Accordion">
                                            <asp:Repeater ID="rptPages" runat="server" OnItemDataBound="rptPages_ItemDataBound">
                                            <HeaderTemplate>
                                            
                                            <div class="AccordionPanel" >
                                            <div class="AccordionPanelContent" >
                                           
                                            </HeaderTemplate>
                                                <ItemTemplate>
                                                 <asp:Panel ID="pnlHeading" Visible="false" runat="server"  class="AccordionPanelTab">
                                                        My Work Area</asp:Panel>
                                                <asp:Label ID="lblPageID" runat="server" Visible="false"  Text='<%#Eval("Pk_PageID")%>'></asp:Label>
                                                <asp:Panel ID="pnlTitle" runat="server">
                                                <a href='<%#Eval("Page_Path")%>?pid=<%#Eval("Pk_PageID")%>' class="sub-links" target="iFrContent"> 
                                                    <asp:Label ID="lblPageName" runat="server"  Text='<%#Eval("Page_Name")%>'></asp:Label>
                                                    </a>
                                                    </asp:Panel>
                                                    
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </div>
                                                </div>
                                                
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            
                                            </div>
                                           

                                        </td>
                                       
                                    </tr>
                                    
                                </table>
									<%--	
										<%	
											Dim strCurrentPath As String = Request.PhysicalPath
											Dim sXMLSourceFile As String = Left(strCurrentPath, InStrRev(strCurrentPath, "\")) & "menuitems.xml"
										    Dim iTotal2 As Integer
										    iTotal2 = DefineNode(Response, sXMLSourceFile, User, "BAMS_Admin")
										%>--%>
										<%--<script language="Javascript">--%>
											<!--										    //
										    // These two arrays work with each other to identify the menu element that should be hidden or made visible.  
										    // There is a one-to-one relationship between the rows of each array.
										    // Note: The value of the ASP variable iTotal used below represents the total number of items and subitems 
										    //       in the menu.  The value is set by reference in the DisplayNode() subroutine call
											
											//-->	
										<%--</script>--%>
										<%--<script src="Scripts/navigation.js"></script>--%>
									</td>
								</tr>
							</table>
						</span>
					</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
