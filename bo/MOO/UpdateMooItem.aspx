<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="UpdateMooItem.aspx.cs" Inherits="PacketInformation_UpdateBuyingRecord" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style11
        {
            width: 100%;
            border: 2px solid #D9D9D9;
        }
        .style12
        {
            width: 298px;
        }
        .style13
        {
            height: 8px;
        }
        .style14
        {
            width: 298px;
            height: 8px;
        }
        .style15
        {
            height: 4px;
        }
        .style17
        {
            height: 27px;
        }
        .style19
        {
            height: 42px;
        }
        .style20
        {
            width: 298px;
            height: 42px;
        }
        </style>
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
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
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" colspan="2" rowspan="2" valign="middle">
                <table cellspacing="1" class="style11">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td colspan="3" align="center">
                            <br />
                            <asp:Label ID="Label6" runat="server" CssClass="lableHeading" 
                                Text="Marking Items as MOO" Font-Underline="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        
                        <td class="style12">
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="Label4" runat="server" Font-Bold="False" ForeColor="#FF5050" 
                                Text="**  " Font-Italic="True" Font-Size="Medium"></asp:Label>
&nbsp;
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Required Fields" 
                                ForeColor="#FF9900"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height:1px" bgcolor="#FF9900">
                        <td  colspan="4">
                            </td>
                        
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            &nbsp;</td>
                        <td align="left" class="style12">
                            &nbsp;</td>
                        <td align="left">
                            &nbsp;</td>
                    </tr>
                    <tr class="tablerow">
                        <td class="style19">
                            </td>
                        <td align="right" class="style19">
                            <asp:Label ID="Label3" runat="server" Text="Supplier Code" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="Label7" runat="server" CssClass="lblErrorSymbol" 
                                Font-Bold="False" Font-Italic="False" Text="**"></asp:Label>
&nbsp;</td>
                        <td align="left" class="style20">
&nbsp;&nbsp;&nbsp;

                            <asp:DropDownList ID="Drplsuppliercode" runat="server" 
                                CssClass="drplAddresponse">
                            </asp:DropDownList>
                        </td>
                        <td align="left" class="style19">
                            <asp:RequiredFieldValidator ID="RFVSupplierCode" runat="server" 
                                ControlToValidate="Drplsuppliercode" 
                                ErrorMessage="Please Select Supplier Code !"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="tablerow">
                        <td class="style15">
                            </td>
                        <td align="right" class="style15">
                            <asp:Label ID="LblCartId" runat="server" Text="Cart ID" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="Label8" runat="server" CssClass="lblErrorSymbol" 
                                Font-Italic="False" Text="**"></asp:Label>
                        </td>
                        <td align="left" class="style12">
&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtCartID" runat="server" CssClass="textbox"></asp:TextBox>

                            &nbsp;

                            <asp:RegularExpressionValidator ID="RFVCart" runat="server" 
                                ControlToValidate="TxtCartID" ErrorMessage="Only Numeric " 
                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                        <td align="left" class="style15">
                            <asp:RequiredFieldValidator ID="RFVCartID" runat="server" 
                                ControlToValidate="TxtCartID" ErrorMessage="Please Enter Cart ID !" 
                                ValidationGroup="^\d+$"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="tablerow">
                        <td class="style17">
                            </td>
                        <td align="right" class="style17">
                            <asp:Label ID="LblItemID" runat="server" Text="Item ID" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="Label9" runat="server" CssClass="lblErrorSymbol" 
                                Font-Italic="False" Text="**"></asp:Label>
                        </td>
                        <td align="left" class="style12" >
                        &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtItemId" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;
                            <asp:RegularExpressionValidator ID="RFVItem" runat="server" 
                                ControlToValidate="TxtItemId" ErrorMessage="Only Numeric " 
                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                        <td align="left" class="style17">
                            <asp:RequiredFieldValidator ID="RFVItemID" runat="server" 
                                ControlToValidate="TxtItemId" ErrorMessage="Please Enter Item ID !"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="tablerow">
                        <td>
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="LblOptionID" runat="server" Text="Option ID" ForeColor="Gray"></asp:Label>
                            <asp:Label ID="Label10" runat="server" CssClass="lblErrorSymbol" Text="**"></asp:Label>
                        </td>
                        <td align="left" class="style12" >
                        &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtOptionID" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp; <asp:RegularExpressionValidator ID="RFVOptiion" runat="server" ControlToValidate="TxtOptionID" 
                                ErrorMessage="Only Numeric" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                        <td align="left">
                            <asp:RequiredFieldValidator ID="RFVOptionID" runat="server" 
                                ControlToValidate="TxtOptionID" ErrorMessage="Please Enter Option ID !"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="tablerow">
                        <td class="style13">
                            </td>
                        <td align="right" class="style13">
                            </td>
                        <td align="left" class="style14">
                            <asp:Label ID="LblUpdateError" runat="server" CssClass="error_label"></asp:Label>
                        </td>
                        <td class="style13">
                            </td>
                    </tr>
                    <tr class="tablerow">
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td align="left" class="style12">
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                                Text="Update" CssClass="Button" ForeColor="White" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BtnReset" runat="server" Text="Reset" CssClass="Button" 
                                ForeColor="White" onclick="BtnReset_Click" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr class="tablerow">
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td align="left" class="style12">
                            &nbsp;</td>
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

