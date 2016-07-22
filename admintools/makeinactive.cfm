<cfif not isuserinrole("superadmin")>
Not enough privileges.
<cfabort />
</cfif>

<cfif isnumeric(inactiveid>>

<cfquery name="getgallery" datasource="gemssql">

update items set status=1 where newitem=#inactiveid#
</cfquery>

<cfoutput>#inactiveid# has been made inactive.</cfoutput>

</cfif>