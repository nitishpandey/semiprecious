<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="Thanks.aspx.cs" Inherits="PacketInformation_Thanks" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1" 
        style="border-style: solid; border-width: thin">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label8" runat="server" Text="Item ID  :"></asp:Label>
            </td>
            <td style="border: thin outset #C0C0C0" colspan="3">
                <asp:Label ID="LblItemID" runat="server"></asp:Label>
            &nbsp;
                <asp:HyperLink ID="HyplkView" runat="server">View</asp:HyperLink>
&nbsp;&nbsp;
                <asp:HyperLink ID="HyplnkEdit" runat="server">Edit</asp:HyperLink>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Quantity  :"></asp:Label>
            </td>
            <td style="border: thin outset #C0C0C0">
                <asp:Label ID="LblQunatity" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                &nbsp;
                </td>
            <td style="border: thin outset #C0C0C0">
                <asp:Label ID="LblTotalAddedQuantity" runat="server" Font-Bold="True" 
                    ForeColor="Maroon" Text="Remaining Qunatity :"></asp:Label>
            </td>
            <td style="border: thin outset #C0C0C0">
                <asp:Label ID="Lblremainintquantity" runat="server" ForeColor="#993300"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label10" runat="server" Text="Cost"></asp:Label>
            </td>
            <td style="border: thin outset #C0C0C0">
                <asp:Label ID="Label11" runat="server" Text="Rs. "></asp:Label>
                <asp:Label ID="lblCost" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;
                </td>
            <td style="border: thin outset #C0C0C0">
                <asp:Label ID="LblTotalRemainingCost" runat="server" Font-Bold="True" 
                    ForeColor="Maroon" Text="Remaining Cost :"></asp:Label>
            </td>
            <td style="border: thin outset #C0C0C0">
                <asp:Label ID="lblremainingCost" runat="server" ForeColor="#993300"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr style="border: thin solid #CCCCCC">
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Lblweight" runat="server" Text="Weight :"></asp:Label>
            </td>
            <td style="border: thin outset #CCCCCC">
                <asp:Label ID="Lblcurrentweight" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td style="border: thin outset #CCCCCC">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" ForeColor="#993300" 
                    Text="Remaining Weight :"></asp:Label>
            </td>
            <td style="border: thin outset #CCCCCC">
                <asp:Label ID="Lblremainingweight" runat="server" ForeColor="Maroon"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="4">
                <asp:Label ID="LblError" runat="server" CssClass="error_label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/PacketInformation/Iteminfo.aspx">Add another item</asp:HyperLink>
            </td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

