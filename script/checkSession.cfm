<cfif NOT StructKeyExists(session, "user")>
	<cfoutput>
	<script>
		alert("You must be logged in to access this page.")
		location.href="https://telehealth.tk"
	</script>
	</cfoutput>
</cfif>
