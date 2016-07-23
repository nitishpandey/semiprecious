
      <cfquery datasource="gemssql"  name="valid">
 update users set password = '22' + password 
      </cfquery>

      <cfquery datasource="gemssql"  name="valid">
        select * from users 
      </cfquery>
	  <cfdump var="#valid#" />
