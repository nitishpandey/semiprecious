<cfparam name=mynumber default="0">

<cfif isnumeric(mynumber)>
  <cfmail from="cs@semiprecious.com" to="5125899009@tmomail.net"  server="mail23.webcontrolcenter.com" subject="SP.com customer" type="html">
    Pl call me at <cfoutput>#mynumber#</cfoutput>
  </cfmail>
  Thank you, Anup or Angela will call you as soon as they can. Most likely within 10 minutes or as soon as T-mobile text message gets to them.
  <br>
  Go back to <a href=index.cfm>Semiprecious.com home</a>
  <cfelse>
  <h3>Your number was not a pure number, you put spaces or hyphens! so no message was sent and <font color=red>NO ONE will call you</font>. Go back and try again.</h3>
  </cfif>
  