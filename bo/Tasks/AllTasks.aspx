<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="AllTasks.aspx.cs" Inherits="AllTasks" Title="Tasks For All" %>
<%@ Register Src="grdvtask.ascx" TagName="taggrdvtask" TagPrefix="uc1" %> 
              <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
	  <uc1:taggrdvtask id="g" runat="server" />                
</asp:Content>
