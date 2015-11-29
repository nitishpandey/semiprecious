<cfhttp url="http://www.semiprecious.com/myproject/countryIP.aspx?ipaddress=#cgi.REMOTE_ADDR#"  />
		                    <cfdump var='#cgi#'>
		                    <cfdump var="#cfhttp#">