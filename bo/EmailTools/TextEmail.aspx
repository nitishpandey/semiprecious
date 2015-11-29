<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="TextEmail.aspx.cs" Inherits="Email_TextEmail" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
     <asp:ScriptManager ID="ScriptManager1" runat="server">
     </asp:ScriptManager>
     
     <table style="width:100%">
     <tr>
     <td colspan="2">
         &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" 
             NavigateUrl="~/EmailTools/MessageListing.aspx">Email Content Listing</asp:HyperLink>
         &nbsp;
         <asp:HyperLink ID="HyperLink4" runat="server" 
             NavigateUrl="~/EmailTools/Emailformat.aspx">Create HTML format</asp:HyperLink>
         </td>
     <td>&nbsp;</td>
     </tr>
     <tr>
     <td colspan="2">
         &nbsp;</td>
     <td>&nbsp;</td>
     </tr>
     <tr>
     <td>
         <asp:Label ID="Lblfilename" runat="server">File Name</asp:Label>
         </td>
     <td>
         <asp:TextBox ID="Txtfilename" runat="server" CssClass="textbox"></asp:TextBox>
         &nbsp;
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
             ControlToValidate="Txtfilename" ErrorMessage="Required !"></asp:RequiredFieldValidator>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </td>
     <td></td>
     </tr>
     <tr>
     <td>
         <asp:Label ID="Label3" runat="server" Text="Over Write Existing File"></asp:Label>
         </td>
     <td>
         <asp:CheckBox ID="Chkfilemessage" runat="server" Font-Bold="False" 
             TextAlign="Left" />
         </td>
     <td>&nbsp;</td>
     </tr>
     <tr>
     <td valign="top">
         <asp:Label ID="LblFileContent" runat="server" Text="File Content"></asp:Label>
         </td>
     <td>
         <asp:TextBox ID="TxtMessage" runat="server" CssClass="txtdetails" 
             Height="118px" TextMode="MultiLine"></asp:TextBox>
         &nbsp;&nbsp;
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
             ControlToValidate="TxtMessage" ErrorMessage="Required !"></asp:RequiredFieldValidator>
         </td>
     <td></td>
     </tr>
     <tr>
     <td>&nbsp;</td>
     <td>
         <asp:Label ID="lblerror" runat="server" CssClass="error_label"></asp:Label>
         </td>
     <td>&nbsp;</td>
     </tr>
     <tr>
     <td></td>
     <td>
         <asp:Button ID="Button1" runat="server" CssClass="Button" ForeColor="White" 
             onclick="Button1_Click" Text="Submit" />
&nbsp;&nbsp;
         <asp:Button ID="Button2" runat="server" CssClass="Button" ForeColor="White" 
             onclick="Button2_Click" Text="Clear" CausesValidation="False" />
         &nbsp;&nbsp;
         </td>
     <td></td>
     </tr>
     <tr>
     <td></td>
     <td>
         &nbsp;</td>
     <td></td>
     </tr>
     </table>
  </div>
</asp:Content>

