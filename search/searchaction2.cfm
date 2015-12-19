<cfquery name="q_list" datasource="semiprecious">
select * from items <cfif isdefined("form.submit5")> where (saleprice
 <cfif #form.price# EQ 0>
     < 1000 )
  <cfelse>
     <cfif #form.price# EQ 5>
       < 5.1)
    <cfelse>
       <cfif #form.price#  EQ 10>
         < 10.1 )
       <cfelse>
	     <cfif #form.price# EQ 20>
	        < 20.1)
         <cfelse>
		   <cfif #form.price# EQ 1020>
		      < 20.1) and (saleprice > 9.99)
		    <cfelse>
		      > 19.99)
		  </cfif>
	    </cfif>
      </cfif>
	     </cfif>
      </cfif>
	  
<cfif not isDefined("form.cat1")>
 <cfif isDefined("form.cat")>
 and (cat in  (#PreserveSingleQuotes(form.cat)#))
 </cfif>
</cfif>
<cfif not isDefined("form.subcat1")>
<cfif isDefined("form.subcat")>
and (subcat in (#PreserveSingleQuotes(form.subcat)#))
</cfif>
</cfif>
 <cfelse>
	  <cfif isDefined("form.submit1")>
	   <cfif not isDefined("form.cat1")>
 <cfif isDefined("form.cat")>
where (cat in  (#PreserveSingleQuotes(form.cat)#))
 </cfif>
</cfif>
<cfelse>
	  <cfif isDefined("form.submit3")>
	  <cfif not isDefined("form.subcat1")>
<cfif isDefined("form.subcat")>
where(subcat in (#PreserveSingleQuotes(form.subcat)#))
</cfif>
</cfif>
 <cfelse>
	  <cfif isDefined("form.submit2")>
	   where (saleprice
 <cfif #form.price# EQ 0>
     < 1000 )
  <cfelse>
     <cfif #form.price# EQ 5>
       < 5.1)
    <cfelse>
       <cfif #form.price#  EQ 10>
         < 10.1 )
       <cfelse>
	     <cfif #form.price# EQ 20>
	        < 20.1)
         <cfelse>
		   <cfif #form.price# EQ 1020>
		      < 20.1) and (saleprice > 9.99)
		    <cfelse>
		      > 19.99)
		  </cfif>
	    </cfif>
      </cfif>
	     </cfif>
      </cfif>
	   <cfelse>
	   <h3>How on earth did we land up here !</h3>
	   </cfif>
	  </cfif>
	  </cfif>
	  </cfif>

order by cat, saleprice 

</cfquery>
<html>
<head>
<title>Your Ornaments</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#CCCCFF" text="#000000">
<table bgcolor="#FFFF99" align="center" bordercolor="#3366FF" cellpadding="1" border="1">
  <tr bordercolor="#663300" bgcolor="#FFFFFF"> 
    <td colspan=4>Here are some of the items matching your choices: </td>
  </tr>
  <tr> 
    <td><b>Type</b></td>
    <td><b>Stone Type</b></td>
    <td><b>Description</b></td>
    <td><b>Price for you</b></td>
  </tr>
  <cfoutput query="q_list"> 
    <tr>
      <td>#cat#</td>
      <td>#subcat#</td>
      <td>#description#</td>
      <td> #saleprice# </td>
    </tr>
  </cfoutput> 
</table>
<br />
<a href="searchform2.cfm" >Search again...</a>
We suggest you look at other items matching just 1 of your criterion 
to get a better idea of our collection.
</body>
</html>
