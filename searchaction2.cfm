 <CFPARAM NAME="displaycolumns" DEFAULT="4">
 <CFPARAM NAME="category" DEFAULT="necklaces">
 <CFPARAM NAME="sortorder" DEFAULT="datetaken">
 <CFPARAM NAME="PicWidth" DEFAULT= "120">
 <CFPARAM NAME="start" DEFAULT= "1">
 <CFPARAM NAME="edit" DEFAULT= "">
 <CFPARAM NAME="subcat" DEFAULT= "">
 <CFPARAM NAME="color" DEFAULT= "">
 <CFPARAM NAME="Bcolor" DEFAULT= "FEE6CD">
  <CFPARAM NAME="salestatus" DEFAULT="">
 <CFPARAM NAME="newcart" DEFAULT="">
 <CFPARAM NAME="j" DEFAULT="">
 <CFPARAM NAME="price" DEFAULT="">
 <CFPARAM NAME="cat1" DEFAULT="">
 <CFPARAM NAME="subcat1" DEFAULT="">

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

<body bgcolor="#FFFFFF" text="#000000">
<cfinclude template="header.htm">
<CFINCLUDE TEMPLATE="subcatlist.cfm">
You asked for items of <cfif (not isdefined("form.cat")) or isdefined("form.cat1")>any type<cfelse><cfloop list="#form.cat#" index="j"><cfoutput>#j#,</cfoutput></cfloop> types</cfif> 
<cfif form.price NEQ "0">
in price range of 
 <cfif #form.price# EQ 5>
       $ 5.00
    <cfelse>
       <cfif #form.price#  EQ 10>
         $ 10.00
       <cfelse>
	     <cfif #form.price# EQ 20>
	        
			$ 20.00
         <cfelse>
		   <cfif #form.price# EQ 1020>
		      $ 10.00 and $ 20.00)
		    <cfelse>
		      more than $ 20.00 
		  </cfif>
	    </cfif>
      </cfif>
	     </cfif>
      </cfif> 
	  <cfif (not isdefined("form.subcat")) or isdefined("form.subcat1")>of any type of stone.<cfelse>of <cfloop list="#form.subcat#" index="j"><cfoutput>#j#,</cfoutput></cfloop> stones.</cfif> <table bgcolor="#FFFF99" align="center" bordercolor="#3366FF" cellpadding="1" border="1">
  <tr bordercolor="#663300" bgcolor="#FFFFFF"> 
    <td colspan=4>Here are the items matching your choices: </td>
  </tr>
  <tr> 
    <td><b>Type</b></td>
    <td><b>Stone Type</b></td>
    <td><b>Description</b></td>
    <td><b>Price for you</b></td>
  </tr>
  <cfset clr = "CCCCCC">
  <cfoutput query="q_list"> 
  <cfif clr is "CCCCCC">
<cfset clr = "FFFFFF">
<cfelse>
<cfset clr = "CCCCCC">

</cfif>
    <tr bgcolor="###clr#">
      <td>#cat#</td>
      <td>#subcat# &nbsp;</td>
      <td>#description#</td>
      <td> $ 0#saleprice# &nbsp;</td>
    </tr>
  </cfoutput> 
</table>

Click here to <a href="searchform2.cfm" >Search again...</a>
We suggest you look at other items matching just 1 of your criterion 
to get a better idea of our collection.
</body>
</html>
