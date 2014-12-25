<%@ Page Title="My Documents" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MyDocuments.aspx.cs" Inherits="MyDocuments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="Styles/Scrollablestyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="Scripts/scrolltable.js"></script>
<script type="text/javascript" language="javascript">

    $(document).ready(function () {
        /* zebra stripe the tables (not necessary for scrolling) */
        var tbl = $("table.tbl1");
        addZebraStripe(tbl);
        addMouseOver(tbl);

        /* make the table scrollable with a fixed header */
        $("table.scroll").createScrollableTable({
            width: '775px',
            height: '200px'
        });
    });

    function addZebraStripe(table) {
        table.find("tbody tr:odd").addClass("alt");
    }

    function addMouseOver(table) {
        table.find("tbody tr").hover(
                    function () {
                        $(this).addClass("over");
                    },
                    function () {
                        $(this).removeClass("over");
                    }
                );
    }

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    
     <fieldset style="width:800px;">
        <legend class="MainLegendStyle">My Documents:</legend>
        
        <div style="margin-top: 10px;width:800px;">
        
        <table border="0"  cellpadding="3" width="100%" cellspacing="3">
             <tr>
             <td valign="top" style="width:400px;height:150px;" >
            
                <table border="0" class="tblStyle FormStyle" style="height:160px;background-color:#ffffff;" cellpadding="3" width="100%" cellspacing="3">
                   
                    <tr class="trBg1">
                        <td >
                            <div style="float: left;">
                                HR Documents:</div>
                        </td>
                    </tr>
                     <tr>
                     <td style="padding:10px 10px 10px 10px;">
                     <div style="float:left;width:30%;">
                     <img src="images/procedures.jpg" width="122" height="106" />
                     </div>
                     <div style="float:left;width:70%;">
                         <asp:Repeater ID="rptHRDoc" runat="server" >
                             <HeaderTemplate>
                                 
                             </HeaderTemplate>
                             <ItemTemplate>
                               <table border="0"  cellpadding="0" width="100%" align="right" cellspacing="0">
                      <tr>
                      <td colspan="6" class="tdBg">
                        <img src="images/orange-star.jpg" />
                        <asp:HyperLink ID="lnkDoc" runat="server" Text='<%#Eval("Doc_Title")%>' NavigateUrl='<%#Eval("Doc_Path")%>' Target="_blank" CssClass="main1"></asp:HyperLink>
                        
                        </td>
                      </tr>
                     
                   
                      </table>
                             </ItemTemplate>
                             <FooterTemplate>
                                
                             </FooterTemplate>
                         </asp:Repeater>
                      
                      </div>
                     </td>
                        
                       
                    </tr>
                    
                    </table>
                    </td>
               <td valign="top" style="width:400px;height:150px;">
                    <table border="0" class="tblStyle FormStyle" style="height:160px;background-color:#ffffff;" cellpadding="3" width="100%" cellspacing="3">
                   
                    <tr class="trBg1">
                        <td >
                            <div style="float: left;">
                                My Benefits:</div>
                        </td>
                    </tr>
                     <tr>
                     <td style="padding:10px 10px 10px 10px;">
                     <div style="float:left;width:30%">
                     <img src="images/my-work.jpg" />
                     </div>
                     <div style="float:left;width:70%;">
                      <asp:Repeater ID="rptBenefits" runat="server"  >
                             <HeaderTemplate>
                                 
                             </HeaderTemplate>
                             <ItemTemplate>
                               <table border="0"  cellpadding="0" width="100%" align="right" cellspacing="0">
                      <tr>
                      <td colspan="6" class="tdBg">
                        <img src="images/orange-star.jpg" />
                        <asp:HyperLink ID="lnkDoc" runat="server" Text='<%#Eval("Doc_Title")%>' NavigateUrl='<%#Eval("Doc_Path")%>' Target="_blank" CssClass="main1"></asp:HyperLink>
                        
                        </td>
                      </tr>
                     
                   
                      </table>
                             </ItemTemplate>
                             <FooterTemplate>
                                
                             </FooterTemplate>
                         </asp:Repeater>
                      </div>
                     </td>
              
              </tr></table></td></tr>
              
             <tr>
             <td valign="top">
                    <table border="0" class="tblStyle FormStyle" style="height:160px;background-color:#ffffff;" cellpadding="3" width="100%" cellspacing="3">
                   
                    <tr class="trBg1">
                        <td >
                            <div style="float: left;">
                                Educational Documents:</div>
                        </td>
                    </tr>
                     <tr>
                     <td style="padding:10px 10px 10px 10px;">
                     <div style="float:left;width:30%">
                     <img src="images/my-educational-services.jpg" width="99" height="72" />
                     </div>
                     <div style="float:left;width:70%;">
                      <asp:Repeater ID="rptEduDoc" runat="server" >
                             <HeaderTemplate>
                                 
                             </HeaderTemplate>
                             <ItemTemplate>
                               <table border="0"  cellpadding="0" width="100%" align="right" cellspacing="0">
                      <tr>
                      <td colspan="6" class="tdBg">
                        <img src="images/orange-star.jpg" />
                        <asp:HyperLink ID="lnkDoc" runat="server" Text='<%#Eval("Doc_Title")%>' NavigateUrl='<%#Eval("Doc_Path")%>' Target="_blank" CssClass="main1"></asp:HyperLink>
                        
                        </td>
                      </tr>
                     
                   
                      </table>
                             </ItemTemplate>
                             <FooterTemplate>
                                
                             </FooterTemplate>
                         </asp:Repeater>
                      </div>
                     </td>
                        
                       
                    </tr>
                    
                    </table>
                    
                    </td>
                    <td>
                    <table border="0" class="tblStyle FormStyle" style="height:160px;background-color:#ffffff;" cellpadding="3" width="100%" cellspacing="3">
                   
                    <tr class="trBg1">
                        <td >
                            <div style="float: left;">
                               Company Notification:</div>
                        </td>
                    </tr>
                     <tr>
                     <td style="padding:10px 10px 10px 10px;">
                     <div style="float:left;width:30%">
                     <img src="images/my-benefits.jpg" style="width:89px;height:89px;" />
                     </div>
                     <div style="float:left;width:70%;">
                      <asp:Repeater ID="rptCompNot" runat="server" >
                             <HeaderTemplate>
                                 
                             </HeaderTemplate>
                             <ItemTemplate>
                               <table border="0"  cellpadding="0" width="100%" align="right" cellspacing="0">
                      <tr>
                      <td colspan="6" class="tdBg">
                        <img src="images/orange-star.jpg" />
                        <asp:HyperLink ID="lnkDoc" runat="server" Text='<%#Eval("Doc_Title")%>' NavigateUrl='<%#Eval("Doc_Path")%>' Target="_blank" CssClass="main1"></asp:HyperLink>
                        
                        </td>
                      </tr>
                     
                   
                      </table>
                             </ItemTemplate>
                             <FooterTemplate>
                                
                             </FooterTemplate>
                         </asp:Repeater>
                      </div>
                     </td>
                        
                       
                    </tr>
                    
                    </table>
                    
                    </td>
                    </tr>  
                    <tr>
                    <td colspan="2">
                    <table border="0" class="tblStyle FormStyle" style="height:160px;background-color:#ffffff;" cellpadding="3" width="100%" cellspacing="3">
                   
                    <tr class="trBg1" >
                        <td >
                            <div style="float: left;">
                               Employee Documents:</div>
                        </td>
                    </tr>
                     <tr>
                     <td style="padding:10px 10px 10px 10px;">
                     <%--<div style="float:left;width:12%">
                     <img src="images/my-benefits.jpg" style="width:89px;height:89px;" />
                     </div>--%>
                     <div style="float:left;width:88%;">
                      <asp:Repeater ID="rptEmployeeDocs" runat="server" OnItemDataBound="rptEmployeeDocs_ItemDataBound">
                             <HeaderTemplate>
                              <table class="tbl1 scroll"  >
                              <thead>
                    <tr>
                        <th>Document</th>
                        <th>Date</th>
                        
                    </tr>  </thead>
                             </HeaderTemplate>
                             <ItemTemplate>
                              
                      <tr>
                      <td >
                        
                        <asp:HyperLink ID="lnkDoc" runat="server" Text='<%#Eval("name")%>' NavigateUrl='<%#Eval("name")%>' Target="_blank" CssClass="main1"></asp:HyperLink>
                        
                        </td>
                        <td> <asp:Label ID="lblDocumentName" runat="server"  Text='<%#Eval("LastWriteTime") %>'></asp:Label></td>
                      </tr>
                     
                   
                      
                             </ItemTemplate>
                             <FooterTemplate>
                                </table>
                             </FooterTemplate>
                         </asp:Repeater>
                      </div>
                     </td>
                        
                       
                    </tr>
                    
                    </table>
                    
                    </td>
                    </tr>
              </table>
        
             
                    </div>

                    
                    </fieldset>


                    
</asp:Content>