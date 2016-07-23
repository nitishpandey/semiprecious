<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style11
        {
            width: 100%;
            height: 282px;
            border: 2px solid #999999;
            background-color: #E9E9E9;
        }
        .style12
        {
        }
        .style13
        {
            width: 301px;
        }
        .style14
        {
            width: 65px;
        }
    </style>
    <script type="text/javascript">
       function validate(key)
        {
        //getting key code of pressed key
        var keycode = (key.which) ? key.which : key.keyCode;
        var phn = document.getElementById('TxtUserName');
        //comparing pressed keycodes
        if  ((keycode < 48 || keycode > 57) && (keycode < 97 || keycode > 122))
        {
        return false;
        }
        else
        {
        //Condition to check textbox contains ten numbers or not
        if (phn.value.length < 4)
        {
        return true;
        }
        else
        {
        return false;
        }
        }
        }
</script>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
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
            <td align="left" colspan="2" rowspan="3" valign="top">
                <table cellspacing="1" class="style11">
                    <tr>
                        <td align="center" bgcolor="#006699" colspan="5">
                            <asp:Label ID="Label15" runat="server" CssClass="lableHeading" 
                                ForeColor="White" Text="User Registration"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            &nbsp;</td>
                        <td valign="top">
                            &nbsp;</td>
                        <td class="style13">
                            &nbsp;</td>
                        <td align="right">
                            <asp:Label ID="Label16" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                            <asp:Label ID="Label17" runat="server" Font-Bold="True" Text="Required Fields" 
                                ForeColor="#003399"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="left" class="style12" colspan="4">
                            <asp:Label ID="Lblfirststage" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="LbluserType" runat="server" Text="User Type "></asp:Label>
                            <asp:Label ID="Label28" runat="server" Font-Bold="True" Text=":" 
                                ForeColor="#993300"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Label ID="Label11" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:DropDownList ID="DrplUserType" runat="server" Width="170px" 
                                AutoPostBack="True" CssClass="textbox" 
                                onselectedindexchanged="DrplUserType_SelectedIndexChanged">
                                <asp:ListItem>Admin</asp:ListItem>
                                <asp:ListItem>supplier</asp:ListItem>
                                <asp:ListItem>Drop Ship</asp:ListItem>
                                <asp:ListItem>Superadmin</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="DrplUserType" ErrorMessage="You must  select user type."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="Lblusername" runat="server" Text="User Name "></asp:Label>
&nbsp;<asp:Label ID="Label32" runat="server" Font-Bold="True" Text=":" ForeColor="#993300"></asp:Label>
</td>
                        <td valign="top">
                            <asp:Label ID="Label8" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="TxtUserName" runat="server" Width="170px"  CssClass="textbox" 
                               ></asp:TextBox>
&nbsp;
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TxtUserName" ErrorMessage="Please Enter User name."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="LblPassword" runat="server" Text="Password"></asp:Label>
&nbsp;
                            <asp:Label ID="Label31" runat="server" Font-Bold="True" Text=":" 
                                ForeColor="#993300"></asp:Label>
</td>
                        <td valign="top">
                            <asp:Label ID="Label9" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Width="170px" 
                                CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TxtPassword" ErrorMessage="Please Enter Password."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="LblName" runat="server" Text="Full Name "></asp:Label>
                            <asp:Label ID="Label30" runat="server" Font-Bold="True" Text=":" 
                                ForeColor="#993300"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Label ID="Label10" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="TxtName" runat="server" Width="170px" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TxtName" ErrorMessage="Please Enter Name."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="LblEmailAddress" runat="server" Text="Email Address "></asp:Label>
                            <asp:Label ID="Label29" runat="server" Font-Bold="True" Text=":" 
                                ForeColor="#993300"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Label ID="Label13" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="TxtEmailAddress" runat="server" Width="170px" 
                                CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="TxtEmailAddress" ErrorMessage="Enter Email."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TxtEmailAddress" ErrorMessage="Please Enter Correct Email." 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="LblMobileNo" runat="server" Text="Mobile Number"></asp:Label>
&nbsp;<asp:Label ID="Label25" runat="server" Font-Bold="True" Text=":" ForeColor="#993300"></asp:Label>
                        </td>
                        <td valign="top">
                            <asp:Label ID="Label19" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="Txtmobileno" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="Txtmobileno" ErrorMessage="Mobile Number is required !"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="LblPhoneNumber" runat="server" Text="Phone Number"></asp:Label>
&nbsp;<asp:Label ID="Label26" runat="server" Font-Bold="True" Text=":" ForeColor="#993300"></asp:Label>
                        </td>
                        <td valign="top">
                            &nbsp;</td>
                        <td class="style13">
                            <asp:TextBox ID="TxtPhoneNumber" runat="server" CssClass="textbox"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
&nbsp;<asp:Label ID="Label27" runat="server" Font-Bold="True" Text=":" ForeColor="#993300"></asp:Label>
                        </td>
                        <td valign="middle">
                            <asp:Label ID="Label24" runat="server" CssClass="LabelReuiredField" Text="**"></asp:Label>
                        </td>
                        <td class="style13">
                            <asp:TextBox ID="TxtAddress" runat="server" CssClass="textbox" 
                                TextMode="MultiLine" Width="304px" Height="74px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="TxtAddress" ErrorMessage="Address is required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="LblComments" runat="server" Text="Comments"></asp:Label>
                        &nbsp;<asp:Label ID="Label34" runat="server" Font-Bold="True" Font-Size="Medium" 
                                ForeColor="#993300" Text=":"></asp:Label>
                        </td>
                        <td valign="top">
                            &nbsp;</td>
                        <td class="style13">
                            <asp:TextBox ID="TxtComments" runat="server" CssClass="textbox" 
                                TextMode="MultiLine" Width="308px" Height="74px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            <asp:Label ID="Lblbacksupplier" runat="server" Text="Backup Supplier"></asp:Label>
&nbsp;<asp:Label ID="Label33" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#993300" 
                                Text=":"></asp:Label>

                        </td>
                        <td valign="top">
                            &nbsp;</td>
                        <td class="style13">
                            <asp:DropDownList ID="DrplAltsupplier" runat="server" 
                                AppendDataBoundItems="True" CssClass="textbox" Width="170px">
                                <asp:ListItem>Select Supplier</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td align="right" class="style12">
                            &nbsp;</td>
                        <td valign="top">
                            &nbsp;</td>
                        <td class="style13">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
                            <asp:Label ID="LblStatus" runat="server" CssClass="error_label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                        </td>
                        <td class="style12">
                        </td>
                        <td>
                        </td>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" 
                                CssClass="Button" Height="26px" ForeColor="White" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" Text="Reset" Width="91px" 
                                CssClass="Button" Height="26px" onclick="Button2_Click" 
                                CausesValidation="False" ForeColor="White" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style14">
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td colspan="2">
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

