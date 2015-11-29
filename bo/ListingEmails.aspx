<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="ListingEmails.aspx.cs" Inherits="ListingEmails" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/fileupload.aspx">Back 
    to File Upload</asp:HyperLink>
    <br />
    <asp:Literal ID="ltlemaillisting" runat="server"></asp:Literal>
    <br />
    <br />

</asp:Content>



