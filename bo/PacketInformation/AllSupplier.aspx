<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="AllSupplier.aspx.cs" Inherits="PacketInformation_AllSupplier" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td>
            &nbsp;</td>
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
                        <td align="right">
                            &nbsp;</td>
                        <td align="center" class="style11" valign="top">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label13" runat="server" CssClass="lableHeading" 
                                Text="All Suppliers Information "></asp:Label>
                        &nbsp;
&nbsp;</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;
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
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td align="left" colspan="3" valign="top">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="SupplierID" DataSourceID="SqlDataSource2" 
                ForeColor="#333333" GridLines="Horizontal" AllowPaging="True" 
                AllowSorting="True" AutoGenerateEditButton="True">
                <PagerSettings Mode="NextPreviousFirstLast" Position="TopAndBottom" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" 
                        SortExpression="SupplierName" />
                    <asp:BoundField DataField="supliercode" HeaderText="Supplier Code" 
                        SortExpression="supliercode" ReadOnly="True" />
                    <asp:BoundField DataField="MobileNo" HeaderText="Mobile No." 
                        SortExpression="MobileNo" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="Phone No." 
                        SortExpression="PhoneNo" />
                    <asp:BoundField DataField="Address" HeaderText="Address" 
                        SortExpression="Address" />
                    <asp:BoundField DataField="emailaddress" HeaderText="Email" 
                        SortExpression="emailaddress" />
                    <asp:BoundField DataField="spldate" HeaderText="spldate" 
                        SortExpression="spldate" Visible="False" />
                    <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" 
                        InsertVisible="False" ReadOnly="True" SortExpression="SupplierID" 
                        Visible="False" />
                    <asp:BoundField DataField="Comments" HeaderText="Comments" 
                        SortExpression="Comments" Visible="False" />
                    <asp:BoundField DataField="Backupsupplier" HeaderText="Backupsupplier" 
                        SortExpression="Backup Supplier" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="updatedby" HeaderText="updatedby" 
                        SortExpression="updatedby" Visible="False" />
                </Columns>
                <PagerStyle BackColor="#336699" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:SqlConnectionString %>" 
                DeleteCommand="DELETE FROM [SupplierInfo] WHERE [SupplierID] = @original_SupplierID AND [SupplierName] = @original_SupplierName AND [supliercode] = @original_supliercode AND [MobileNo] = @original_MobileNo AND [PhoneNo] = @original_PhoneNo AND [Address] = @original_Address AND [emailaddress] = @original_emailaddress AND [spldate] = @original_spldate AND [Comments] = @original_Comments AND [Backupsupplier] = @original_Backupsupplier AND [updatedby] = @original_updatedby" 
                InsertCommand="INSERT INTO [SupplierInfo] ([SupplierName], [supliercode], [MobileNo], [PhoneNo], [Address], [emailaddress], [spldate], [Comments], [Backupsupplier], [updatedby]) VALUES (@SupplierName, @supliercode, @MobileNo, @PhoneNo, @Address, @emailaddress, @spldate, @Comments, @Backupsupplier, @updatedby)" 
                OldValuesParameterFormatString="original_{0}" 
                SelectCommand="SELECT [SupplierName], [supliercode], [MobileNo], [PhoneNo], [Address], [emailaddress], [spldate], [SupplierID], [Comments], [Backupsupplier], [updatedby] FROM [SupplierInfo]" 
                UpdateCommand="UPDATE [SupplierInfo] SET [SupplierName] = @SupplierName, [MobileNo] = @MobileNo, [PhoneNo] = @PhoneNo, [Address] = @Address, [emailaddress] = @emailaddress WHERE  [supliercode] = @original_supliercode ">
                <DeleteParameters>
                    <asp:Parameter Name="original_SupplierID" Type="Int32" />
                    <asp:Parameter Name="original_SupplierName" Type="String" />
                    <asp:Parameter Name="original_supliercode" Type="String" />
                    <asp:Parameter Name="original_MobileNo" Type="Int64" />
                    <asp:Parameter Name="original_PhoneNo" Type="Int64" />
                    <asp:Parameter Name="original_Address" Type="String" />
                    <asp:Parameter Name="original_emailaddress" Type="String" />
                    <asp:Parameter Name="original_spldate" Type="DateTime" />
                    <asp:Parameter Name="original_Comments" Type="String" />
                    <asp:Parameter Name="original_Backupsupplier" Type="String" />
                    <asp:Parameter Name="original_updatedby" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SupplierName" Type="String" />
                    <asp:Parameter Name="MobileNo" Type="Int64" />
                    <asp:Parameter Name="PhoneNo" Type="Int64" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="emailaddress" Type="String" />
                    <asp:Parameter Name="original_supliercode" Type="String" />
                   
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="SupplierName" Type="String" />
                    <asp:Parameter Name="supliercode" Type="String" />
                    <asp:Parameter Name="MobileNo" Type="Int64" />
                    <asp:Parameter Name="PhoneNo" Type="Int64" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="emailaddress" Type="String" />
                    <asp:Parameter Name="spldate" Type="DateTime" />
                    <asp:Parameter Name="Comments" Type="String" />
                    <asp:Parameter Name="Backupsupplier" Type="String" />
                    <asp:Parameter Name="updatedby" Type="String" />
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
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

