<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fileupload.aspx.cs" Inherits="fileupload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
    function AddMoreImages() 
    {
        if (!document.getElementById && !document.createElement)
            return false;
        var fileUploadarea = document.getElementById("fileUploadarea");
        if (!fileUploadarea)
            return false;
        var newLine = document.createElement("br");
        fileUploadarea.appendChild(newLine);
        var newFile = document.createElement("input");
        newFile.type = "file";
        newFile.setAttribute("class", "fileUpload"); 

        if (!AddMoreImages.lastAssignedId)
            AddMoreImages.lastAssignedId = 100;
        newFile.setAttribute("id", "FileUpload" + AddMoreImages.lastAssignedId);
        newFile.setAttribute("name", "FileUpload" + AddMoreImages.lastAssignedId);
        var div = document.createElement("div");
        div.appendChild(newFile);
        div.setAttribute("id", "div" + AddMoreImages.lastAssignedId);
        fileUploadarea.appendChild(div);
        AddMoreImages.lastAssignedId++;
   }
   </script>
   
    <link href="css/fileupload.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style2
        {
            width: 174px;
        }
        .style3
        {
        }
        .style5
        {
        }
        .style6
        {
            width: 91px;
        }
        .style9
        {
            height: 44px;
        }
        .style10
        {
            font-family: Arial;
            font-size: medium;
            font-weight: bold;
            color: Navy;
            height: 26px;
        }
    </style>
   </head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div>
    <div>
    <table  class="table_margin">
    <tr>
    <td></td>
    <td class="style3"></td>
    <td class="style5" >&nbsp;</td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink6" runat="server" CssClass="row_heading" 
            NavigateUrl="/tm-tm/login.cfm">Log Out</asp:HyperLink>
        &nbsp;</td>
    <td>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Login By :" CssClass="row_heading"></asp:Label>
&nbsp;
        <asp:Label ID="Lblloginby" runat="server" CssClass="row_heading"></asp:Label>
        </td>
    </tr>
    <tr style="font-family: Arial; font-size: small; font-weight: bold; font-style: normal; color: #0033CC; background-color: #009999; border: thin solid #FFFFFF">
    <td class="td_width" align="center">
        <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="White" 
            NavigateUrl="../admin.cfm">Admin</asp:HyperLink>
        </td>
    <td class="style3" align="center">
        <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="White" 
            NavigateUrl="/tm-tm/mainmenu.cfm">Main Menu</asp:HyperLink>
        </td>
    <td class="td_width" align="center">
        <asp:HyperLink ID="HyperLink3" runat="server" ForeColor="White" 
            NavigateUrl="~/createfolder.aspx">Create folder for Images</asp:HyperLink>
        </td>
    <td class="td_width" align="center">
        <asp:HyperLink ID="HyperLink4" runat="server" ForeColor="White" 
            NavigateUrl="~/ViewImages.aspx">View Images</asp:HyperLink>
        </td>
    <td class="td_width" align="center">
        <asp:HyperLink ID="HyperLink5" runat="server" ForeColor="White" 
            NavigateUrl="~/ListingEmails.aspx">Email Listing</asp:HyperLink>
        </td>
    </tr>
    <tr>
    <td></td>
    <td class="style3"></td>
    <td class="style5"></td>
    <td></td>
    <td></td>
    </tr>
    <tr style="background-color: #CDCDCD">
    <td colspan="5">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Upload Email File" 
            CssClass="heading_font"></asp:Label>
        </td>
    </tr>
    <tr>
    <td class="ftcol_width">&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Text="Upload  file "></asp:Label></td>
        </td>
    <td class="firstcol_width" ><asp:FileUpload ID="FileUpload1" runat="server" 
            style="margin-left: 0px" /></td>
    <td class="thirdcol_width"><asp:Button ID="BtnSubmit" runat="server" onclick="BtnSubmit_Click" 
                        Text=" Upload file" /></td>
    <td class="style9"></td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    <td class="style3" colspan="4"><asp:Label ID="Lblstatus" runat="server"></asp:Label></td>
    </tr>
    </table>
    </div>
    <div id="fileUploadarea" >
      <table class="table_margin">
      <tr>
      <td colspan="4" style="background-color: #E6E6E6" class="style10" >&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Label ID="Label5" runat="server" Text="Upload Images" 
              CssClass="heading_font"></asp:Label>
          &nbsp;</td>
      </tr>
      <tr>
      <td class="style2"class="firstcol_width" >&nbsp;&nbsp; Select Subfolder</td>
      <td align="left" class="firstcol_width"><asp:DropDownList ID="DrpdImagesType" runat="server" 
            AppendDataBoundItems="True" style="margin-left: 4px" 
              onselectedindexchanged="DrpdImagesType_SelectedIndexChanged">
              <asp:ListItem Text="Select Subfolder" />
        </asp:DropDownList>
      </td>
      <td class="style6" >
          &nbsp;</td>
          <td >
              &nbsp;</td>
      </tr>
      <tr>
      <td class="style2" class="firstcol_width"> &nbsp;&nbsp; <asp:Label ID="Label4" runat="server" 
              Text=" Upload Images:"></asp:Label>
      </td>
      <td class="firstcol_width">
          <asp:FileUpload ID="FileUpload2" runat="server" BorderStyle="Solid" 
              BorderColor="Gray" style="margin-left: 4px" />
      </td>
      <td valign="middle" align="left" class="thirdcol_width">
          <input style="display: block;  height: 24px; width: 90px;" 
              id="btnAddMoreImages" type="button" value="Add  images" 
              onclick="AddMoreImages();"/>
      </td>
      <td><asp:Button ID="ButtonUpload" runat="server" OnClick="ButtonUpload_Click" 
              Text="Upload" Width="92px" /></td>
      </tr>
     </table>
      </div>
      <br />
      </div>
      <br />
       <div style="background-color:#E6E6E6; width: 939px;"></div>
      <div style="margin-left:10%;margin-right:10%">
    <asp:Literal ID="txtHtmlSrc" runat="server"  EnableViewState="true"  Visible="true"  ></asp:Literal>
   
   </div>
   </form>
    
 </body>
</html>