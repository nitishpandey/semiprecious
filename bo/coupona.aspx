<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="coupona.aspx.cs" Inherits="coupona" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style11
        {
        }
        .style12
        {
            width: 201px;
        }
        .style15
        {
            height: 51px;
        }
        .style17
        {
            font-family: Tahoma;
            font-size: small;
            background-color: #F9F9F9;
            border-color: #C1E0FF;
            border-style: Solid;
            height: 39px;
        }
        .style18
        {
            height: 39px;
        }
    </style>
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
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
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style11">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style11">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style18">
                            </td>
                        <td align="right" class="style17">
                            <asp:Label ID="LblCouponCode" runat="server" Text="Coupon  Code :"></asp:Label>
                        </td>
                        <td class="style17">
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtCouponCode" runat="server" MaxLength="12" Width="154px"></asp:TextBox>
&nbsp;</td>
                        <td class="style18">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TxtCouponCode" ErrorMessage="Please Enter your coupon code."></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TxtCouponCode" ErrorMessage="It must be 12 characters ." 
                                ValidationExpression="([a-z,A-Z,0-9,^%#][0-9,a-z,A-z,#@!\^&\*]{11}$)"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style15">
                            </td>
                        <td align="right" class="textbox">
                            <asp:Label ID="LblCouponValue" runat="server" Text="Coupon Value :"></asp:Label>
                        </td>
                        <td class="textbox">
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TxtCouponValue" runat="server" Width="154px"></asp:TextBox>
                        </td>
                        <td class="style15">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TxtCouponValue" 
                                ErrorMessage="Please Enter your coupon value."></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TxtCouponValue" ErrorMessage="It must be in integer." 
                                ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style11" colspan="2">
                            <asp:Label ID="LblErrorMessage" runat="server" CssClass="lblErrorSymbol"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style11">
                            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" Text="Save" 
                                Width="100px" />
                        &nbsp;
                            <asp:Button ID="BtnReset" runat="server" onclick="BtnReset_Click" Text="Reset" 
                                Width="100px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="style12">
                            &nbsp;</td>
                        <td class="style11">
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
                                DataKeyNames="CouponCode" DataSourceID="SqlDataSource1" ShowFooter="True" 
                                Width="545px">
                                <Columns>
                                    <asp:BoundField DataField="CouponCode" HeaderText="Coupon Code" ReadOnly="True" 
                                        SortExpression="CouponCode" />
                                    <asp:BoundField DataField="ValueUSD" HeaderText="Amount" 
                                        SortExpression="ValueUSD" />
                                    <asp:BoundField DataField="Dateissued" HeaderText="Issued Date" 
                                        SortExpression="Dateissued" />
                                    <asp:BoundField DataField="DateUsed" HeaderText="Used Date" 
                                        SortExpression="DateUsed" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConflictDetection="CompareAllValues" 
                                ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" 
                                DeleteCommand="DELETE FROM [certificatecode] WHERE [CouponCode] = @original_CouponCode AND [ValueUSD] = @original_ValueUSD AND [Dateissued] = @original_Dateissued AND [DateUsed] = @original_DateUsed" 
                                InsertCommand="INSERT INTO [certificatecode] ([CouponCode], [ValueUSD], [Dateissued], [DateUsed]) VALUES (@CouponCode, @ValueUSD, @Dateissued, @DateUsed)" 
                                OldValuesParameterFormatString="original_{0}" 
                                SelectCommand="SELECT [CouponCode], [ValueUSD], [Dateissued], [DateUsed] FROM [certificatecode] ORDER BY [Dateissued]" 
                                UpdateCommand="UPDATE [certificatecode] SET [ValueUSD] = @ValueUSD, [Dateissued] = @Dateissued, [DateUsed] = @DateUsed WHERE [CouponCode] = @original_CouponCode AND [ValueUSD] = @original_ValueUSD AND [Dateissued] = @original_Dateissued AND [DateUsed] = @original_DateUsed">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_CouponCode" Type="String" />
                                    <asp:Parameter Name="original_ValueUSD" Type="String" />
                                    <asp:Parameter Name="original_Dateissued" Type="DateTime" />
                                    <asp:Parameter Name="original_DateUsed" Type="DateTime" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ValueUSD" Type="String" />
                                    <asp:Parameter Name="Dateissued" Type="DateTime" />
                                    <asp:Parameter Name="DateUsed" Type="DateTime" />
                                    <asp:Parameter Name="original_CouponCode" Type="String" />
                                    <asp:Parameter Name="original_ValueUSD" Type="String" />
                                    <asp:Parameter Name="original_Dateissued" Type="DateTime" />
                                    <asp:Parameter Name="original_DateUsed" Type="DateTime" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="CouponCode" Type="String" />
                                    <asp:Parameter Name="ValueUSD" Type="String" />
                                    <asp:Parameter Name="Dateissued" Type="DateTime" />
                                    <asp:Parameter Name="DateUsed" Type="DateTime" />
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

