<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="Iteminfo.aspx.cs" Inherits="Packetinfo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
   
    <style type="text/css">
        .style11
        {
            width: 147px;
        }
        .style15
        {
            height: 27px;
        }
        .style16
        {
            width: 147px;
            height: 26px;
        }
        .style17
        {
            height: 26px;
        }
        .style18
        {
            width: 161px;
        }
        .style20
        {
            width: 117px;
        }
        .style21
        {
            height: 26px;
            width: 117px;
        }
        .style22
        {
            width: 132px;
        }
        .style24
        {
            width: 120px;
        }
        .style25
        {
            height: 26px;
            width: 120px;
        }
        </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
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
                <td align="left" colspan="2" rowspan="2" valign="top">
    <table cellpadding="0" cellspacing="0" class="tableItemInfo">
        <tr >
            <td class="style11">
                &nbsp;</td>
            <td colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LblPacketForm" runat="server" Text="Item Information" 
                    CssClass="lableHeading"></asp:Label>
            </td>
            <td class="style22">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style20">
                &nbsp;</td>
            <td class="style24">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr style="border: medium groove #C0C0C0">
            <td valign="middle" class="style15">
                <asp:Label ID="lblItemId" runat="server" Text="ITEMD ID  :" Font-Bold="True" 
                    ForeColor="Maroon"></asp:Label>
                <br />
                <br />
            </td>
            <td  colspan="4"  valign="top" class="style15">
                <asp:TextBox ID="TxtItemID" runat="server"></asp:TextBox>
&nbsp; 
                <asp:Button ID="BtnSearch" runat="server" CausesValidation="False" 
                    onclick="BtnSearch_Click" Text="Search" />
&nbsp;&nbsp;
                <asp:Label ID="lblerror" runat="server" CssClass="error_label"></asp:Label>
            </td>
            <td  valign="top" class="style15">
                &nbsp;</td>
        </tr>
        <tr  style="border: medium groove #C0C0C0;" >
            <td  colspan="6" 
                style=" background-color: #C0C0C0"  height="1px">
                </td>
        </tr>
        <tr class="Supplier_Height">
            <td class="style11">
                <asp:Label ID="Label14" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Category  :"></asp:Label>
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DrplCategory" runat="server">
                </asp:DropDownList>
            &nbsp;&nbsp;
                <br />
                <asp:Label ID="Lblcategory" runat="server" Font-Bold="True" ForeColor="#009999"></asp:Label>
            </td>
            <td align="left" class="style20">
                <asp:RequiredFieldValidator ID="RFVCategory" runat="server" 
                    ControlToValidate="DrplCategory" ErrorMessage="Required !" 
                    CssClass="error_label"></asp:RequiredFieldValidator>
            </td>
            <td class="style24">
                <asp:Label ID="Label15" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Lot No.  :"></asp:Label>
            </td>
            <td class="style22">
                <asp:DropDownList ID="DrplLotno" runat="server">
                </asp:DropDownList>
            &nbsp;</td>
            <td>
                <asp:RequiredFieldValidator ID="RFVlotno" runat="server" 
                    ControlToValidate="DrplLotno" ErrorMessage="Required !" 
                    CssClass="error_label"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr   class="Supplier_Height">
            <td class="style11">
                <asp:Label ID="Label16" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="Label6" runat="server" Text="Quantity  :"></asp:Label>
            </td>
            <td align="left" valign="middle">
                <asp:TextBox ID="TxtQuantity" runat="server" Width="50px"></asp:TextBox>
            &nbsp;
                <asp:RangeValidator ID="RngVfQuantity" runat="server" 
                    ControlToValidate="TxtQuantity" ErrorMessage="Out of Range" 
                    MaximumValue="10000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                <br />
&nbsp;<asp:Label ID="LblItemQuantity" runat="server"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td align="left" class="style20">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TxtQuantity" ErrorMessage="Required !" 
                    CssClass="error_label"></asp:RequiredFieldValidator>
            </td>
            <td class="style24">
                <asp:Label ID="Label17" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="LblSize" runat="server" Text="Size (Inches)  :"></asp:Label>
            </td>
            <td class="style22">
                <asp:TextBox ID="TxtSize" runat="server" Width="50px"></asp:TextBox>
            &nbsp;
                <br />
                <asp:Label ID="LblItemSize" runat="server"></asp:Label>
            </td>
            <td>
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="TxtSize" ErrorMessage="Size should be between 1 to 80 . !" 
                    MaximumValue="80" MinimumValue="1" Type="Integer" CssClass="error_label"></asp:RangeValidator>
            </td>
        </tr>
        <tr  class="Supplier_Height">
            <td class="style11">
                <asp:Label ID="Label18" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="LblCost0" runat="server" 
                    Text="Cost ( total cost "></asp:Label>
                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="for all "></asp:Label>
                <asp:Label ID="Label12" runat="server" Text="quantities in Rs.) :"></asp:Label>
            </td>
            <td align="left" class="style18">
                <asp:TextBox ID="TxtCost" runat="server"></asp:TextBox>
            &nbsp;
                <br />
                <asp:Label ID="LblItemCost" runat="server"></asp:Label>
            </td>
            <td align="left" class="style20">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TxtCost" CssClass="error_label" 
                    ErrorMessage="Cost Required !"></asp:RequiredFieldValidator>
            </td>
            <td class="style24">
                <asp:Label ID="Label19" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="LblWeight" runat="server" Text="Weight ( gm "></asp:Label>
                <asp:Label ID="Label13" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="per item"></asp:Label>
&nbsp;) :</td>
            <td class="style22">
                <asp:TextBox ID="TxtWeight" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="LblItemWeight" runat="server"></asp:Label>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TxtWeight" ErrorMessage="Required !" 
                    CssClass="error_label"></asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidator2" runat="server" 
                    ControlToValidate="TxtSize" ErrorMessage="Out of range !" MaximumValue="800" 
                    MinimumValue="1" Type="Integer" CssClass="error_label"></asp:RangeValidator>
            </td>
        </tr>
        <tr  class="Supplier_Height">
            <td class="style11">
                <asp:Label ID="Label20" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="Label5" runat="server" Text="Colour 1  :"></asp:Label>
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DrplColor1" runat="server">
                    <asp:ListItem>Select Color</asp:ListItem>
                    <asp:ListItem>Black</asp:ListItem>
                    <asp:ListItem>Blue</asp:ListItem>
                    <asp:ListItem>Brown</asp:ListItem>
                    <asp:ListItem>Green</asp:ListItem>
                    <asp:ListItem>Gray</asp:ListItem>
                    <asp:ListItem>Multi-Color</asp:ListItem>
                    <asp:ListItem>Orange</asp:ListItem>
                    <asp:ListItem>Pink</asp:ListItem>
                    <asp:ListItem>Purple</asp:ListItem>
                    <asp:ListItem>Red</asp:ListItem>
                    <asp:ListItem>White</asp:ListItem>
                    <asp:ListItem>Yellow</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="LblItemColor" runat="server"></asp:Label>
            </td>
            <td align="left" class="style20">
                <asp:RequiredFieldValidator ID="RFVColor" runat="server" 
                    ControlToValidate="DrplColor1" ErrorMessage="Required !" 
                    CssClass="error_label"></asp:RequiredFieldValidator>
            </td>
            <td class="style24">
                <asp:Label ID="Label8" runat="server" Text="Stone1 :"></asp:Label>
            </td>
            <td class="style22">
                <asp:DropDownList ID="DrplStones" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DrplStones_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:Label ID="LblItemStone1" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr  class="Supplier_Height">
            <td class="style11">
                <asp:Label ID="Lblstone2" runat="server" Text="Stone 2 :"></asp:Label>
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="Drpstone2" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="Drpstone2_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:Label ID="LblItemStone2" runat="server"></asp:Label>
            </td>
            <td align="left" class="style20">
                &nbsp;</td>
            <td class="style24">
                <asp:Label ID="Label9" runat="server" Text="Stone 3 :"></asp:Label>
            </td>
            <td class="style22">
                <asp:DropDownList ID="DrplStone3" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Label ID="LblItemStone3" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr  class="Supplier_Height">
            <td class="style11">
                <asp:Label ID="LblShape" runat="server" Text="Shape  :"></asp:Label>
            </td>
            <td align="left" class="style18">
                <asp:DropDownList ID="DrpLShape" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Label ID="LblItemShape" runat="server"></asp:Label>
            </td>
            <td align="left" class="style20">
                &nbsp;</td>
            <td class="style24">
                &nbsp;
                <asp:Label ID="Label21" runat="server" CssClass="error_label" Text="**"></asp:Label>
                <asp:Label ID="Label10" runat="server" Text="Is it faceted ?"></asp:Label>
            </td>
            <td class="style22">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" Height="31px" Width="152px">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="RadioButtonList1" CssClass="error_label" 
                    ErrorMessage="Required !"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr  class="Supplier_Height">
            <td class="style16">
                <asp:Label ID="LblStorage" runat="server" Text="Storage :"></asp:Label>
            </td>
            <td align="left" valign="top">
                <asp:TextBox ID="TxtStorage" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="LblItemStorage" runat="server"></asp:Label>
                <br />
            </td>
            <td align="left" class="style21">
                <asp:RequiredFieldValidator ID="RVFStorage" runat="server" 
                    ControlToValidate="TxtStorage" CssClass="error_label">Required !</asp:RequiredFieldValidator>
            </td>
            <td class="style25">
                <asp:Label ID="Label22" runat="server" CssClass="error_label" Text="**"></asp:Label>
&nbsp;
                <asp:Label ID="Label7" runat="server" Text="Is it Silver   ?  "></asp:Label>
            </td>
            <td  valign="middle" align="left" class="style22">
                <asp:RadioButtonList ID="RblSilver" runat="server" Height="16px" 
                    RepeatDirection="Horizontal" Width="156px">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                                            
            &nbsp;
                                            
            </td>
            <td class="style17">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="RblSilver" CssClass="error_label" ErrorMessage="Required !"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
                <asp:Label ID="Lbllocation" runat="server" Text="Location"></asp:Label>
            </td>
            <td class="style18">
                <asp:DropDownList ID="Drplocation" runat="server">
                    <asp:ListItem>Select Location</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="lblitemlocation" runat="server"></asp:Label>
                <br />
            </td>
            <td class="style20">
                <asp:RequiredFieldValidator ID="RFVLocation" runat="server" 
                    ControlToValidate="Drplocation" CssClass="error_label" 
                    ErrorMessage="Required !"></asp:RequiredFieldValidator>
            </td>
            <td class="style24">
                &nbsp;</td>
            <td class="style22">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td colspan="3">
                
                <asp:Label ID="LblResult" runat="server" CssClass="error_label"></asp:Label>
            </td>
            <td class="style22">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr  class="Supplier_Height">
            <td class="style11">
                &nbsp;</td>
            <td colspan="3">
                <asp:Button ID="BtnSubmit" runat="server" CssClass="Button" ForeColor="White" 
                    Height="29px" onclick="BtnSubmit_Click" Text="New Item" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Btnexistingitems" 
                    runat="server" CssClass="Button" ForeColor="White" Height="29px" 
                    onclick="Btnexistingitems_Click" Text="Existing Item" Width="100px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnClear" runat="server" CssClass="Button" ForeColor="White" 
                    Height="29px" onclick="BtnClear_Click" Text="Clear" />
            </td>
            <td class="style22">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td class="style18">
                &nbsp;</td>
            <td class="style20">
                &nbsp;</td>
            <td class="style24">
              
            </td>
            <td class="style22">
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
    </div>    
        
</asp:Content>

