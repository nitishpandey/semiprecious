<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="SupplierInformation.aspx.cs" Inherits="PacketInformation_SupplierInformation" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style11
        {
            width: 370px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1" style="height: 376px">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2" rowspan="3" valign="top">
                <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td align="right">
                            <asp:Label ID="Label11" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="Requird Fields" Font-Bold="True" 
                                ForeColor="#FF3300"></asp:Label>
                        </td>
                        <td align="left" class="style11" valign="top">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label13" runat="server" CssClass="lableHeading" 
                                Text="Supplier Information "></asp:Label>
                        &nbsp;
&nbsp;</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
                            &nbsp;</td>
                    </tr>
                    <tr bgcolor="#E2E2E2">
                        <td align="right"  colspan="3" height="2px">
                            </td>
                    </tr>
                    <tr class="Supplier_Height">
                        <td align="right">
                            <asp:Label ID="Label8" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
&nbsp;
                            <asp:Label ID="LblSuppliercode" runat="server" Text="Supplier Code :"></asp:Label>
                        </td>
                        <td class="style11">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtSupplierCode" runat="server" CssClass="textbox"></asp:TextBox>
                        &nbsp;(3 letters. Ex: SHA)</td>
                        <td>
                            <asp:RequiredFieldValidator ID="RfvSupplierCode" runat="server" 
                                ControlToValidate="TxtSupplierCode" ErrorMessage="Required !"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="Supplier_Height">
                        <td align="right">
                            <asp:Label ID="Label9" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
&nbsp;
                            <asp:Label ID="LblAddress" runat="server" Text="Address :"></asp:Label>
                        </td>
                        <td class="style11">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtAddress" runat="server" TextMode="MultiLine" Height="60px" 
                                Width="250px"></asp:TextBox>
                        &nbsp;</td>
                        <td>
                            <asp:RequiredFieldValidator ID="RFVAddress" runat="server" 
                                ErrorMessage="Required !" ControlToValidate="TxtAddress"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="Supplier_Height">
                        <td align="right">
                            <asp:Label ID="Label6" runat="server" Text="Phone No. :"></asp:Label>
                        </td>
                        <td class="style11">
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtPhoneNo" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtPhoneNo"
ErrorMessage="Please Enter Only Numbers"  ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="Supplier_Height">
                        <td align="right">
                            <asp:Label ID="LblMobileNo" runat="server" Text="Mobile No. :"></asp:Label>
                        </td>
                        <td class="style11">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtMobileNo" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="RglrMobileNo" runat="server" 
                                ControlToValidate="TxtMobileNo" ErrorMessage="Please enter only numbers !" 
                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="Supplier_Height">
                        <td align="right">
                            <asp:Label ID="LblComments" runat="server" Text="Comments :"></asp:Label>
                        </td>
                        <td class="style11">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtComments" runat="server" TextMode="MultiLine" Height="60px" 
                                Width="250px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr class="Supplier_Height">
                        <td align="right">
                            <asp:Label ID="LblAlternateSupplier" runat="server" Text="Backup Supplier :"></asp:Label>
                        </td>
                        <td class="style11">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="DrplSPL" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Value="None">Supplier Name</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style11">
                            <asp:Label ID="LblError" runat="server" CssClass="error_label"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr class="Supplier_Height">
                        <td>
                            &nbsp;</td>
                        <td class="style11">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnSubmit" runat="server" CssClass="Button" ForeColor="White" 
                                onclick="BtnSubmit_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnClear" runat="server" CssClass="Button" ForeColor="White" 
                                onclick="BtnClear_Click" Text="Clear" CausesValidation="False" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

