<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="AddResponse.aspx.cs" Inherits="Task_AddResponse" Title="Task Details & Response" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<script runat="server">
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/StyleSheet.css" rel="stylesheet" type="text/css" />
	<script language="javascript1.2">
 var status_help = '<div style="width:100%;height:20px;background:white;border-bottom:1px outset gray;"><span id="help_title">What is Status?</span><span id="help_close" style="color:red">X</span></div>&nbsp;Status of a task moves from Active (or new)  to Ack. This can be done only by the person who is supposed to do the task. When the task is completed the same person can move the task to completed. Once marked as completed the initiator has to mark the task as closed if satisfied. If not he/she can bring it back to Ack status. In case the initiated task is not yet marked Ack by reciever then the initiator can also abort the task or close it prematurely. Abort means forget this. Close means mission acomplished.';
$(document).ready(function () {
	$("#ContentPlaceHolder1_TxtDate").datepicker();
	$("span#help_status").click(
	function()
	{
	$("div#help").html(status_help);
	$("div#help").show("slow");
	$("span#help_close").click(
	function()
	{
//	alert(1);
	$(this).parent().parent().hide("slow");
	}
	);
	
	});

});
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server"     contentplaceholderid="ContentPlaceHolder1">
<div id="help" style="background:white;z-index:3;position:absolute;top:200px;left:20%;width:400px;padding:2px;border:2x darkorange solid;display:none;">

</div>
    <div >
       <table>
            <tr style="height:30px">
                <td>
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;<asp:Label ID="LblTaskManager" runat="server" Text="Task Manager" 
                        CssClass="lableHeading"></asp:Label>
                    </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            
            <tr>
                <td >
                    </td>

                    <td  colspan="3">
                    <asp:GridView ID="GrdVAddResponse" runat="server" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <Columns>
                        <asp:BoundField DataField="taskid" HeaderText="Task Id" SortExpression="taskid"  Visible="false"/>
                        <asp:BoundField DataField="tdtoi" HeaderText="Date" DataFormatString = "{0:d}"
                            SortExpression="tdtoi" />
            	        <asp:BoundField DataField="pdc" HeaderText="PDC" SortExpression="pdc" DataFormatString = "{0:d}"/>
				        <asp:BoundField DataField="subject" HeaderText="Subject" 
                            SortExpression="subject" />
							   <asp:TemplateField HeaderText="Target">
                       <ItemTemplate>
                       <asp:HyperLink Target="target"  ID="HyperLink2" runat="server"
                       NavigateUrl='<%# string.Format("task_target.cfm?cartid={0}",HttpUtility.UrlEncode(Eval("mainsubject").ToString())) %>' Text="Target"/>
                       </ItemTemplate> 
                       </asp:TemplateField> 
                        <asp:BoundField DataField="tby" HeaderText="By" SortExpression="tby" />
                        <asp:BoundField DataField="action" HeaderText="Action" 
                            SortExpression="action" />
                       
                        <asp:BoundField DataField="status" HeaderText="Status" 
                            SortExpression="status" />

                        <asp:BoundField DataField="closedon" HeaderText="closedon" 
                            SortExpression="closedon" Visible="False" />
                        <asp:BoundField DataField="task_type" HeaderText="task_type" 
                            SortExpression="task_type" Visible="False" />
                        <asp:BoundField DataField="updatedby" HeaderText="updatedby" 
                            SortExpression="updatedby" Visible="False" />
                        <asp:TemplateField HeaderText="Details" InsertVisible="False" 
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
                                             
                    </Columns>
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                       
                        <br />
                        <br />
                    </td>
                    <td >
                    </td>


            </tr>
           
            <tr>
           
            <td>
            </td>
            <td class="col_width">
                <asp:Label ID="LblComments" runat="server" Text="Comments" CssClass="lable"></asp:Label>
                </td>
            <td align="left" valign="top" class="col_width2" colspan="2">
                  <asp:GridView ID="GrdComments" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                            CellPadding="3" 
                             
                      AllowPaging="True" onpageindexchanging="GrdComments_PageIndexChanging" 
                      PageSize="5"> 
                            
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <RowStyle ForeColor="#000066" />
                            
                            <Columns>
                                <asp:BoundField DataField="added" HeaderText="Date" SortExpression="added" >
                               
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:BoundField>
                               
                                <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" BackColor="White" ReadOnly="True" 
                                            Text='<%# bind("Comments") %>' TextMode="MultiLine" Width="300px"></asp:TextBox>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Comments  By" SortExpression="addedby">
                                         <EditItemTemplate>
                                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("addedby") %>'></asp:TextBox>
                                         </EditItemTemplate>
                                         <ItemTemplate>
                                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("addedby") %>'></asp:Label>
                                             &nbsp;
                                         </ItemTemplate>
                                         <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                                </asp:TemplateField>
                               
                            </Columns>
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        </asp:GridView></td>
                        <br />
                        <br /></td>
            <td>
            </td>
            
           </tr>
                
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="col_width">
                        &nbsp;</td>
                    <td class="col_width2">
                        &nbsp;</td>
                    <td class="style9">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                
                <tr>
                    <td>
                    </td>
                    <td class="col_width">
                        <asp:Label ID="LblAddresponse" runat="server" CssClass="lable" 
                            Text="Add Response"></asp:Label>
                    </td>
                    <td class="col_width2">
                        <asp:TextBox ID="TxtAddResponse" runat="server" CssClass="txtdetails" 
                            Height="60px" TextMode="MultiLine" Width="536px"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:Button ID="BtnSubmitresponse" runat="server" CssClass="Button" 
                            ForeColor="White" onclick="BtnSubmitresponse_Click" Text="Add  Response" 
                            Width="117px" />
                        </td>
                    <td class="style9">
                        &nbsp;</td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                    </td>
                    <td class="style17">
                        <asp:Label ID="LblAcknowledge" runat="server" CssClass="lable" 
                            Text="Task Status"></asp:Label>
                    </td>
                    <td class="style16">
                        <asp:DropDownList ID="DrplAcknowlege" runat="server" 
                            AppendDataBoundItems="True" CssClass="drplAddresponse">
                            <asp:ListItem Text="Select Status" Value="none" />
                        </asp:DropDownList>
                        &nbsp;&nbsp; <asp:Button ID="BtnAcknowledgement" runat="server" CssClass="Button" 
                            ForeColor="White" onclick="BtnAcknowledgement_Click" Text="Modify Status" 
                            Width="117px" />
                    </td>
                    <td class="style9">[<span id="help_status">?</span>]
                        </td>
                    <td class="style16">
                    </td>
                </tr>
                
                <tr>
                    <td class="style12">
                        </td>
                    <td class="style10">
                        <asp:Label ID="LblModifyPDC" runat="server" Text="Modify PDC" CssClass="lable"></asp:Label>
                    </td>
                    <td class="style12">
                        <asp:TextBox ID="txtmodifypdc" runat="server" CssClass="modifypdc"></asp:TextBox>
                        <cc1:CalendarExtender  ID="txtmodifypdc_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="txtmodifypdc" Format="MM/dd/yyyy" 
                            PopupPosition="TopRight">
                        </cc1:CalendarExtender>
                         &nbsp;&nbsp; 
                        <asp:Button ID="Btnmodifypdc" runat="server" CssClass="Button" 
                            ForeColor="White" onclick="Btnmodifypdc_Click" Text="Modify PDC" 
                            Width="117px" />
                    </td>
                    <td class="style9">
                        </td>
                    <td class="style12">
                        </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="col_width" colspan="2">
                        &nbsp;</td>
                    <td class="style9">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style13">
                        &nbsp;</td>
                    <td class="style11">
                        &nbsp;</td>
                    <td class="style14">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <asp:Label ID="LblAddresponseTby" runat="server"></asp:Label>
                    <asp:Label ID="Lbltime" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="Lblresponsetdtoi" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td class="style9">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
           
        </table>
    
    </div>
                        </asp:Content>


