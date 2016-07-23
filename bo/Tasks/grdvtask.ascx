<%@ Control Language="C#" AutoEventWireup="true" CodeFile="grdvtask.ascx.cs" Inherits="Task_grdvtask" %>
    <table cellpadding="0" cellspacing="0" class="style9">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;
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
        <tr>
            <td>
                &nbsp;</td>
            <td align="left"  valign="top">
<asp:GridView ID="GrdVTask" runat="server" CellPadding="4"    ForeColor="#333333" 
                    AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
                    PageSize="10" GridLines="Horizontal" 
                    onpageindexchanging="GrdVTask_PageIndexChanging">
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                    <asp:BoundField DataField="Task Id" HeaderText="taskid" 
                            SortExpression="taskid" Visible="false">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="tdtoi" HeaderText="Initiated" DataFormatString = "{0:d}"
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
						        <asp:BoundField DataField="action" HeaderText="For" SortExpression="action">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pdc" HeaderText="PDC" SortExpression="pdc" DataFormatString = "{0:d}">
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                       	 <asp:TemplateField HeaderText="Details" InsertVisible="False" 
                            SortExpression="detail">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" ReadOnly="True" runat="server"
                                    Text='<%# Bind("detail", "{0}") %>' TextMode="MultiLine" 
                                    BackColor="#FFFFFF" Width="300px" height="100px"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="mainsubject" HeaderText="mainsubject" 
                            SortExpression="mainsubject" Visible="False" />
                        <asp:BoundField DataField="action" HeaderText="action" SortExpression="action" 
                            Visible="False" />
                        <asp:BoundField DataField="info" HeaderText="info" SortExpression="info" 
                            Visible="False" />
                        <asp:BoundField DataField="closedon" HeaderText="closedon" 
                            SortExpression="closedon" Visible="False" />
                        <asp:BoundField DataField="task_type" HeaderText="task_type" 
                            SortExpression="task_type" Visible="False" />
                        <asp:BoundField DataField="updatedby" HeaderText="updatedby" 
                            SortExpression="updatedby" Visible="False" />
                        <asp:BoundField DataField="tdtoi1" HeaderText="tdtoi1" SortExpression="tdtoi1" 
                            Visible="False" />
                        <asp:BoundField DataField="tby1" HeaderText="tby1" SortExpression="tby1" 
                            Visible="False" />
                            
                       <asp:TemplateField HeaderText="Add Response">
                       <ItemTemplate>
                       <asp:HyperLink  ID="HyperLink1" runat="server"
                       NavigateUrl='<%# string.Format("AddResponse.aspx?taskid={0}&action={1}&status={2}&tby={3}",Eval("taskid").ToString(),HttpUtility.UrlEncode(Eval("action").ToString()),HttpUtility.UrlEncode(Eval("status").ToString()),HttpUtility.UrlEncode(Eval("tby").ToString())) %>' Text="Details"/>
                       </ItemTemplate> 
                       </asp:TemplateField> 
					   <asp:TemplateField HeaderText="Type">
                       <ItemTemplate>
                       <asp:HyperLink  ID="HyperLink2" runat="server"
                       NavigateUrl='<%# string.Format("task_target.cfm?cartid={0}",HttpUtility.UrlEncode(Eval("mainsubject").ToString())) %>' Text="Target"/>
                       </ItemTemplate> 
                       </asp:TemplateField> 
					  
					  
                    </Columns>
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
                   <br />
                <asp:Label ID="Lblerrormessage" runat="server" CssClass="error_label"></asp:Label>
                <br />
                <asp:Label ID="Lblmessage" runat="server" CssClass="error_label" 
                    Text="Note:"></asp:Label>Click on PDC To View PDC Modification History, Click on Subject to View Details/Respond/Update status.
                <br />
                <br /></td>
            <td>
                &nbsp;</td>
        </tr>
    </table>


