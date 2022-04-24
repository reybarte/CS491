<!----
'{"1":{"LName":"LName1","FName":"FName1","Address":"Address1","Birthdate":"01/01/2001","LastMeet":"LastMeet1"},"2":{"LName":"LName2","FName":"FName2","Address":"Address2","Birthdate":"02/02/2002","LastMeet":"LastMeet2"},"3":{"LName":"LName3","FName":"FName3","Address":"Address3","Birthdate":"03/03/2003","LastMeet":"LastMeet3"}}'
----->

<cfquery name="query" datasource="telehealthdb">
    select clients.id, clients.first_name, clients.last_name, convert(varchar, clients.birth_date, 107) as birth, clients.city, clients.street, states.state, users.email from clients inner join counselors on counselors.id = clients.assigned_counselor inner join users on users.id = clients.user_id inner join states on clients.state = states.id where counselors.id = '#form.counselorid#' order by clients.last_name
</cfquery>
<cfset row=[]>
<cfloop index='i' from='1' to='#query.RecordCount#'>
	<cfquery name="meetings" datasource="telehealthdb">
		 select top 1 convert(varchar, start_date, 107) as start_date from meetings where client_id = '#query['id'][i]#' AND getutcdate() > start_date order by start_date DESC 
	</cfquery>
	<cfif #meetings.start_date# eq "">
		<cfset lastmeet = "None">
	<cfelse>
		<cfset lastmeet = #meetings.start_date#>
	</cfif>
	<cfset row[i]={clid:#query["id"][i]#,FName:#query["first_name"][i]#,LName:#query['last_name'][i]#,username:#query['email'][i]#, State:#query["state"][i]#, City:#query["city"][i]#, Address:#query["street"][i]#,Birthdate:#query["birth"][i]#, LastMeet:#lastmeet#}>
</cfloop>
<cfoutput>
	#serializeJSON(row)#
</cfoutput>
