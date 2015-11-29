<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="MOO_Menu" Title="Welcome To MOO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td colspan="4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                    Font-Names="Berlin Sans FB" Font-Size="Large" ForeColor="#993300" 
                    Text="Menu for Items"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="Hyplnknew" runat="server" 
                    NavigateUrl="~/MOO/modlist.cfm">Pending Items</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyplnkWIP" runat="server" 
                    NavigateUrl="~/MOO/WIPSupplierModlist.cfm">Work in Progress Items</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyplnkShipped" runat="server" 
                    NavigateUrl="~/MOO/ShippedSuppliermodlist.cfm">Shipped items</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
		<tr>
            <td>
                <asp:HyperLink ID="HyplnkRefunded" runat="server" 
                    NavigateUrl="~/MOO/refundeditems.cfm">Refunded Items</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/MOO/ShippedItems.cfm">Shipped Items (Open this list to Mark Items as Received)</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyplnkReceivedModlist" runat="server" 
                    NavigateUrl="~/MOO/ReceivedModlist.cfm">Received Items (Open this list to Mark Items as Shipped to Customer) </asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyplnkCustomerModlist" runat="server" 
                    NavigateUrl="~/MOO/CustomerModlist.cfm">Item delivered to customers (MOO Items Completed So Far)</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="HyplnkPendinglist" runat="server" 
                    NavigateUrl="~/MOO/PendingCartItem.cfm">Pending moo items</asp:HyperLink>
            &nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:HyperLink ID="hypladdsupplieritems" runat="server" 
                    NavigateUrl="~/MOO/additemtomoo.cfm">Add item or update change supplier</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

