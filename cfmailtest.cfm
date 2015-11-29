 <cfset mailAttributes = 
{
   server="smtp.gmail.com",
   username="semiprecious.com@gmail.com",
   password="prec1ou5ss",
   from="semiprecious.com@gmail.com",
   to="stacyanup@gmail.com",
   subject="Cfmail example"
} />

 <cfmail port=587 useSSL="false" attributeCollection="#mailAttributes#" subject="At confirmation Could not reverse "  type="html">
                  chal gaya
                </cfmail>