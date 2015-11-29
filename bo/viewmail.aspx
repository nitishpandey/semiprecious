<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewmail.aspx.cs" Inherits="viewmail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table style="margin-left:10%;margin-right:10%">
     <tr>
     <td colspan="4" align="center" style="vertical-align:middle;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" 
             ForeColor="#0033CC" Text="Email Contents"></asp:Label>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" 
             ForeColor="#0033CC" NavigateUrl="/tm-tm/login.cfm">Log Out
         </asp:HyperLink>
&nbsp;&nbsp;
         <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="#0033CC" 
             Text="Logged In :"></asp:Label>
&nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="#0033CC"></asp:Label>
&nbsp;</td>
     
     </tr>
     <tr>
     <td colspan="4">
         <asp:HyperLink ID="HyperLink1" runat="server" 
             NavigateUrl="~/ListingEmails.aspx" Font-Bold="True" Font-Italic="False" 
             Font-Names="Shruti" ForeColor="#0066FF">Back to view listing</asp:HyperLink>
         </td>
     
     </tr>
     <tr>
     <td>&nbsp;</td>
     <td><asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
     <td></td>
     <td></td>
     </tr>
     <tr>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
    
     </tr>
     
     </table>
        
    
    </div>
    
    </form>
</body>
</html>
