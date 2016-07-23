<CFQUERY DATASOURCE="semiprecious" NAME="email">
SELECT email, firstname, lastname FROM memberinfo WHERE (newsletter1 =-1) ;
</CFQUERY>

<CFOUTPUT query="email">
#email#,
</cfoutput>


<CFQUERY DATASOURCE="semiprecious" NAME="latest">
select top 20 description, datetaken from items  where datetaken<> null order by datetaken desc;
</CFQUERY>
<br>
<CFOUTPUT query="latest">
#description#<br>
</cfoutput>

<CFMAIL
To="pondyiitd@yahoo.com"
FROM="pandey@aol.com"
SUBJECT="Monthly Newsletter from Semiprecious.com" server="mail23.webcontrolcenter.com"
>
Dear Anup Pandey,
This is a test.
SEmiprecious.com
</CFMAIL>