<cfquery name="query" datasource="telehealthdb">
	select users.username, users.email, counselors.id, users.password, users.role from users inner join counselors on users.id = counselors.user_id where users.username = '#form.username#'
</cfquery>
<cfif #query.RecordCount# eq 1>
	<cfscript>
		pass = PassphraseHash(#form.password#, "bcrypt", [rounds=10])
	</cfscript>
	<cfif PassphraseCheck(#form.password#, #query.password#)>
		<cfset session.user.username = "#query.username#">
		<cfset session.user.email = "#query.email#">
		<cfset session.user.id = "#query.id#">
		<cfif #query.role# eq 1>
			<!--- Edit url to location of admin redirect--->
        		<cflocation url = "../adminHome.cfm">
    		<cfelseif #query.role# eq 2>
    			<!--- Edit url to location of counselor redirect--->
        		<cflocation url = "../dash.cfm">
		</cfif>
	<cfelse>
	<!--- Edit url to location of failed login redirect--->
		<cflocation url = "../login.cfm">
	</cfif>
<cfelse>
	<cfset session.failedLogIn=true>		
	<cflocation url = "../login.cfm">
</cfif>
