<!--- SEVERAL OPTIONS IN HERE USED WHEN INCLUDED --->
<!--- DO NOT REMOVE OPTIONS --->

<CFPARAM NAME="CalendarHome" DEFAULT="">
<CFPARAM NAME="SafetyHome" DEFAULT="">
<CFPARAM NAME="EHSPowerHome" DEFAULT="">
<CFPARAM NAME="TCenterHome" DEFAULT="">
<CFPARAM NAME="ECenterHome" DEFAULT="">
<CFPARAM NAME="MSDSHome" DEFAULT="">
<CFPARAM NAME="ContactsLink" DEFAULT="">
<CFPARAM NAME="DGroupHome" DEFAULT="">
<CFPARAM NAME="CustomHome" DEFAULT="">
<CFPARAM NAME="NoTitle" DEFAULT="">
<CFPARAM NAME="NoButtons" DEFAULT="">
<CFPARAM NAME="NoButtonsCookie" DEFAULT="">
<CFPARAM NAME="DontShowPowerSuiteHome" DEFAULT="No">

<cfif ContactsLink NEQ "">
	<cfset ContactsLink = Mid(ContactsLink,1,Find("?",ContactsLink)-1)>
</cfif>

<cfif NoButtons EQ "Yes">
	<cfcookie name="NoButtonsCookie" value="Yes">
</cfif>

<style>

.tdborder{
	cursor : hand;
	font-family : Tahoma;
	font-size : 11px;
	font-weight : bold;
	color : white;
}
.tdover{
	cursor : hand;
	font-family : Tahoma;
	font-size : 11px;
	font-weight : bold;
	color : silver;
}
a:hover {color : red;}
.bottom {
	position : absolute;
	left : 20;
	bottom : 15;
}
</style>

<body leftmargin=0 topmargin=0 bgcolor="white">
<table background="sideback.gif" cellpadding="0" cellspacing="0" border="0" height="100%" width="80%" style="background-repeat:repeat-y">
<!--- <tr><td width="100%" height="10" style="background-color: Green;" colspan=3>&nbsp;</td></tr> --->
<tr valign="top">
<td height="100%">&nbsp;&nbsp;<td>
<td height="100%">
	<table width="166" border="0" cellspacing="2" cellpadding="0" height="100%">
		<cfoutput>
		<cfif NoTitle NEQ "Yes">
		<tr height="5%"><td>
			<img src="/images/gelogo.gif" border=0 alt="GE Logo"><font style="font-size: 18px; font-family: GEsansCon57; font-weight: bold; font-style: italic;">#GEBusiness#</font>
			<br><hr color="red" width="70%" align="left" size="1">
			<!--- <a href="http://powersuite1.corporate.ge.com/"><img src="/images/powersuite2.gif" border="0"></a> --->
		</td></tr>
		</cfif>
		<CFIF NoButtons NEQ "Yes">
			<CFIF NoButtonsCookie NEQ "Yes">
				<cfif EHSHomePage NEQ "">
				<cfset numHomePage = ListLen(EHSHomePage)>
				<cfif numHomePage GT 1>
					<cfloop index="x" from="1" to="#numHomePage#" step="2">
				<tr height="5%"><td valign="top">
						<table cellpadding="0" cellspacing="0">
							<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>
							<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#ListGetAt(EHSHomePage, x)#'" onMouseOver="this.className='tdover';self.status='Click for your #ListGetAt(EHSHomePage, x+1)# EHS Home';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">#ListGetAt(EHSHomePage, x+1)# EHS Home<cfelse><a href="#ListGetAt(EHSHomePage, x)#"><font color="white">#ListGetAt(EHSHomePage, x+1)# EHS Home</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
							<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>						
						</table>
						</td></tr>
					</cfloop>
				<cfelse>
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					    <tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>
						<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#EHSHomePage#'" onMouseOver="this.className='tdover';self.status='Click for your #Abr# Home';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">#Abr# Home<cfelse><a href="#EHSHomePage#"><font color="white">#Abr# Home</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
						<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>						
					</table>
					</td></tr>
				</cfif>
				</cfif>
				<cfif CalendarHome NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#CalendarHome#'" onMouseOver="this.className='tdover';self.status='Click for your Compliance Center main page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">Compliance Center<cfelse><a href="#CalendarHome#"><font color="white">Compliance Center</font></a></cfif><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>
				</table>
				</td></tr>
				</cfif>
				<cfif ContactsLink NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#ContactsLink#'" onMouseOver="this.className='tdover';self.status='Click for your #Abr# Contacts page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">#Abr# Contacts<cfelse><a href="#ContactsLink#"><font color="white">#Abr# Contacts</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
				<cfif TCenterHome NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#TCenterHome#'" onMouseOver="this.className='tdover';self.status='Click for your T Center main page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">T Center<cfelse><a href="#TCenterHome#"><font color="white">T Center</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
				<cfif EHSPowerHome NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#EHSPowerHome#'" onMouseOver="this.className='tdover';self.status='Click for your Power Audit Tool main page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">Power Audit Tool<cfelse><a href="#EHSPowerHome#"><font color="white">Power Audit Tool</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
				<cfif ECenterHome NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#ECenterHome#'" onMouseOver="this.className='tdover';self.status='Click for your E Center main page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">E Center<cfelse><a href="#ECenterHome#"><font color="white">E Center</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
				<cfif SafetyHome NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#SafetyHome#'" onMouseOver="this.className='tdover';self.status='Click for your Safety Center main page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">Safety Center<cfelse><a href="#SafetyHome#"><font color="white">Safety Center</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
				<cfif MSDSHome NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#MSDSHome#'" onMouseOver="this.className='tdover';self.status='Click for your MSDS main page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">MSDS<cfelse><a href="#MSDSHome#"><font color="white">MSDS</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
				<cfif DGroupHome NEQ "">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='#DGroupHome#'" onMouseOver="this.className='tdover';self.status='Click for your Discussion Group main page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">Discussion Group<cfelse><a href="#DGroupHome#"><font color="white">Discussion Group</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
				<cfif CustomHome NEQ "">
				<cfset CustomSize = ListLen(CustomHome)>
				<cfloop index="i" from="1" to="#CustomSize#" step="2">
					<tr height="5%"><td valign="top">
					<table cellpadding="0" cellspacing="0">
						<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>					
						<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.open('#ListGetAt(CustomHome, i)#', 'new_win', 'toolbar=yes,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,copyhistory=no,width=770,height=550');" onMouseOver="this.className='tdover';self.status='Click for the #ListGetAt(CustomHome, i+1)# page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">#ListGetAt(CustomHome, i+1)#<cfelse><a href="#ListGetAt(CustomHome, i)#"><font color="white">#ListGetAt(CustomHome, i+1)#</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>						
					</table>
					</td></tr>
				</cfloop>
				</cfif>
				<cfif DontShowPowerSuiteHome EQ "No">
				<tr height="5%"><td valign="top">
				<table cellpadding="0" cellspacing="0">
					<tr><td width=5><img src="topleft.gif"></td><td width=124 background="top.gif"></td><td width=6><img src="topright.gif"></td></tr>				
					<tr align="left"><td width=5 background="left.gif"></td><td background="buttonBack.gif" class="tdborder" height="25" width="124" nowrap onClick="window.location='http://powersuite1.corporate.ge.com/'" onMouseOver="this.className='tdover';self.status='Click for the PowerSuite Home Page';return true;" onMouseOut="this.className='tdborder';self.status='';return true;"><cfif #HTTP_USER_AGENT# CONTAINS "MSIE">PowerSuite Home<cfelse><a href="http://powersuite1.corporate.ge.com/"><font color="white">PowerSuite Home</font></a></cfif></td><td width=6 background="right.gif"></td></tr>
					<tr><td width=5><img src="bottomleft.gif"></td><td width=124 background="bottom.gif"></td><td width=6><img src="bottomright.gif"></td></tr>					
				</table>
				</td></tr>
				</cfif>
			</CFIF>
		</CFIF>
		<cfif #HTTP_USER_AGENT# CONTAINS "MSIE">
		<tr valign="center"><td nowrap>
			<!--- <font face=arial size=1><a href="http://powersuite1.corporate.ge.com/download/ie5setup.exe"><font color=blue><img src="/images/lgoIE.gif" border=0></font></a><br>Recommended Browser<br>Internet Explorer 5.0!<p><br> --->
			<font color="black" STYLE="font-family: Tahoma; font-size: 8pt;" class="bottom"><b>
			<script language="JavaScript">
				var today= new Date();
				var dateString = today.toString();
				document.write(dateString.substring(0,10) + ',' + dateString.substring(23,28))
			</script>
			</b></font>
		</td></tr>
		</cfif>
		</cfoutput>
	</table>
</td><td width="15" height="100%">&nbsp;</td><td>
