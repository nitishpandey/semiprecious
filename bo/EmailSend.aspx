<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmailSend.aspx.cs" Inherits="EmailSend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;
        <asp:Label ID="Label1" runat="server" BackColor="#CCCCCC" Font-Bold="True" 
            Font-Names="Tahoma" Text="All information of cities"></asp:Label>
        <br />
&nbsp;<br />
&nbsp;<asp:GridView ID="GrdExccel" runat="server" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical">
            <FooterStyle BackColor="#CCCC99" />
            <RowStyle BackColor="#F7F7DE" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="White" 
            BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" 
            GridLines="None">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        </asp:GridView>
        <br />
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
