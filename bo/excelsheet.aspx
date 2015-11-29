<%@ Page Language="C#" AutoEventWireup="true" CodeFile="excelsheet.aspx.cs" Inherits="excelsheet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        #form1
        {
            height: 177px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:GridView ID="Grdexcel" runat="server" BackColor="White" 
        BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
        GridLines="Horizontal" onrowupdated="Grdexcel_RowUpdated" 
        onrowupdating="Grdexcel_RowUpdating">
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" />
    </form>
</body>
</html>
