<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="Emailformat.aspx.cs" Inherits="Email_Emailformat" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

.ajax__htmleditor_editor_default .ajax__htmleditor_editor_container
{
	border: 1px solid #C2C2C2;
}
.ajax__htmleditor_editor_base .ajax__htmleditor_editor_container
{
	border-collapse: separate;
	empty-cells: show;
	width:100%;
	height:100%;
}
.ajax__htmleditor_editor_default .ajax__htmleditor_editor_toptoolbar
{
	background-color:#F0F0F0; padding: 0px 2px 2px 2px;
}
.ajax__htmleditor_editor_base .ajax__htmleditor_editor_toptoolbar
{
	cursor:text;
}
.ajax__htmleditor_editor_default .ajax__htmleditor_editor_toptoolbar .ajax__htmleditor_toolbar_button
{
	background-color:#C2C2C2; margin:2px 0px 0px 0px;
}
.ajax__htmleditor_editor_base .ajax__htmleditor_toolbar_button
{
	height: 21px; white-space: nowrap; border-width: 0px; padding:0px; cursor:pointer; float:left;
}
.ajax__htmleditor_editor_default .ajax__htmleditor_editor_toptoolbar div.ajax__htmleditor_toolbar_button select.ajax__htmleditor_toolbar_selectbutton
{
    font-size:12px; font-family:arial; cursor:pointer;
}
.ajax__htmleditor_editor_base div.ajax__htmleditor_toolbar_button select.ajax__htmleditor_toolbar_selectbutton
{
    vertical-align:middle; padding:0px; margin:0px; height: 20px; width:120px;
}
.ajax__htmleditor_editor_default .ajax__htmleditor_editor_toptoolbar div.ajax__htmleditor_toolbar_button select.ajax__htmleditor_toolbar_selectbutton option
{
    font-size:12px;
}
.ajax__htmleditor_editor_base div.ajax__htmleditor_toolbar_button select.ajax__htmleditor_toolbar_selectbutton option
{
    vertical-align:middle;
}
.ajax__htmleditor_editor_default .ajax__htmleditor_editor_editpanel
{
	border-width: 0px;
	border-top: 1px solid #C2C2C2;
	border-bottom: 1px solid #C2C2C2;
}
.ajax__htmleditor_editor_base .ajax__htmleditor_editor_editpanel
{
	height:100%;
}
.ajax__htmleditor_editor_default .ajax__htmleditor_editor_bottomtoolbar
{
	background-color:#F0F0F0; padding: 0px 0px 2px 2px;
}
.ajax__htmleditor_editor_base .ajax__htmleditor_editor_bottomtoolbar
{
	cursor:text;
}

.ajax__htmleditor_editor_default .ajax__htmleditor_editor_bottomtoolbar .ajax__htmleditor_toolbar_button
{
	background-color:#C2C2C2; margin:0px 4px 0px 0px;
}
        .style11
        {
            height: 15px;
        }
    </style>
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="width:100%; ">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
 
 
 <table style="width:100%">
 <tr>
 <td colspan="2">
     <asp:HyperLink ID="HyperLink3" runat="server" 
         NavigateUrl="~/EmailTools/MessageListing.aspx">Email Content Listing</asp:HyperLink>
     &nbsp;
     <asp:HyperLink ID="HyperLink4" runat="server" 
         NavigateUrl="~/EmailTools/TextEmail.aspx">Email Text format</asp:HyperLink>
     </td>
 <td>&nbsp;</td>
 </tr>
     <tr>
         <td>
             <asp:Label ID="Label7" runat="server" Text="Upload file :"></asp:Label>
         </td>
         <td>
             <asp:FileUpload ID="fldupload" runat="server" />
&nbsp;&nbsp;&nbsp;
             <asp:Button ID="Btnupload" runat="server" CausesValidation="False" 
                 CssClass="Button" ForeColor="White" Height="29px" onclick="Button1_Click" 
                 Text="Upload " />
         </td>
         <td>
         </td>
     </tr>
     <tr>
         <td>
             <asp:Label ID="Label8" runat="server" Text="Over Write Existing file"></asp:Label>
         </td>
         <td>
     <asp:CheckBox ID="CheckBox1" runat="server" 
         TextAlign="Left" />
         </td>
         <td>
             &nbsp;</td>
     </tr>
 <tr>
 <td>
     <asp:Label ID="Label6" runat="server" Text="File Name"></asp:Label>
     </td>
 <td>
     <asp:TextBox ID="txtFileName" runat="server" CssClass="textbox"></asp:TextBox>
     &nbsp;
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
         ControlToValidate="txtFileName" ErrorMessage="Required !"></asp:RequiredFieldValidator>
     &nbsp;
     </td>
 <td>&nbsp;</td>
 </tr>
<tr>
 <td align="left" valign="top">
     <asp:Label ID="Label4" runat="server" Text="File Content"></asp:Label>
    </td>
 <td>
     <cc1:Editor 
            ID="Editor1" 
            Width="650px"  
            Height="200px"
            runat="server"/>
        </td>
 <td></td>
 </tr>
<tr>
 <td class="style11">
     &nbsp;</td>
 <td class="style11">
     <asp:Label ID="lblstatus" runat="server" CssClass="error_label"></asp:Label>
    </td>
 <td class="style11"></td>
 </tr>
<tr>
 <td class="style11">
     &nbsp;</td>
 <td class="style11">
        <asp:Button
            id="btnSubmit"
            Text="Submit"
            Runat="server" onclick="btnSubmit_Click" CssClass="Button" 
        ForeColor="White" Height="29px" />
    
        &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="BtnClear" runat="server" CssClass="Button" ForeColor="White" 
        Text="Clear" Height="29px" onclick="BtnClear_Click" />
         &nbsp;&nbsp;
    </td>
 <td class="style11">&nbsp;</td>
 </tr>
 </table>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal
            id="ltlResult"
            Runat="server" />
 <br />
</div>
</asp:Content>

