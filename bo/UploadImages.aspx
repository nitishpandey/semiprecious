<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UploadImages.aspx.cs" Inherits="UploadImages" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    
   
    <style type="text/css">
        #form1
        {
            height: 444px;
        }
        .style7
        {
            height: 234px;
        }
        .style8
        {
            height: 41px;
            }
        .style10
        {            height: 161px;
        }
        .style11
        {
            width: 74px;
            height: 234px;
        }
        .style16
        {
            width: 146px;
        }
        .style17
        {
            width: 229px;
        }
        .style18
        {
            width: 146px;
            height: 28px;
        }
        .style19
        {
            width: 229px;
            height: 28px;
        }
        </style>
   
</head>
<body>
    <form id="form1" runat="server">
   <div style="margin-bottom:10%;margin-left:10%;margin-right:10%;margin-right:10%;">
     <table style="width: 752px;border-bottom-width:thick;border-color:Blue; height: 293px;">
      <tr>
      <td class="style8" align="left" colspan="2">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       </td>
      </tr>
      <tr>
      <td class="style10" colspan="2" align="center">
      <div id="fileUploadarea">
        <asp:FileUpload ID="FileUpload1" runat="server" BorderStyle="Solid" 
              BorderColor="Gray" style="margin-left: 0px" />&nbsp;<asp:Button ID="ButtonUpload" runat="server" OnClick="ButtonUpload_Click" Text="Upload" />
    &nbsp;&nbsp;
        <br />
        </div>
        <br />
        <input style="display: block;" id="btnAddMoreImages" type="button" value="Add more images" onclick="AddMoreImages();" /><asp:HyperLink 
            ID="HyperLink1" runat="server" NavigateUrl="~/fileupload.aspx ">Upload email
        </asp:HyperLink>
&nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="../admin.cfm">Admin 
        menu</asp:HyperLink>
        <br />
        <br />
&nbsp;</div>
     </div>
      </td>
      <tr>
      <td class="style11">
          &nbsp;</td>
      <td class="style7">
      
      </td>

      </tr>
     </table>
   </div>
    </form>
</body>
</html>
