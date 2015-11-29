<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="LotInformation.aspx.cs" Inherits="PacketInformation_LotInformation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div >
    <table cellpadding="0" cellspacing="0" class="style1" style="border-color
    :#FFDCA8;border-style:solid;border-top-color:White;border-width:1px;">
        <tr>
            <td>
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="4" align="center">
                    <asp:Label ID="LblLotsInformation" runat="server" CssClass="lableHeading" 
                    Text="Lots Information" Font-Underline="False" ForeColor="#FF9900"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#CCCCCC" colspan="5">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                &nbsp;</td>
        </tr>
        <tr  style="height:40px">
            <td>
                &nbsp;</td>
            <td align="right" valign="top">
                <asp:Label ID="LblSupplierName" runat="server" Text="Supplier Name " 
                    CssClass="fontstyle" Font-Size="Small"></asp:Label>
                <asp:Label ID="Label26" runat="server" CssClass="semicolon" Font-Bold="True" 
                    Text=":"></asp:Label>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="DrplSupplierName" runat="server" 
                    AppendDataBoundItems="True">
                    <asp:ListItem Value="none">Select Supplier Code</asp:ListItem>
                </asp:DropDownList>
            &nbsp;<br />
&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RFVSupplierName" runat="server" 
                    ControlToValidate="DrplSupplierName" ErrorMessage="Required !"></asp:RequiredFieldValidator>
            </td>
            <td colspan="2">
                <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Underline="True" 
                    Text="As per ItemsInfo"></asp:Label>
                                    </td>
        </tr>
        <tr style="height:40px">
            <td>
                &nbsp;</td>
            <td align="right"  valign="top">
                <asp:Label ID="Label13" runat="server" Text="Total Quantity " 
                    CssClass="fontstyle" Font-Size="Small"></asp:Label>
                <asp:Label ID="Label25" runat="server" CssClass="semicolon" Font-Bold="True" 
                    Text=":"></asp:Label>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txttotalquantity" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RFVtotalquantity" runat="server" 
                    ControlToValidate="txttotalquantity" ErrorMessage="Required !"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" ControlToValidate="txttotalquantity" 
                    ErrorMessage="Only Integer !" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
            <td align="right">
                <asp:Label ID="Label17" runat="server" Text="Quantity  " CssClass="fontstyle" 
                    Font-Size="Small"></asp:Label>
                                    <asp:Label ID="Label27" runat="server" CssClass="semicolon" 
                    Font-Bold="True" Text=":"></asp:Label>
                                    </td>
            <td>
                <asp:TextBox ID="Txtquantity" runat="server" CssClass="textbox" 
                    ></asp:TextBox>
                                    </td>
        </tr>
        <tr style="height:40px">
            <td>
                &nbsp;</td>
            <td align="right"  valign="top">
                <asp:Label ID="LblTotalWeight" runat="server" Text="Total Weight " 
                    CssClass="fontstyle" Font-Size="Small"></asp:Label>
            &nbsp;<asp:Label ID="Label24" runat="server" CssClass="semicolon" Text=":"></asp:Label>
            </td>
            <td>
                &nbsp; &nbsp;
                <asp:TextBox ID="TxtTotalWeight" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="Rfvtotalweight" runat="server" 
                    ControlToValidate="TxtTotalWeight" ErrorMessage="Required !"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                    runat="server" ControlToValidate="TxtTotalWeight" 
                    ErrorMessage="Please enter only Numeric !" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
            <td align="right">
                <asp:Label ID="Label15" runat="server" Text="Weight " CssClass="fontstyle" 
                    Font-Size="Small"></asp:Label>
                                    &nbsp;<asp:Label ID="Label28" runat="server" 
                    CssClass="semicolon" Font-Size="Medium" Text=":"></asp:Label>
                                    </td>
            <td>
                <asp:TextBox ID="Txtweight" runat="server" CssClass="textbox"></asp:TextBox>
                                    </td>
        </tr>
        <tr style="height:40px">
            <td>
                &nbsp;</td>
            <td align="right"  valign="top">
                <asp:Label ID="Lbltotalamount" runat="server" Text="Total Amount" 
                    CssClass="fontstyle" Font-Size="Small"></asp:Label>
            &nbsp;<asp:Label ID="Label23" runat="server" CssClass="semicolon" Font-Bold="True" 
                    Text=":"></asp:Label>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Txttotalamount" runat="server" CssClass="textbox"></asp:TextBox>
            &nbsp;<br />
&nbsp; &nbsp;
                <asp:RequiredFieldValidator ID="RFVTotalamount" runat="server" 
                    ControlToValidate="Txttotalamount" ErrorMessage="Required !"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                    runat="server" ControlToValidate="Txttotalamount" 
                    ErrorMessage="Please enter only Rs. format !" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
            <td align="right">
                <asp:Label ID="Label16" runat="server" Text="Amount " CssClass="fontstyle" 
                    Font-Size="Small"></asp:Label>
                                    &nbsp;<asp:Label ID="Label29" runat="server" 
                    CssClass="semicolon" Text=":"></asp:Label>
                                    </td>
            <td>
                <asp:TextBox ID="TxtAmount" runat="server" CssClass="textbox"></asp:TextBox>
                                    </td>
        </tr>
        <tr style="height:40px">
            <td>
                &nbsp;</td>
            <td align="right" valign="top">
                <asp:Label ID="LblStatus" runat="server" Text="Status" CssClass="fontstyle" 
                    Font-Size="Small"></asp:Label>
&nbsp<asp:Label ID="Label22" runat="server" CssClass="semicolon" Font-Bold="True" Text=":"></asp:Label>
                
                </td>
            <td>
                &nbsp; &nbsp;
                <asp:DropDownList ID="DrplStatus" runat="server" AppendDataBoundItems="True" 
                    CssClass="textbox" Width="125px">
                    <asp:ListItem Value="none">Select Status</asp:ListItem>
                </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator 
                    ID="RFVStatus" runat="server" ControlToValidate="DrplStatus" 
                    ErrorMessage="Required !"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr style="height:40px">
            <td >
                &nbsp;</td>
            <td align="right" class="fontstyle" style="font-size: small">
                Date                 <asp:Label ID="Label21" runat="server" CssClass="semicolon" Font-Bold="True" 
                    Text=":"></asp:Label>
            </td>
            <td >
                &nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="Txtcurrentdate" runat="server" CssClass="textbox"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >
                </td>
            <td align="right" >
                <asp:Label ID="LblInvoiceNo" runat="server" Text="Invoice Number " 
                    CssClass="fontstyle" Font-Size="Small"></asp:Label>
                <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="#FF9933" 
                    Text=":" CssClass="semicolon"></asp:Label>
            </td>
            <td>
                &nbsp; &nbsp;
                <asp:TextBox ID="TxtInvoiceNumber" runat="server" CssClass="textbox"></asp:TextBox>
            </td>
            <td >
                </td>
            <td>
                </td>
        </tr>
        <tr style="height:40px">
            <td>
                &nbsp;</td>
            <td align="right" >
                <asp:Label ID="LblFileUpload" runat="server" Text="File Upload" 
                    CssClass="fontstyle" Font-Size="Small"></asp:Label>
                &nbsp;<asp:Label ID="Label19" runat="server" Font-Bold="True" Text=":" 
                    ForeColor="#FF9933" CssClass="semicolon"></asp:Label>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="textbox" />
&nbsp;
                </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr style="height:40px">
            <td>
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td>
                <asp:Label ID="Lbllotsstatus" runat="server" CssClass="error_label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr style="height:40px">
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td ">
                <asp:Button ID="Button1" runat="server" CssClass="Button" 
                    onclick="Button1_Click" Text="Submit" ForeColor="White" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" CssClass="Button" Text="Clear" 
                    ForeColor="White" onclick="Button2_Click" />
&nbsp;</td>
            <td >
                &nbsp;</td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
</asp:Content>

