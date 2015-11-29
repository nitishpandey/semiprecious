<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="PacketInformation_Index" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style11
        {
            width: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="style1">
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td align="left" valign="top">
                <table cellspacing="1" class="style1" style="width: 18%">
                    <tr>
                        <td bgcolor="#FFCC00" rowspan="11" width="0.1px">
                            &nbsp;</td>
                        <td align="center" valign="middle">
                <asp:Label ID="Label3" runat="server" Text=" Menu for Items" Font-Bold="True" 
                                Font-Underline="True" ForeColor="#000066"></asp:Label>
                        </td>
                        <td rowspan="11" style="border: thin dashed #FF9900" width="2px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                            <asp:HyperLink ID="HypSupplier" runat="server" 
                                NavigateUrl="~/PacketInformation/SupplierInformation.aspx">Add Supplier</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td  
                
                            style=" border: thin dashed #FF9900; background-color: #FFFFFF; background-repeat: no-repeat;"  
                            height="0.5px">
                </td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                            <asp:HyperLink ID="HypLotInformation" runat="server" 
                                NavigateUrl="~/PacketInformation/LotInformation.aspx">Add Lot Information</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" ForeColor="#FF9900" 
                                Text="-----------------------------------------"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                            <asp:HyperLink ID="HypAddItems" runat="server" 
                                NavigateUrl="~/PacketInformation/Iteminfo.aspx">Add Items
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" ForeColor="#FF9900" 
                                Text="-----------------------------------------"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                            <asp:HyperLink ID="HypAllSupplier" runat="server" 
                                NavigateUrl="~/PacketInformation/AllSupplier.aspx">All Supplier</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" ForeColor="#FF9900" 
                                Text="-----------------------------------------"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">
                            <asp:HyperLink ID="HypAllLotsInformation" runat="server" 
                                NavigateUrl="~/PacketInformation/PackGrid.aspx">All Lots Information</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td  style=" border: thin dashed #FF9900; background-color: #FFFFFF; background-repeat: no-repeat;"  
                            height="0.5px"></td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

