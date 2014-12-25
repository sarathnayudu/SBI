<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Welcome to Easy Business Solutions</title>
    <style type="text/css">
       body{
	margin:0px;
	padding:0px;
	background-image: url(images/loginbg.jpg);
	background-repeat: repeat-x;
	background-position: center top;
	background-color: #eaeaea;
}
.globe-bg {
	background-image: url(images/globe.jpg);
	background-repeat: no-repeat;
	background-position: right top;
}
.company-name{
	float:left;
	margin:45px auto 0px 0;
}
.company-name-style{
	font-family:Arial, Helvetica, sans-serif;
	font-size:26px;
	color:#0066b3;
	font-weight:bold;
	text-decoration:none;
}
.login-text {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
	color: #FFFFFF;
	text-decoration: none;
	text-transform: uppercase;
}

.form-content{
	float:left;
	margin:44px 0px 0px 107px;
	width:270px;
}
.form-text {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	text-transform: uppercase;
	color: #FFFFFF;
	text-decoration: none;
}
.input-form {
	background-image: url(images/input-form.jpg);
	background-repeat: no-repeat;
	height: 25px;
	width: 192px;
	margin: 0px;
	padding: 0px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: none;
	border-left-style: none;
}
.frgt-pw {
	font-family: Tahoma;
	font-size: 11px;
	color: #68a9d6;
	text-decoration: none;
}
.frgt-pw:hover {
	color: #9bdbff;
	text-decoration:underline;
}
.submit-btn {
	background-image:url(images/submit-btn.jpg);
	background-repeat: no-repeat;
	background-position: center center;
	width:77px;
	color:#FFFFFF;
	cursor:pointer;
	border:none;
	height:27px;
	font-family:Tahoma;
	font-size:11px;
	font-weight:bold;
}
.caption-text {
	font-family: Tahoma;
	font-size: 12px;
	font-weight: bold;
	color: #1f1f1f;
	text-decoration: none;
}
.poweredby{
	font-family: Tahoma;
	font-size: 12px;
	font-weight: bold;
	color: #1f1f1f;
	text-decoration: none;
}
.copyright {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #5b5b5b;
	text-decoration: none;
}

    </style>
    <link href="Styles/lightbox-form.css" rel="stylesheet" type="text/css" />

    <script src="Scripts/lightbox-form.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div id="divFilterPass" class="filterSmall">
    </div>
    <div id="divForgotPass" class="boxSmall">
        <span id="spnTitle" class="boxtitleSmall"></span>
        <table cellpadding="2" cellspacing="1" width="90%" border="0" align="center">
                    
            <tr>
                <td style="width: 110px;">
                    Email Id
                </td>
                <td>
                    <span class="mandatory">*</span></td>
                <td>
                    <asp:TextBox ID="txtEmailID" runat="server" CssClass="text" style="width:210px;">
                    </asp:TextBox>
                </td>
            </tr>
           
            <tr>
                <td colspan="3" align="center">
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="vgForgotPass"
                        SetFocusOnError="true" ErrorMessage="Please Enter Your E-Mail Id" ControlToValidate="txtEmailID"
                        Display="dynamic">
                    </asp:RequiredFieldValidator>
                    
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailID"
                        ValidationGroup="vgForgotPass" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Please Enter Valid Email ID"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                    
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center" style="padding-top: 20px;">
                    <asp:Button ID="btnForgotPass" CssClass="btnStyle" OnClick="btnForgotPass_CLick" ValidationGroup="vgForgotPass"
                        runat="server" Text="Submit"  />&nbsp;&nbsp;
                    <input type="button" class="btnStyle" name="cancel" value="Close" onclick="closebox('divForgotPass','divFilterPass')" /></td>
            </tr>
            <tr>
                <td colspan="3" align="center" style="padding-top: 20px;">
                    <asp:Label ID="lblMsgPass" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"><table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="145" align="center" valign="top"><table width="942" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="35" align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="top"><table width="942" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="70" align="left" valign="top"><img src="images/logo.gif" width="70" height="83" /></td>
                <td width="10" align="center" valign="middle">&nbsp;</td>
                <td width="441" align="left" valign="top">
					<div class="company-name">
						<div class="company-name-style">First Object, Inc.</div>
					</div>				</td>
                <td width="421" align="right" valign="bottom"><table width="100" border="0" align="right" cellpadding="0" cellspacing="0">
                  <tr>
                    <td align="right"><img src="images/hrms.jpg" width="73" height="17" /></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>


        </table></td>
      </tr>
      <tr>
        <td height="236" align="left" valign="top" class="globe-bg">
			<div class="form-content">
			  <table width="270" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td align="left" valign="top" class="login-text">Login</td>
                </tr>
                <tr>
                  <td align="left" valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td align="left" valign="top"><table width="270" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="78" align="left" valign="middle" class="form-text">User ID : </td>
                      <td width="192" align="right" valign="middle">
                      <asp:TextBox ID="txtUserID" CssClass="input-form"  runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ControlToValidate="txtUserID"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter User ID" Display="None" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                      
                      </td>
                    </tr>
                    <tr>
                      <td height="12" colspan="2" align="right" valign="middle"></td>
                      </tr>
                    <tr>
                      <td align="left" valign="middle" class="form-text">Password :</td>
                      <td align="right" valign="middle">
                      
                      <asp:TextBox ID="txtPassword" CssClass="input-form"  runat="server"
                                                        TextMode="Password"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Password" Display="None" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                                                    </td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="12" align="left" valign="top"></td>
                </tr>
                <tr>
                  <td align="right" valign="top"><a href="#" id="lnkForgotPass" onclick="openbox('Please enter the credentials', 2,'divForgotPass','divFilterPass','spnTitle')" class="frgt-pw">Forgot Password </a></td>
                </tr>
                <tr>
                  <td height="10" align="left" valign="top"></td>
                </tr>
                <tr>
                  <td align="left" valign="top"><table width="270" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="78" align="left" valign="middle" class="form-text">&nbsp;</td>
                      <td width="192" align="left" valign="middle"><table width="77" border="0" align="left" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="center" valign="middle">
                          
                          <asp:ImageButton ID="imgBtnLogin" runat="server" 
                                                        ImageUrl="images/submit-btn.jpg" onclick="imgBtnLogin_Click" ValidationGroup="valLogin" />
                                                        <asp:ValidationSummary ID="vsLogin" runat="server" ValidationGroup="valLogin" ShowMessageBox="true" ShowSummary="false" />
                          </td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
                <tr><td ><asp:Label ID="lblMsg" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></td></tr>
              </table>
			</div>		</td>
      </tr>
      <tr>
        <td height="25" align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top"><table width="942" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="top"><table width="495" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="158" align="left" valign="middle" class="caption-text">Empowering Employees</td>
                <td width="1" align="center" valign="middle"><img src="images/seperator.jpg" width="1" height="12" /></td>
                <td width="197" align="center" valign="middle" class="caption-text">Improving Communications</td>
                <td width="1" align="center" valign="middle"><img src="images/seperator.jpg" width="1" height="12" /></td>
                <td width="138" align="center" valign="middle" class="caption-text">Increasing Visibility</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="65" align="left" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" valign="top"><table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
              <tr>
                <td align="left" valign="middle" class="poweredby">Powered by:</td>
                <td align="right" valign="middle"><img src="images/easy-business-logo.jpg" width="159" height="27" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" valign="top" class="copyright">Copyright &copy; 2012, Easy Business Solutions</td>
      </tr>
    </table></td>
  </tr>
</table>

        <%--<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" valign="top">
                    <table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" valign="top">
                                <div style="background-image: url('images/loginbg.png'); background-repeat: no-repeat;
                                    width: 1000px; height: 650px;">
                                    <div style="padding: 250px 0px 0px 310px; text-align: left;">
                                        <table cellpadding="3" cellspacing="3" border="0">
                                        <tr>
                                        <td></td>
                                        <td >
                                        <asp:Label ID="lblLogin" runat="server" Text="Login" CssClass="lblStyle"></asp:Label>
                                        </td></tr>
                                            <tr>
                                                <td>
                                                    User ID :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtUserID" CssClass="text" Style="width: 280px;" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ControlToValidate="txtUserID"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter User ID" Display="None" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Password :
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPassword" CssClass="text" Style="width: 280px;" runat="server"
                                                        TextMode="Password"></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword"
                                                    SetFocusOnError="true" ErrorMessage="Please Enter Password" Display="None" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                   <%-- <asp:CheckBox ID="chkRemPass" runat="server" Text="Remember me." />--%>
                                                    <%--<span style="padding-left:220px;">
                                                    <a href="#" id="lnkForgotPass" onclick="openbox('Please enter the credentials', 2,'divForgotPass','divFilterPass','spnTitle')"
                                                        class="main">Forgot Password ?</a></span> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                 <asp:ImageButton ID="imgBtnLogin" runat="server" 
                                                        ImageUrl="~/images/loginbtn.png" onclick="imgBtnLogin_Click" ValidationGroup="valLogin" />
                                                        <asp:ValidationSummary ID="vsLogin" runat="server" ValidationGroup="valLogin" ShowMessageBox="true" ShowSummary="false" />
                                                        
                                                </td>
                                            </tr>
                                            <tr><td colspan="2"><asp:Label ID="lblMsg" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label></td></tr>
                                        </table>
                                    </div>
                                   <div style="color:#c4ddfb;padding-top:110px;">Copyright © 2007, Easy Business Solutions</div>  
                                </div>
                               
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>--%>
    </div>
    </form>
</body>
</html>
