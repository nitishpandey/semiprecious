<%@ Page Language="C#" AutoEventWireup="true" Title="Site Configuration" MasterPageFile="~/TaskManager.master"  CodeFile="properties.aspx.cs" Inherits="property" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
     
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="../admin.cfm">Admin 
        Menu</asp:HyperLink>
        &nbsp;
&nbsp;<br />
&nbsp;&nbsp;
    <div>
      <table style="border: medium solid #DBDBDB; vertical-align:middle; width: 573px; height: 283px; margin-left: 184px;">
     <tr><td colspan="3" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" 
             ForeColor="#0066FF" Text="Add Property Value" Font-Underline="False"></asp:Label>
                    </td></tr>
     <tr style="height:1px;"><td colspan="3"  bgcolor="#CCCCCC" >
         &nbsp;</td></tr>
    <tr style="line-height: normal">
    <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
        <asp:Label ID="Label2" runat="server" Text="Property Name " 
            CssClass="fontstyle"></asp:Label>
        </td>
    <td align="left" >
      
        <asp:TextBox ID="TxtPropertyName" runat="server" CssClass="textbox"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator CssClass="error_label" ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TxtPropertyName" Display="Dynamic" ErrorMessage="Required" 
            ToolTip="Property Name is required .">**</asp:RequiredFieldValidator>
        </td>
    <td ></td>
    </tr>
    <tr>
    <td ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Label ID="Label3" runat="server" Text="Property Value " 
            CssClass="fontstyle"></asp:Label>
        </td>
    <td align="left" valign="top" >
                
       
        <asp:TextBox ID="TxtPropertyValue" runat="server" CssClass="textbox"></asp:TextBox>
                
       
        &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TxtPropertyValue" ErrorMessage="Required" 
            ToolTip="Property value is required .">**</asp:RequiredFieldValidator>
                
       
        </td>
    <td class="style16"></td>
    </tr>
    <tr>
    <td class="style12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Label ID="Label9" runat="server" Text="Property Group " 
            CssClass="fontstyle"></asp:Label>
        </td>
    <td align="left" valign="top" class="style13">
                
       
        <asp:TextBox ID="TxtPgroup" runat="server" CssClass="textbox"></asp:TextBox>
                
       
        &nbsp;&nbsp;
                
       
        </td>
    <td class="style30"></td>
    </tr>
    
    <tr>
    <td class="style12">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="Lblstartdate" runat="server" Text="Start Date " 
            CssClass="fontstyle"></asp:Label>
        </td>
    <td align="left" valign="top" class="style13">
        <asp:TextBox ID="TxtStartDate" runat="server" CssClass="textbox" 
            ></asp:TextBox>
                
       
        <cc1:CalendarExtender ID="TxtStartDate_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="TxtStartDate">
        </cc1:CalendarExtender>
        </td>
    <td ></td>
    </tr>
    <tr>
    <td class="style12">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Lblenddate" runat="server" Text="End Date " CssClass="fontstyle"></asp:Label>
        </td>
    <td align="left" valign="top" class="style13">
        <asp:TextBox ID="TxtEnddate" runat="server" CssClass="textbox"></asp:TextBox>
        <cc1:CalendarExtender ID="TxtEnddate_CalendarExtender" runat="server" 
            Enabled="True" TargetControlID="TxtEnddate">
        </cc1:CalendarExtender>
                
       
        </td>
    <td class="style24"></td>
    </tr>
    <tr>
    <td class="style12">
        </td>
    <td class="style15">
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" 
            onclick="BtnSubmit_Click" Height="26px" Width="71px" CssClass="Button" 
            ForeColor="White" />
&nbsp;&nbsp;
        <asp:Button ID="Btnclear" runat="server" Text="Clear" CausesValidation="False" 
            onclick="Btnclear_Click" Height="26px" Width="71px" CssClass="Button" 
            ForeColor="White" />
        &nbsp;&nbsp;&nbsp;
        </td>
    <td class="style11"></td>
    </tr>

    <tr>
    <td class="style2" colspan="3">
        &nbsp;&nbsp;<asp:Label ID="Lblmessage"  runat="server" CssClass="error_label" 
            Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
		&nbsp;
        <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
		&nbsp;&nbsp;
        </td>
    </tr>

    </table>
 &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CellPadding="4" 
                DataKeyNames="pid" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                style="margin-left: 88px">
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="pid" HeaderText="pid" InsertVisible="False" 
                        ReadOnly="True" SortExpression="pid" Visible="False" />
                    <asp:BoundField DataField="pgroup" HeaderText="Group" 
                        SortExpression="pgroup" >
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PName" HeaderText="Property Name" 
                        ReadOnly="True" SortExpression="PName">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PValue" HeaderText="Property Value" 
                        SortExpression="PValue">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="startdate" HeaderText="Start Date" 
                        SortExpression="startdate" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="enddate" HeaderText="End Date" 
                        SortExpression="enddate" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="createdby" HeaderText="Updated By" 
                        SortExpression="createdby" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:BoundField>
                </Columns>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConflictDetection="CompareAllValues" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Properties] WHERE [pid] = @original_pid" 
                OldValuesParameterFormatString="original_{0}" 
               SelectCommand="SELECT * FROM [Properties] ORDER BY [Pgroup],[PName]" 
                InsertCommand="INSERT INTO [Properties] ([pid], [PName], [PValue], [startdate], [enddate], [createdby]) VALUES (?, ?, ?, ?, ?, ?)" 

                UpdateCommand="UPDATE [Properties] SET  [PValue] = @pvalue,  [pgroup] = @pgroup,[createdby] = @createdby WHERE [pid] = @original_pid ">

                <DeleteParameters>
                    <asp:Parameter Name="original_pid" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PValue" Type="String" />
                    <asp:Parameter Name="pgroup" Type="String" />
                    <asp:SessionParameter Name="createdby" SessionField="Name" Type="String" />
                    <asp:Parameter Name="original_pid" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="pid" Type="Int32" />
                    <asp:Parameter Name="PName" Type="String" />
                    <asp:Parameter Name="PValue" Type="String" />
                    <asp:Parameter Name="startdate" Type="DateTime" />
                    <asp:Parameter Name="enddate" Type="DateTime" />
               		<asp:Parameter Name="pgroup" Type="String" />
                    <asp:Parameter Name="createdby" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </div>
    <p>
&nbsp;</p>
    
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    
      
    <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
    
    
    
</asp:Content>
