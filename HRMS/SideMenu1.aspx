<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="BACKGROUND-IMAGE: url(testimages/nav_bg.gif); BACKGROUND-REPEAT: repeat-y;">
    <form id="form1" runat="server">
    <div>
    <table align="left" valign="top" width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr bgcolor="#0066CC" width="100%" valign="top">
					<td bgcolor="#0066CC" width="100%" valign="top" background="testimages/navsrch_bg.gif">
						<a href="#"><img src="testimages/monthleft.gif" id="imgResize" alt="Hide Menu" onClick="ToggleMenu();" width="14" height="13" border="0" hspace="0" vspace="0"></a>
					</td>
				</tr>
				<tr valign="top">
					<td valign="top">
						<span id="spnMenu" style="display:''">
							<table align="left" valign="top" width="100%" cellpadding="0" cellspacing="0" border="0">	
								<tr>
									<td width="100%" height="100%" valign="top">
									
									<%--	
										<%	
											Dim strCurrentPath As String = Request.PhysicalPath
											Dim sXMLSourceFile As String = Left(strCurrentPath, InStrRev(strCurrentPath, "\")) & "menuitems.xml"
										    Dim iTotal2 As Integer
										    iTotal2 = DefineNode(Response, sXMLSourceFile, User, "BAMS_Admin")
										%>--%>
										<script language="Javascript">
											<!--										    //
										    // These two arrays work with each other to identify the menu element that should be hidden or made visible.  
										    // There is a one-to-one relationship between the rows of each array.
										    // Note: The value of the ASP variable iTotal used below represents the total number of items and subitems 
										    //       in the menu.  The value is set by reference in the DisplayNode() subroutine call
											
											//-->	
										</script>
										<script src="Scripts/navigation.js"></script>
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
