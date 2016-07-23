<%@ Page Language="C#" MasterPageFile="~/filemaster.master" AutoEventWireup="true" CodeFile="ViewImages.aspx.cs" Inherits="createfolder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div style="margin-left:5%; width: 900px;">
       <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            &nbsp;<asp:Label ID="Label3" runat="server" CssClass="lableHeading" 
            Text="Select folder to view and manage"></asp:Label>
        <br />
        <br />
&nbsp;Select Subfolder : <asp:DropDownList ID="DrplSubfolder" runat="server" 
            onselectedindexchanged="DrplSubfolder_SelectedIndexChanged" 
            AppendDataBoundItems="True">
            <asp:ListItem Text="select subfolder" />
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnshowimages" runat="server" onclick="btnshowimages_Click" 
            Text="Show Images" CssClass="Button" ForeColor="White" Height="30px" 
            Width="121px" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/createfolder.aspx">Create 
        New Folder</asp:HyperLink>
        <br />
        &nbsp;<asp:Label ID="LblResult" runat="server"></asp:Label>
        <asp:Label ID="lblerror" runat="server"></asp:Label>
        <br />
&nbsp;
        <br />
&nbsp;
        <br />
&nbsp;
            
    <asp:Literal ID="listingtable" runat="server" Visible="true" />
        <br />
        
        
        
    </div>
    
   </asp:Content>

