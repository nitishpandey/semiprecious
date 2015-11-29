<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="MessageListing.aspx.cs" Inherits="Email_MessageListing" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="lstmessage" runat="server"></asp:Literal>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr style="height:40px">
            <td>
                &nbsp;</td>
            <td colspan="2" align="char" valign="middle">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Email Contents Listing" 
                    CssClass="lableHeading"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2" rowspan="2">
    <asp:GridView ID="GridView1" runat="server" 
     CellPadding="3" 
        GridLines="None" AllowPaging="True" PageSize="5" 
                   
                     Width="826px" AutoGenerateColumns="False" 
        onpageindexchanging="GridView1_PageIndexChanging" BackColor="White" 
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1"> 
                    
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <Columns>
                         <asp:BoundField HeaderText="Name" 
                           DataField="Name"  >
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                             <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                         </asp:BoundField>
                        <asp:BoundField HeaderText="Length"
                           DataField="Length"  >
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                         </asp:BoundField>
                         <asp:BoundField HeaderText="Creation Time" 
                          DataField="CreationTime"   >
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                         </asp:BoundField>
                                          
                         <asp:TemplateField HeaderText="Message Content">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MessageContent") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                 <asp:Literal ID="Literal1"  runat="server" Text='<%# Bind("MessageContent") %>'></asp:Literal>
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                             <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                         </asp:TemplateField>
                       
                         <asp:TemplateField ShowHeader="False" HeaderText="DELETE">
                             <ItemTemplate>
                                 <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# string.Format("MessageListing.aspx?Name={0}", HttpUtility.UrlEncode(Eval("Name").ToString())) %>'>Delete</asp:HyperLink>
                                  
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                             <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                         </asp:TemplateField>
                       
                         <asp:TemplateField HeaderText="EDIT">
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                   PostBackUrl='<%# string.Format("MessageListing.aspx?Edit={0}", HttpUtility.UrlEncode(Eval("Name").ToString())) %>'  onclick="LinkButton1_Click">Edit</asp:LinkButton>
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                             <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                         </asp:TemplateField>
                       
  </Columns>
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    
   
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

