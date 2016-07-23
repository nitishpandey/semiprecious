<%@ Page Language="C#" MasterPageFile="~/TaskManager.master" AutoEventWireup="true" CodeFile="AddTask.aspx.cs" Inherits="Tasks_AddTask" Title="Add A Task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <link href="../css/StyleSheet.css" rel="Stylesheet" type="text/css" />
<script src="/headhunting/js/jquery-1.5.min.js"></script>
<script type="text/javascript" src="/javascript/ui.core.js" ></script>
<script type="text/javascript" src="/javascript/jQuery.ui.datepicker.js" ></script>
 <script language="javascript" type="text/javascript"> 
$(document).ready(function () {
		var script = $(".demo").each(
		function () {
					$(this).parent().append( "<pre><code>" + $(this).html() + "</code></pre>" );	
						});		
						$("a").attr("target","_blank");	
					});
 function SetFocus() 
 { 
   document.getElementById('TxtSubject').focus(); 
   return false; 
 } 
var status_help = 'Status of a task moves from active (=new) to ack. This can be done only by the person who is supposed to do the task. When the task is completed the same person can move the task to completed. Once marked as completed the initiator has to mark the task as closed if satisfied. If not he/she can bring it back to Ack status. In case the initiated task is not yet marked Ack by reciever then the initiator can also abort the task or close it prematurely. Abort means forget this. Close means mission acomplished.';
$(document).ready(function () {
	$("#ContentPlaceHolder1_TxtDate").datepicker();
	$("span#help_status").click(
	function()
	{
	$("div#help").html(status_help);
	$("div#help").show("slow");
	
	});

});
 
</script> 
 
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div>
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
    <table cellpadding="0" cellspacing="0" style="width: 851px" >
        <tr class="tablerow">
            <td class="style21">
                    &nbsp;</td>
            <td  colspan="10" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="LblHeadinaddtask" runat="server" CssClass="lableHeading" 
                        Text="New Task/ Cart Issue"></asp:Label>
                    &nbsp;</td>
            <td class="style22" >
                    &nbsp;</td>
            <td >
                    &nbsp;</td>
        </tr>
        <tr style="height:5px">
            <td class="style21">
                    &nbsp;</td>
            <td  colspan="10" align="left">
                    &nbsp;</td>
            <td class="style22" >
                    &nbsp;</td>
            <td >
                    &nbsp;</td>
        </tr>
        <tr style="height:5px">
            <td class="style21">
                    &nbsp;</td>
            <td  colspan="10" align="left">
                    &nbsp;</td>
            <td class="style22" >
                    &nbsp;</td>
            <td >
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style21" >
                    </td>
            <td valign="top" class="style17" >
                <asp:Label ID="LblCartid" runat="server" CssClass="lable" 
                    Text="If cart issue provide Cart ID"></asp:Label>
            </td>
            <td  valign="top" colspan="2" class="style13">
                <asp:TextBox ID="Txtcartid" runat="server" CssClass="textbox"></asp:TextBox>
<%---                <cc1:FilteredTextBoxExtender ID="Txtcartid_FilteredTextBoxExtender" 
                    runat="server" Enabled="True" FilterType="Numbers" 
                    TargetControlID="Txtcartid">
                </cc1:FilteredTextBoxExtender> ---%>
            &nbsp;&nbsp;&nbsp;
            </td>
            <td  valign="top" colspan="2" class="style13">
                <asp:Label ID="lblSubject" runat="server" Text="Subject" CssClass="lable"></asp:Label>
            </td>
            <td  valign="top" colspan="3">
                <asp:TextBox ID="TxtSubject" runat="server" CssClass="textbox" 
                    ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TxtSubject" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td  valign="top" colspan="2" class="style16">
                &nbsp;</td>
            <td class="style23"  >
                    </td>
            <td class="style16"  >
                    </td>
        </tr>
        <tr style="height:5px;">
            <td>
                    &nbsp;</td>
            <td valign="top"  >
                &nbsp;</td>
            <td  valign="top" colspan="4">
                &nbsp;</td>
            <td  valign="top" colspan="3">
                &nbsp;</td>
            <td  valign="top" colspan="2" >
                &nbsp;</td>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr class="tabletask">
            <td class="style21"  >
                    </td>
            <td align="left" valign="top" class="style18"  >
                <asp:Label ID="LbltaskDetails" runat="server" Text="Task Details" 
                    CssClass="lable"></asp:Label>
            </td>
            <td  valign="top" colspan="9"  >
                <asp:TextBox ID="TxtTaskDetails" runat="server" TextMode="MultiLine" 
                        Height="93px" Width="364px" CssClass="textbox" BorderColor="#C1E0FF" 
                    BorderStyle="Solid"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="TxtTaskDetails" Display="Dynamic" ErrorMessage="Required" 
                    SetFocusOnError="True" ToolTip="Task details is required.">**</asp:RequiredFieldValidator>
            </td>
            <td class="style22"  >
            </td>
            <td  >
                    </td>
        </tr>
        <tr  style="height:5px;">
            <td >
                    &nbsp;</td>
            <td  valign="top">
                &nbsp;</td>
            <td  valign="top">
                &nbsp;</td>
            <td  valign="top" colspan="4">
                &nbsp;</td>
            <td  valign="top" colspan="4" >
                
                    &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
        </tr>
        <tr  class="tablerow">
            <td class="style21" >
                    </td>
            <td  valign="top" class="style1"  >
                <asp:Label ID="LblAction" runat="server" Text="Action" CssClass="lable"></asp:Label>
            </td>
            <td  valign="top" class="style1" >
                <asp:DropDownList ID="DrplAction" runat="server" AppendDataBoundItems="True" 
                      Width="128px"   CssClass="drplAddresponse">
                    <asp:ListItem Value="None">Action By</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="DrplAction" ErrorMessage="Required" 
                    SetFocusOnError="True" ToolTip=" Select Action By. ">*</asp:RequiredFieldValidator>
                    </td>
            <td  valign="top" colspan="4" class="style1" align="left" >
                <asp:Label ID="Label4" runat="server" Text="Initiated By" CssClass="lable"></asp:Label>
                    </td>
            <td  valign="top" colspan="4" >
                
                    <asp:TextBox ID="TxtInitiatedby" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td class="style22"></td>
                    <td></td>
        </tr>
        <tr style="height:5px;">
            <td>
                    &nbsp;</td>
            <td  valign="top">
                &nbsp;</td>
            <td  valign="top">
                &nbsp;</td>
            <td  valign="top" colspan="4">
                &nbsp;</td>
            <td  valign="top" colspan="4" >
                
                    &nbsp;</td>
                    <td >&nbsp;</td>
                    <td>&nbsp;</td>
        </tr>
        <tr  class="tablerow">
            <td class="style21">
                    </td>
            <td  valign="top" class="style18" >
                <asp:Label ID="LblInfo" runat="server" CssClass="lable" Text="Info"></asp:Label>
            </td>
            <td  valign="top" colspan="1" class="style20" >
                
                <asp:ListBox ID="LstInfo" runat="server" AppendDataBoundItems="True" 
                    CssClass="listbox"  EnableViewState SelectionMode="Multiple">
                    <asp:ListItem Value="">Info To</asp:ListItem>
                    </asp:ListBox>
            </td>
            <td  valign="top" colspan="4" align="left" >
                
                <asp:Label ID="LblEDC" runat="server" Text="PDC (MM/DD/YYYY)" CssClass="lable"></asp:Label>
            </td>
            <td  valign="top" colspan="4" class="style1" >
                
                <asp:TextBox ID="TxtDate" runat="server"  CssClass="hasDatepicker"></asp:TextBox>
                <%-- <cc1:CalendarExtender ID="TxtDate_CalendarExtender" runat="server" 
                    Enabled="True" PopupPosition="TopRight" TargetControlID="TxtDate">
                </cc1:CalendarExtender> --%>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TxtDate" ErrorMessage="**"></asp:RequiredFieldValidator>
            </td>
            <td class="style22">
                    </td>
        </tr>
        <tr >
            <td class="style21">
                    </td>
            <td  valign="top" class="style17"  >
                </td>
            <td  valign="top"  colspan="9" class="style1" >
                <asp:Label ID="Lbldateerror" runat="server" Font-Bold="True" 
                    ForeColor="#FF5050"></asp:Label>
                <br />
                <asp:Label ID="lblactionerror" runat="server" Font-Bold="True" 
                    ForeColor="#FF3300"></asp:Label>
            </td>
            <td class="style23" >
                    </td>
            <td class="style12" >
                    </td>
        </tr>
        <tr class="tabletask">
            <td class="style21" >
                    &nbsp;</td>
            <td class="style17"  >
                    <asp:Label ID="Lblcurrenttime" runat="server"></asp:Label>
            </td>
            <td colspan="9" >
                <asp:Button ID="BtnSubmit" runat="server" onclick="BtnSubmit_Click" 
                        Text="Submit"  ForeColor="White" CssClass="Button" />
            &nbsp;&nbsp;
                <asp:Button ID="BtnClear" runat="server" CssClass="Button" ForeColor="White" 
                    Text="Clear" onclick="BtnClear_Click" CausesValidation="False" />
                 <!--- <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager> --->
            </td>
            <td class="style22">
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
    </table>
    </ContentTemplate>
   </asp:UpdatePanel>
    
 </div>
</asp:Content>


