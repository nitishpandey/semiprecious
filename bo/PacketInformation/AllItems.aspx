<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="AllItems.aspx.cs" Inherits="PacketInformation_AllItems" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" colspan="2">
                <asp:Label ID="lblitemsinformation" runat="server" Font-Bold="True" 
                    ForeColor="#990000" Text="ITEMS INFORMATION"></asp:Label>
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
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" colspan="2" rowspan="2" valign="top">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                    CellPadding="4" DataKeyNames="lotid,newitem" DataSourceID="SqlDataSource1" 
                    GridLines="Horizontal">
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField DataField="lotid" HeaderText="Lot ID" ReadOnly="True" 
                            SortExpression="lotid" />
                        <asp:BoundField DataField="newitem" HeaderText="Item ID" ReadOnly="True" 
                            SortExpression="newitem" />
                        <asp:BoundField DataField="quantity" HeaderText="Quantity" 
                            SortExpression="quantity" />
                        <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                        <asp:BoundField DataField="weight" HeaderText="Weight" 
                            SortExpression="weight" />
                        <asp:BoundField DataField="updatedby" HeaderText="Updated By" 
                            SortExpression="updatedby" />
                        <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                               
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# string.Format("itemsupdate.aspx?lotid={0}&newitem={1}",HttpUtility.UrlEncode(Eval("lotid").ToString()),HttpUtility.UrlEncode(Eval("newitem").ToString())) %>' Text="Update"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="<%$ ConnectionStrings:sqlconnectionstring %>" 
                    DeleteCommand="DELETE FROM [ItemInfo] WHERE [lotid] = @original_lotid AND [newitem] = @original_newitem AND [quantity] = @original_quantity AND [size] = @original_size AND [weight] = @original_weight AND [updatedby] = @original_updatedby AND [cost] = @original_cost AND [date] = @original_date" 
                    InsertCommand="INSERT INTO [ItemInfo] ([lotid], [newitem], [quantity], [size], [weight], [updatedby], [cost], [date]) VALUES (@lotid, @newitem, @quantity, @size, @weight, @updatedby, @cost, @date)" 
                    OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="SELECT [lotid], [newitem], [quantity], [size], [weight], [updatedby], [cost], [date] FROM [ItemInfo] ORDER BY [date] DESC" 
                    UpdateCommand="UPDATE [ItemInfo] SET [quantity] = @quantity, [size] = @size, [weight] = @weight, [updatedby] = @updatedby, [cost] = @cost, [date] = @date WHERE [lotid] = @original_lotid AND [newitem] = @original_newitem AND [quantity] = @original_quantity AND [size] = @original_size AND [weight] = @original_weight AND [updatedby] = @original_updatedby AND [cost] = @original_cost AND [date] = @original_date">
                    <DeleteParameters>
                        <asp:Parameter Name="original_lotid" Type="Int32" />
                        <asp:Parameter Name="original_newitem" Type="Int32" />
                        <asp:Parameter Name="original_quantity" Type="Int32" />
                        <asp:Parameter Name="original_size" Type="Double" />
                        <asp:Parameter Name="original_weight" Type="Double" />
                        <asp:Parameter Name="original_updatedby" Type="String" />
                        <asp:Parameter Name="original_cost" Type="Double" />
                        <asp:Parameter Name="original_date" Type="DateTime" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="quantity" Type="Int32" />
                        <asp:Parameter Name="size" Type="Double" />
                        <asp:Parameter Name="weight" Type="Double" />
                        <asp:Parameter Name="updatedby" Type="String" />
                        <asp:Parameter Name="cost" Type="Double" />
                        <asp:Parameter Name="date" Type="DateTime" />
                        <asp:Parameter Name="original_lotid" Type="Int32" />
                        <asp:Parameter Name="original_newitem" Type="Int32" />
                        <asp:Parameter Name="original_quantity" Type="Int32" />
                        <asp:Parameter Name="original_size" Type="Double" />
                        <asp:Parameter Name="original_weight" Type="Double" />
                        <asp:Parameter Name="original_updatedby" Type="String" />
                        <asp:Parameter Name="original_cost" Type="Double" />
                        <asp:Parameter Name="original_date" Type="DateTime" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="lotid" Type="Int32" />
                        <asp:Parameter Name="newitem" Type="Int32" />
                        <asp:Parameter Name="quantity" Type="Int32" />
                        <asp:Parameter Name="size" Type="Double" />
                        <asp:Parameter Name="weight" Type="Double" />
                        <asp:Parameter Name="updatedby" Type="String" />
                        <asp:Parameter Name="cost" Type="Double" />
                        <asp:Parameter Name="date" Type="DateTime" />
                    </InsertParameters>
                </asp:SqlDataSource>
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

