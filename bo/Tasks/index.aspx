<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" Title="Tasks Menu" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .style9
        {
            width: 371px;
        }
       
      
        .style12
        {
            height: 32px;
        }
        .style13
        {
            width: 418px;
            height: 32px;
        }
    </style>
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td class="style10">
                &nbsp;&nbsp;&nbsp; </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="HyperLink3" runat="server" 
                    NavigateUrl="~/Tasks/AddTask.aspx">Add Task or Cart Issue</asp:HyperLink>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>       <tr>
            <td class="style10">
                <asp:HyperLink ID="HyperLink4" runat="server" 
                    NavigateUrl="~/Tasks/AllTasks.aspx">All Task or Cart Issue</asp:HyperLink>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>   <tr>
            <td class="style10">
                &nbsp;&nbsp;&nbsp; </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="hyplnktaskforme" runat="server" 
                    NavigateUrl="~/Tasks/TaskForMe.aspx">[hyplnktaskforme]</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
		
        <tr>
            <td class="style10">
                <asp:HyperLink ID="hyplnktaskformecomp" runat="server" 
                    NavigateUrl="~/Tasks/TaskForMe.aspx?status=complete">[hyplnktaskformecomp]</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="hyplnktaskformeclo" runat="server" 
                    NavigateUrl="~/Tasks/TaskForMe.aspx?status=close">[hyplnktaskformeclo]</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
		<tr>
            <td class="style10">
            </td>
            <td class="style11">
          ..      &nbsp;</td>
            <td>
            -..  &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="style10">
                <asp:HyperLink ID="HyplnkTaskbyme" runat="server" 
                    NavigateUrl="~/Tasks/TaskByMe.aspx">Task By You In New/Active Status</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="HyplnkTaskbymeack" runat="server" 
                    NavigateUrl="~/Tasks/TaskByMe.aspx?status=ack">Task By You Acknowledged By Receiver</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
            <td class="style10">
                <asp:HyperLink ID="HyplnkTaskbymecomp" runat="server" 
                    NavigateUrl="~/Tasks/TaskByMe.aspx?status=comp">Task By You Marked Completed (Please review and mark as closed)</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="HyplClosedTask" runat="server" 
                    NavigateUrl="~/Tasks/taskclosed.aspx">[HyplClosedTask]</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
       
        <tr>
            <td class="style10">
                <asp:HyperLink ID="HypInfo" runat="server" NavigateUrl="~/Tasks/taskinfo.aspx">Task 
                Info</asp:HyperLink>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>    <tr>
            <td class="style11">
                 <asp:HyperLink ID="HypAllCart" runat="server" NavigateUrl="~/Tasks/alltaskissues.aspx">All (old type) Tasks/Cart Issues </asp:HyperLink>
	</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="HyperLink6" runat="server" 
                    NavigateUrl="~/Tasks/tasksearch.aspx">Search
                </asp:HyperLink>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="Hyplnkcompletetask" runat="server" ForeColor="#0033CC">[Hyplnkcompletetask]</asp:HyperLink>
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="hyplnkpdctaskforme" runat="server" Font-Bold="True" 
                    ForeColor="#FF3300">[hyplnkpdctaskforme]</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="hyplnkpdctaskbyme" runat="server" Font-Bold="True" 
                    ForeColor="#FF3300">[hyplnkpdctaskbyme]</asp:HyperLink>
            </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style13">
                &nbsp;</td>
            <td class="style13">
                </td>
            <td class="style12">
                </td>
            <td class="style12">
                </td>
        </tr>
        <tr>
            <td class="style10">
&nbsp;
                &nbsp;
                </td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style10">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>


