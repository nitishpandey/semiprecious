<%@ Page Language="C#" MasterPageFile="~/filemaster.master" AutoEventWireup="true" CodeFile="createfolder.aspx.cs" Inherits="createfolder" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
    {
        width: 100%;
            height: 35px;
        }
   
    .style2
    {
        width: 471px;
    }
    .style3
    {
        width: 353px;
    }
    .style4
    {
        width: 353px;
        height: 53px;
    }
    .style5
    {
        height: 28px;
    }
    .style6
    {
        height: 53px;
    }
   
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td bgcolor="#FBFBFB" width="2px" rowspan="4">
            &nbsp;</td>
        <td align="left" valign="bottom">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" CssClass="lableHeading" 
                ForeColor="#660033" Text="Create Subfolder"></asp:Label>
        </td>
        <td rowspan="4" style="background-color: #FBFBFB" width="2px">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center">
                        <asp:Label ID="Lblerrormessage" runat="server" CssClass="error_label"></asp:Label>
                    </td>
    </tr>
    <tr>
        <td valign="top">
            <table cellpadding="0" cellspacing="0" class="style1">
                <tr>
                    <td class="style3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" CssClass="fontstyle" Text="Folder Name "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtfoldername" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="Txtfoldername" ErrorMessage="Required !"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style4">
                        </td>
                    <td class="style6">
                        <asp:Button ID="Button1" runat="server" CssClass="Button" ForeColor="White" 
                            Height="26px" onclick="Button1_Click" Text="Submit" Width="88px" />
                    </td>
                    <td class="style6">
                        </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

