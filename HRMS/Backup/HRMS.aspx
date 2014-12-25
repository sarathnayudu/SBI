<%@ Page Title="HRMS:Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true"
    CodeFile="HRMS.aspx.cs" Inherits="HRMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
   
   


    <table width="100%" border="0" align="left"  class="contentFrame1"  cellpadding="0" cellspacing="0">
        <tr>
            <td align="left" valign="top">

               
                            
                                        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr style="display:none;">
                                                <td height="28" align="left" valign="middle" class="head-bg">
                                                    <div class="orange-bg-head">
                                                        <asp:Label ID="lblEmp" Text="Employee Portal" runat="server"></asp:Label></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" valign="top">
                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td align="left" valign="top"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td height="1" colspan="3" bgcolor="#d7e7f5"><asp:Label ID="lblOrgName" Visible="false" runat="server"></asp:Label></td>
        </tr>
      <tr>
        <td width="1" bgcolor="#d7e7f5"></td>
        <td height="29" align="left" valign="middle" class="head-bg1" >
			<div class="keyfeatures-head">Key Features</div>		</td>
        <td width="1" bgcolor="#d7e7f5"></td>
      </tr>
      <tr>
        <td height="1" colspan="3" bgcolor="#d7e7f5"></td>
        </tr>
    </table></td>
  </tr>
  <tr>
    <td height="18" align="left" valign="top"></td>
  </tr>
  <tr>
    <td align="left" valign="top" style="padding-left:15px;"><table width="780" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="163" align="left" valign="top"><table width="163" border="0" align="left" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="top" class="keyfea-sub-title">Timesheet Info</td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="top"><img src="images/timesheet-icon.png" width="72" height="66" /></td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" valign="top" class="key-features-cont">Accurate tracking of the time is very vital for resource management and in the delivery of project/product services. <br />
              All employees must enter the time on a daily basis, which also gives you the option to enter the tasks describing the work you've performed. </td>
          </tr>
        </table></td>
        <td width="35" align="center" valign="top" class="icon-seperator">&nbsp;</td>
        <td width="170" align="center" valign="top"><table width="170" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="top" class="keyfea-sub-title">TimeOff Info</td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="top"><img src="images/time-off-icon.png" width="62" height="62" /></td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" valign="top" class="key-features-cont">Helps to manage vacation time accrual, holidays, sick or medical leave and other authorized time-off. Tracks project compliance including overtime pay, and paid/unpaid leave regulations. </td>
          </tr>
        </table></td>
        <td width="35" align="center" valign="top" class="icon-seperator">&nbsp;</td>
        <td width="162" align="center" valign="top"><table width="162" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="top" class="keyfea-sub-title">My Documents</td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="top"><img src="images/my-documents-icon.png" width="59" height="70" /></td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" valign="top" class="key-features-cont">In the my documents section employees have access to the HR related documents including I-9 &amp; W-4, view a summary of the Benefits , view payroll deposits, educational documents and important organizational notifications.</td>
          </tr>
        </table></td>
        <td width="32" align="center" valign="top" class="icon-seperator">&nbsp;</td>
        <td width="183" align="right" valign="top"><table width="183" border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center" valign="top" class="keyfea-sub-title">Profile Info</td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="center" valign="top"><img src="images/profile-icon.png" width="83" height="68" /></td>
          </tr>
          <tr>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td align="left" valign="top" class="key-features-cont">In this section employees can update their profile and contact information. It is very important for all the employees to update if there is any change in the contact information .<br />
              </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="1" align="left" valign="top" bgcolor="#d4dbe1"></td>
  </tr>
  <tr>
    <td height="10" align="left" valign="top"></td>
  </tr>
  <tr>
    <td align="left" valign="top" class="key-features-cont" style="padding-left:15px;">
    For any questions regarding the usage of employee portal, please free to call us at
              <asp:Label ID="lblBusPhone" runat="server"></asp:Label> or email us at
              <asp:Label ID="lblEmailID" runat="server"></asp:Label>
   </td>
  </tr>
</table>
                                                    <%--<table width="98%" border="0" align="center"  cellpadding="0"
                                                        cellspacing="0">
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top" class="content">
                                                                <span class="wel-heading">Welcome to
                                                                    <asp:Label ID="lblOrgName" runat="server"></asp:Label>
                                                                    Employee Portal<br />
                                                                    Empowering Employees, Improving Communications, Increasing Visibility</span><br />
                                                                <div style="padding-top: 10px;">
                                                                </div>                                                                
                                                                <div style="float:left;width:100%;">
                                                                <img src="images/hr-image1.gif" width="200" height="136" class="alignright" />
                                                                The employee self serve portal is designed to provide instant access to view/update
                                                                the employee profile. It also allows the employee to directly access HR, Payroll
                                                                and Benefits data - contact info, recent paychecks, W-2's.<br />
                                                                <div style="padding-top: 16px;">
                                                                </div>
                                                                <span class="key-features">Key Features:</span>
                                                                <div style="padding-top: 14px;">
                                                                </div>
                                                                <strong>Timesheet Info:</strong> Accurate tracking of the time is very vital for
                                                                resource management and in the delivery of project/product services.
                                                                
                                                                All employees must enter the time on a daily basis, which also gives you the option
                                                                to enter the tasks describing the work you've performed.
                                                               <br />
                                                                <img src="images/hr-image2.gif" width="200" height="136" class="alignright" />
                                                               <strong>TimeOff Info:</strong> Helps to manage vacation time accrual, holidays,
                                                                sick or medical leave and other authorized time-off. Tracks project compliance including
                                                                overtime pay, and paid/unpaid leave regulations.
                                                               
                                                                <br />
                                                                <strong>My Documents:</strong> In the my documents section employees have access
                                                                to the HR related documents including I-9 &amp; W-4,
                                                                view a summary of the Benefits , view payroll deposits, educational documents and
                                                                important organizational notifications.<br />
                                                                <strong>Profile Info:</strong> In this section employees can update thier profile
                                                                and contact information. It is very important for all the employees to update if
                                                                there is any change in the contact information .<br />
                                                                For any questions regarding the usage of employee portal, please free to call us
                                                                at <asp:Label ID="lblBusPhone" runat="server"></asp:Label>
                                                                    or email us at <asp:Label ID="lblEmailID" runat="server"></asp:Label>.
                                                                </div>
                                                               
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" valign="top">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>--%>
                                                </td>
                                            </tr>
                                        </table>
                                   
                        
                    
            </td>
        </tr>
    </table>
   
</asp:Content>