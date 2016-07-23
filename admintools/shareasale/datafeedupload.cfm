<cfhttp method="post" url="https://shareasale.com/m-login.cfm" redirect="true" resolveurl="true"  useragent="Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.4) Gecko/20100611 Firefox/3.6.4 (.NET CLR 3.5.30729)" username="semiprecious" password="precious"    >
<cfhttpparam name="password" value="precious" type="formfield" >
<cfhttpparam name="username" value="semiprecious" type="formfield" >
<cfhttpparam name="step2" value="True" type="formfield" >
<cfhttpparam name="x" value="68" type="formfield" >
<cfhttpparam name="y" value="21" type="formfield" >
<cfhttpparam name="referer" value="http://www.shareasale.com/m-login.cfm"  type="header" >
<cfhttpparam name="host" value="shareasale.com"  type="header" >
<cfhttpparam name="connection" value="Keep-alive"  type="header" >

</cfhttp>
<cfoutput>#cfhttp.header# ,,,,#cfhttp.ResponseHeader# <hr />
#cfhttp.FileContent#</cfoutput>
