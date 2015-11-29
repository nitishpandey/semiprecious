<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="AllLots.aspx.cs" Inherits="PacketInformation_AllLots" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="lotid" DataSourceID="SqlDataSource1" AllowPaging="True" 
                AllowSorting="True" AutoGenerateEditButton="True">
                <Columns>
                    <asp:BoundField DataField="lotdate" HeaderText="lotdate" 
                        SortExpression="lotdate" />
                    <asp:BoundField DataField="lotid" HeaderText="lotid" InsertVisible="False" 
                        ReadOnly="True" SortExpression="lotid" />
                    <asp:BoundField DataField="status" HeaderText="status" 
                        SortExpression="status" />
                    <asp:BoundField DataField="suppliercode" HeaderText="suppliercode" 
                        SortExpression="suppliercode" />
                    <asp:BoundField DataField="totalvalue" HeaderText="totalvalue" 
                        SortExpression="totalvalue" />
                    <asp:BoundField DataField="updatedby" HeaderText="updatedby" 
                        SortExpression="updatedby" />
                    <asp:BoundField DataField="totalAddedValue" HeaderText="totalAddedValue" 
                        SortExpression="totalAddedValue" />
                    <asp:BoundField DataField="totalAddedUantity" HeaderText="totalAddedUantity" 
                        SortExpression="totalAddedUantity" />
                    <asp:BoundField DataField="totalAddedWeight" HeaderText="totalAddedWeight" 
                        SortExpression="totalAddedWeight" />
                    <asp:BoundField DataField="totalquantity" HeaderText="totalquantity" 
                        SortExpression="totalquantity" />
                    <asp:BoundField DataField="totalweight" HeaderText="totalweight" 
                        SortExpression="totalweight" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" 
                DeleteCommand="DELETE FROM [LotInfo] WHERE [lotid] = @original_lotid AND [lotdate] = @original_lotdate AND [status] = @original_status AND [suppliercode] = @original_suppliercode AND [totalvalue] = @original_totalvalue AND [updatedby] = @original_updatedby AND [totalAddedValue] = @original_totalAddedValue AND [totalAddedUantity] = @original_totalAddedUantity AND [totalAddedWeight] = @original_totalAddedWeight AND [totalquantity] = @original_totalquantity AND [totalweight] = @original_totalweight" 
                InsertCommand="INSERT INTO [LotInfo] ([lotdate], [status], [suppliercode], [totalvalue], [updatedby], [totalAddedValue], [totalAddedUantity], [totalAddedWeight], [totalquantity], [totalweight]) VALUES (@lotdate, @status, @suppliercode, @totalvalue, @updatedby, @totalAddedValue, @totalAddedUantity, @totalAddedWeight, @totalquantity, @totalweight)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [lotdate], [lotid], [status], [suppliercode], [totalvalue], [updatedby], [totalAddedValue], [totalAddedUantity], [totalAddedWeight], [totalquantity], [totalweight] FROM [LotInfo] ORDER BY [lotdate] DESC" 
                UpdateCommand="UPDATE [LotInfo] SET  [status] = @status, [suppliercode] = @suppliercode, [totalvalue] = @totalvalue, [updatedby] = @updatedby, [totalAddedValue] = @totalAddedValue, [totalAddedUantity] = @totalAddedUantity, [totalAddedWeight] = @totalAddedWeight, [totalquantity] = @totalquantity, [totalweight] = @totalweight WHERE [lotid] = @original_lotid AND [lotdate] = @original_lotdate AND [status] = @original_status AND [suppliercode] = @original_suppliercode AND [totalvalue] = @original_totalvalue AND [updatedby] = @original_updatedby AND [totalAddedValue] = @original_totalAddedValue AND [totalAddedUantity] = @original_totalAddedUantity AND [totalAddedWeight] = @original_totalAddedWeight AND [totalquantity] = @original_totalquantity AND [totalweight] = @original_totalweight">
                <DeleteParameters>
                    <asp:Parameter Name="original_lotid" Type="Int32" />
                    <asp:Parameter Name="original_lotdate" Type="DateTime" />
                    <asp:Parameter Name="original_status" Type="String" />
                    <asp:Parameter Name="original_suppliercode" Type="String" />
                    <asp:Parameter Name="original_totalvalue" Type="Double" />
                    <asp:Parameter Name="original_updatedby" Type="String" />
                    <asp:Parameter Name="original_totalAddedValue" Type="Double" />
                    <asp:Parameter Name="original_totalAddedUantity" Type="Int32" />
                    <asp:Parameter Name="original_totalAddedWeight" Type="Double" />
                    <asp:Parameter Name="original_totalquantity" Type="Int32" />
                    <asp:Parameter Name="original_totalweight" Type="Double" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="lotdate" Type="DateTime" />
                    <asp:Parameter Name="status" Type="String" />
                    <asp:Parameter Name="suppliercode" Type="String" />
                    <asp:Parameter Name="totalvalue" Type="Double" />
                    <asp:Parameter Name="updatedby" Type="String" />
                    <asp:Parameter Name="totalAddedValue" Type="Double" />
                    <asp:Parameter Name="totalAddedUantity" Type="Int32" />
                    <asp:Parameter Name="totalAddedWeight" Type="Double" />
                    <asp:Parameter Name="totalquantity" Type="Int32" />
                    <asp:Parameter Name="totalweight" Type="Double" />
                    <asp:Parameter Name="original_lotid" Type="Int32" />
                    <asp:Parameter Name="original_lotdate" Type="DateTime" />
                    <asp:Parameter Name="original_status" Type="String" />
                    <asp:Parameter Name="original_suppliercode" Type="String" />
                    <asp:Parameter Name="original_totalvalue" Type="Double" />
                    <asp:Parameter Name="original_updatedby" Type="String" />
                    <asp:Parameter Name="original_totalAddedValue" Type="Double" />
                    <asp:Parameter Name="original_totalAddedUantity" Type="Int32" />
                    <asp:Parameter Name="original_totalAddedWeight" Type="Double" />
                    <asp:Parameter Name="original_totalquantity" Type="Int32" />
                    <asp:Parameter Name="original_totalweight" Type="Double" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="lotdate" Type="DateTime" />
                    <asp:Parameter Name="status" Type="String" />
                    <asp:Parameter Name="suppliercode" Type="String" />
                    <asp:Parameter Name="totalvalue" Type="Double" />
                    <asp:Parameter Name="updatedby" Type="String" />
                    <asp:Parameter Name="totalAddedValue" Type="Double" />
                    <asp:Parameter Name="totalAddedUantity" Type="Int32" />
                    <asp:Parameter Name="totalAddedWeight" Type="Double" />
                    <asp:Parameter Name="totalquantity" Type="Int32" />
                    <asp:Parameter Name="totalweight" Type="Double" />
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
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

