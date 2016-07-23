<cfif not isuserinrole("superadmin")>
Not enough privileges.
<cfabort />
</cfif>

<<<<<<< HEAD
<cfif isnumeric(inactiveid>>
=======
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c

<cfquery name="getgallery" datasource="gemssql">

update items set status=1 where newitem=#inactiveid#
</cfquery>

<<<<<<< HEAD
<cfoutput>#inactiveid# has been made inactive.</cfoutput>

</cfif>
=======
<cfoutput>#inactiveid# has been made inactive.</cfoutput>
>>>>>>> 517cdd0b57a55d33c250fd80a427d5856e5c669c
