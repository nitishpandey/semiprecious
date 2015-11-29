    <cfquery datasource="sptm" username="nitish" password="rangeela" name="q_credit">
    select balancecredit from invite_credits where email = '#Attributes.email#' 
    </cfquery>    <cfset 'Caller.#Attributes.returnvariable#' = q_credit.balancecredit >