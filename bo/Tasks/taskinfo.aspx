<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="taskinfo.aspx.cs" Inherits="Tasks_taskinfo" Title="Task Manager - FYI Tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style9">
        <tr>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
            <td>
                </td>
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
            <td align="left" colspan="2" rowspan="2" valign="top">
                <asp:GridView ID="GrdVtaskinfo" runat="server" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" 
                    onpageindexchanging="GrdVtaskinfo_PageIndexChanging" AllowPaging="True" 
                    PageSize="5">
                    <Columns>
                    <asp:BoundField DataField="taskid" HeaderText="Task Id" 
                            SortExpression="taskid" Visible="false">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                   <asp:BoundField DataField="tdtoi" HeaderText="Initiated Date" DataFormatString = "{0:d}"
                            SortExpression="tdtoi">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        </asp:BoundField>
                        <asp:BoundField DataField="subject" HeaderText="Subject" 
                            SortExpression="subject">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tby" HeaderText="By" SortExpression="tby">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pdc" HeaderText="PDC" SortExpression="pdc" DataFormatString = "{0:d}">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
            
            <asp:BoundField DataField="action" HeaderText="Action" 
                SortExpression="action" />
            <asp:BoundField DataField="info" HeaderText="info" SortExpression="info" Visible="False" />
           
           
            <asp:BoundField DataField="closedon" HeaderText="closedon" 
                SortExpression="closedon" Visible="False" />
            <asp:BoundField DataField="task_type" HeaderText="task_type" 
                SortExpression="task_type" Visible="False" />
            <asp:BoundField DataField="updatedby" HeaderText="updatedby" 
                SortExpression="updatedby" Visible="False" />
            <asp:BoundField DataField="infoto" HeaderText="Info To" 
                SortExpression="infoto" />
            <asp:BoundField DataField="taskid1" HeaderText="taskid1" 
                SortExpression="taskid1" Visible="False" />
             
              <asp:TemplateField HeaderText="Details" InsertVisible="False" 
                            SortExpression="detail">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("detail") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" 
                                    Text='<%# Bind("detail", "{0}") %>' TextMode="MultiLine" 
                                    BackColor="#FFFFCC" Width="300px"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>
             
                 <asp:TemplateField HeaderText="Add Response">
                       <ItemTemplate>
                       <asp:HyperLink  ID="HyperLink1" runat="server"
                       NavigateUrl='<%# string.Format("AddResponse.aspx?taskid={0}&status={1}&pdc={2}&tby={3}&infoto={4}",HttpUtility.UrlEncode(Eval("taskid").ToString()),HttpUtility.UrlEncode(Eval("status").ToString()),HttpUtility.UrlEncode(Eval("pdc").ToString()),HttpUtility.UrlEncode(Eval("tby").ToString()),HttpUtility.UrlEncode(Eval("infoto").ToString())) %>' Text="View"/>
                       </ItemTemplate> 
               </asp:TemplateField> 
                
        </Columns>
                   
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
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

