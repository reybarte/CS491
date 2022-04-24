<cfquery name="query" datasource="telehealthdb">
select top 5 substring(convert(varchar, convert(datetime, start_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 0),1, 7) as meetdate, format(convert(datetime, start_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 'dddd') as meetday, substring(convert(varchar, convert(datetime, start_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 0), 13,7) as meetstart, substring(convert(varchar, convert(datetime, end_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 0),13,7) as meetend, clients.first_name, clients.last_name from meetings inner join clients on clients.id = meetings.client_id where meetings.counselor_id = #session.user.id# AND getutcdate() < meetings.start_date	
</cfquery>
<cfloop index='i' from='1' to='#query.RecordCount#'>	
	<cfset umeeting[i]={FNAME:#query["first_name"][i]#, LNAME:#query["last_name"][i]#,MEETDATE:#query["meetdate"][i]#, MEETDAY:#query["meetday"][i]#, MEETSTART:#query["meetstart"][i]#, MEETEND:#query["meetend"][i]#}>
</cfloop>

<cfquery name="query" datasource="telehealthdb">
select top 5 substring(convert(varchar, convert(datetime, start_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 0),1, 7) as meetdate, format(convert(datetime, start_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 'dddd') as meetday, substring(convert(varchar, convert(datetime, start_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 0), 13,7) as meetstart, substring(convert(varchar, convert(datetime, end_date) at time zone 'UTC' at time zone 'Eastern Standard Time', 0),13,7) as meetend, clients.first_name, clients.last_name from meetings inner join clients on clients.id = meetings.client_id where meetings.counselor_id = #session.user.id# AND getutcdate() > meetings.start_date order by start_date desc	
</cfquery>
<cfloop index='i' from='1' to='#query.RecordCount#'>	
	<cfset pmeeting[i]={FNAME:#query["first_name"][i]#, LNAME:#query["last_name"][i]#,MEETDATE:#query["meetdate"][i]#, MEETDAY:#query["meetday"][i]#, MEETSTART:#query["meetstart"][i]#, MEETEND:#query["meetend"][i]#}>
</cfloop>

<cfquery name="query" datasource="telehealthdb">
	select count(*) as clientcount from clients where assigned_counselor = #session.user.id#
</cfquery>

<cfset data={upcomingmeetings:umeeting,pastmeetings:pmeeting,clientcount:#query.clientcount#}>
<cfoutput>
	#serializeJSON(data)#
</cfoutput>
