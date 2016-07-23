<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="CouponCertificate.aspx.cs" Inherits="coupona" Title="Gift Coupons" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>Coupon Management System</title>
    <style type="text/css">
        .style11
        {
        }
        .style12
        {
        }
        .style15
        {
            height: 51px;
        }
        .style18
        {
            height: 39px;
        }
        .style19
        {
        }
        .style20
        {
            width: 298px;
        }
    </style>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="style1">
        <tr>
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
            <td align="left" valign="top">
                <table cellspacing="1" class="style1" align="right">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style12" align="center" colspan="3">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" 
                                Font-Underline="True" ForeColor="#CC6600" Text="COUPON CERTIFICATE"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style20">
                            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="**"></asp:Label>
&nbsp;<asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="#660033" Text="Required fields"></asp:Label>
                        </td>
                        <td class="style19">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            </td>
                        <td align="right" class="style20" >
                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="**"></asp:Label>
&nbsp;<asp:Label ID="LblCouponCode" runat="server" Text="Coupon  Code "></asp:Label>
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" 
                                Text=":"></asp:Label>
                        </td>
                        <td class="style19" >
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtCouponCode" runat="server" MaxLength="12" Width="154px" 
                                CssClass="textbox"></asp:TextBox>
&nbsp;</td>
                        <td class="style18">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TxtCouponCode" 
                                ErrorMessage="Please Enter your coupon code." CssClass="error_label"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TxtCouponCode" ErrorMessage="It must be 12 characters ." 
                                ValidationExpression="([a-z,A-Z,0-9,^%#][0-9,a-z,A-z,#@!\^&\*]{11}$)" 
                                CssClass="error_label"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            </td>
                        <td align="right" class="style20" >
                            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="**"></asp:Label>
&nbsp;<asp:Label ID="LblCouponValue" runat="server" Text="Coupon Value (in $)"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Text=":"></asp:Label>
                        </td>
                        <td class="style19" >
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtCouponValue" runat="server" Width="154px" 
                                CssClass="textbox"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TxtCouponValue" 
                                ErrorMessage="Please Enter your coupon value." CssClass="error_label"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TxtCouponValue" ErrorMessage="It must be in integer." 
                                ValidationExpression="^\d+$" CssClass="error_label"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            &nbsp;</td>
                        <td align="right" class="style20" >
                            <asp:Label ID="Label11" runat="server" CssClass="error_label" Text="**"></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="Remark ( To whom )"></asp:Label>
                        </td>
                        <td class="style19" >
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="Txtremark" runat="server" CssClass="textbox" Width="154px"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="Txtremark" CssClass="error_label" 
                                ErrorMessage="Please enter remark !!"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style20">
                            &nbsp;</td>
                        <td class="style11" colspan="2">
                            <asp:Label ID="LblErrorMessage" runat="server" CssClass="lblErrorSymbol" 
                                Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style20">
                            &nbsp;</td>
                        <td class="style19" colspan="2">
                            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" Text="Save" 
                                Width="100px" BackColor="#0099CC" BorderColor="Silver" 
                                BorderStyle="Double" Font-Bold="True" ForeColor="White" Height="30px" />
                        &nbsp;
                            <asp:Button ID="BtnReset" runat="server"  Text="Reset" 
                                Width="100px" BackColor="#0099CC" BorderColor="Silver" 
                                BorderStyle="Double" Font-Bold="True" ForeColor="White" Height="30px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style20">
                            &nbsp;</td>
                        <td class="style19">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="center" colspan="3">
                            <asp:Label ID="Label3" runat="server" CssClass="lableHeading" Font-Bold="True" 
                                Font-Overline="True" Font-Underline="True" ForeColor="#0066CC" 
                                Text="Coupon Code List"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td align="center" colspan="3">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSource1" ShowFooter="True" 
                                Width="688px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <Columns>
                                    <asp:BoundField DataField="CouponCode" HeaderText="Coupon Code" ReadOnly="True" 
                                        SortExpression="CouponCode" >
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ValueUSD" HeaderText="Amount" 
                                        SortExpression="ValueUSD" DataFormatString="${0:C2}" >
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Dateissued" HeaderText="Issued Date" 
                                        SortExpression="Dateissued" >
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DateUsed" HeaderText="Used Date" 
                                        SortExpression="DateUsed" >
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="CART ID" SortExpression="cartid">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink3" runat="server" 
                                               NavigateUrl='<%# string.Format("http://www.semiprecious.in/itemsell.cfm?cartid={0}",HttpUtility.UrlEncode(Eval("cartid").ToString())) %>' 
                                               Text='<%# Bind("cartid", "{0}") %>'></asp:HyperLink>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cartid") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="remark" HeaderText="Remark" 
                                        SortExpression="remark" >
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                                    </asp:BoundField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConflictDetection="CompareAllValues" 
                                ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" 
                                DeleteCommand="DELETE FROM [certificatecode] WHERE [CouponCode] = @original_CouponCode" 
                                InsertCommand="INSERT INTO [certificatecode] ([CouponCode], [ValueUSD], [Dateissued], [DateUsed], [cartid]) VALUES (@CouponCode, @ValueUSD, @Dateissued, @DateUsed, @cartid)" 
                                OldValuesParameterFormatString="original_{0}" 
                                SelectCommand="SELECT * FROM [certificatecode] ORDER BY [Dateissued] DESC " 
                                
                                UpdateCommand="UPDATE [certificatecode] SET [ValueUSD] = @ValueUSD, [Dateissued] = @Dateissued, [DateUsed] = @DateUsed, [cartid] = @cartid WHERE [CouponCode] = @original_CouponCode AND [ValueUSD] = @original_ValueUSD AND [Dateissued] = @original_Dateissued AND [DateUsed] = @original_DateUsed AND [cartid] = @original_cartid">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_CouponCode" Type="String" />
                                   
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ValueUSD" Type="String" />
                                    <asp:Parameter Name="Dateissued" Type="DateTime" />
                                    <asp:Parameter Name="DateUsed" Type="DateTime" />
                                    <asp:Parameter Name="cartid" Type="Int32" />
                                    <asp:Parameter Name="original_CouponCode" Type="String" />
                                    <asp:Parameter Name="original_ValueUSD" Type="String" />
                                    <asp:Parameter Name="original_Dateissued" Type="DateTime" />
                                    <asp:Parameter Name="original_DateUsed" Type="DateTime" />
                                    <asp:Parameter Name="original_cartid" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CouponCode" Type="String" />
                                    <asp:Parameter Name="ValueUSD" Type="String" />
                                    <asp:Parameter Name="Dateissued" Type="DateTime" />
                                    <asp:Parameter Name="DateUsed" Type="DateTime" />
                                    <asp:Parameter Name="cartid" Type="Int32" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
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
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

