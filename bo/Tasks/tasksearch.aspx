<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="tasksearch.aspx.cs" Inherits="Tasks_tasksearch" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .style11
        {
            width: 68px;
        }
        .style12
        {
            width: 202px;
        }
        .style13
        {
            width: 26px;
        }
        .style14
        {
            height: 37px;
            width: 26px;
        }
    .style16
    {
        height: 51px;
    }
    .style17
    {
        height: 51px;
        width: 26px;
    }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style9" style="width: 851px">
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style13">
                </td>
            <td colspan="2">
                <asp:Label ID="Lbltasksearching" runat="server" Font-Bold="True" 
                    Font-Italic="False" Font-Underline="False" ForeColor="#0033CC" 
                    Text="Search By ID"></asp:Label>
            </td>
            <td class="style11">
                </td>
        </tr>
        <tr>
            <td class="style17">
                </td>
            <td colspan="2" class="style16">
                <asp:Label ID="Label1" runat="server" Text="Task ID :"></asp:Label>
                <asp:TextBox ID="txttaskid" runat="server"></asp:TextBox>
&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txttaskid" ErrorMessage="Required" 
                    ToolTip="Enter task id .">**</asp:RequiredFieldValidator>
            </td>
            <td class="style16">
                <asp:Button ID="BtnSubmit" runat="server" onclick="BtnSubmit_Click" 
                    Text="Search" />
            </td>
        </tr>
        <tr>
            <td class="style14">
            </td>
            <td class="style10" colspan="2">
                <asp:Label ID="lblName" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </td>
            <td class="style10">
            </td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

