<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="taskclosed.aspx.cs" Inherits="Tasks_taskclosed" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style11
        {
            width: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="LblHeading" runat="server" Font-Bold="True" Font-Names="Tahoma" 
                    Font-Size="Small" Font-Underline="False" ForeColor="#0066CC"></asp:Label>
                <br />
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td align="left" rowspan="2" valign="top">
                <asp:GridView ID="GrdVtaskclosed" runat="server" BackColor="White" 
                    BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    ForeColor="Black" GridLines="Vertical" 
                    onpageindexchanging="GridView1_PageIndexChanging" 
                    AutoGenerateColumns="False">
                    <Columns>
                         <asp:BoundField DataField="taskid" HeaderText="Task ID" 
                            SortExpression="taskid" visible="false" />
                        <asp:BoundField DataField="tdtoi" HeaderText="Initiated Date" DataFormatString = "{0:d}"
                            SortExpression="tdtoi"  />
                        <asp:BoundField DataField="subject" HeaderText="Subject" 
                            SortExpression="subject" />
                        <asp:BoundField DataField="mainsubject" HeaderText="mainsubject" 
                            SortExpression="mainsubject" Visible="False" />
                        <asp:BoundField DataField="tby" HeaderText="By" SortExpression="tby" 
                            Visible="False" />
                        <asp:BoundField DataField="action" HeaderText="Action" 
                            SortExpression="action" />
                        <asp:BoundField DataField="info" HeaderText="Info" SortExpression="info" 
                            Visible="False" />
                        <asp:BoundField DataField="status" HeaderText="Status" 
                            SortExpression="status" />
                        <asp:BoundField DataField="pdc" HeaderText="PDC" SortExpression="pdc" DataFormatString = "{0:d}"/>
                        <asp:BoundField DataField="closedon" HeaderText="closedon" 
                            SortExpression="closedon" Visible="False" />
                        <asp:BoundField DataField="task_type" HeaderText="task_type" 
                            SortExpression="task_type" Visible="False" />
                        <asp:BoundField DataField="updatedby" HeaderText="updatedby" 
                            SortExpression="updatedby" Visible="False" />
                        <asp:BoundField DataField="tdtoi1" HeaderText="tdtoi1" 
                            SortExpression="tdtoi1" Visible="False" />
                        <asp:BoundField DataField="tby1" HeaderText="tby1" SortExpression="tby1" 
                            Visible="False" />
                        <asp:TemplateField HeaderText="Detail" InsertVisible="False" 
                            SortExpression="detail">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("detail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("detail", "{0}") %>' 
                                  ReadOnly="True" BackColor="white" Width="300px" TextMode="MultiLine"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        
                                   
                        <asp:TemplateField HeaderText="Add Response">
                        <ItemTemplate>
                        <asp:HyperLink  ID="HyperLink1" runat="server"
                         NavigateUrl='<%# string.Format("AddResponse.aspx?taskid={0}&tby={1}&status={2}&pdc={3}", HttpUtility.UrlEncode(Eval("taskid").ToString()),HttpUtility.UrlEncode(Eval("tby").ToString()),HttpUtility.UrlEncode(Eval("status").ToString()),HttpUtility.UrlEncode(Eval("pdc").ToString())) %>' Text="view"/>
                        </ItemTemplate> 
                        </asp:TemplateField> 
                       
                                             
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <RowStyle BackColor="#F7F7DE" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
            <td >
                </td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

