<cfquery name="query" datasource="telehealthdb">

	select convert(varchar, convert(datetime, start_date, 120) at time zone 'UTC' at time zone 'Eastern Standard Time', 107) as actdate, convert(varchar(16), convert(datetime, start_date) at time zone 'UTC' at time zone 'Eastern Standard Time') as startdate, convert(varchar(16), convert(datetime, end_date) at time zone 'UTC' at time zone 'Eastern Standard Time') as enddate, clients.first_name, clients.last_name, meetings.id, meetings.meeting_notes from meetings inner join clients on clients.id = meetings.client_id where meetings.counselor_id = '#form.coid#' AND getutcdate() < meetings.start_date
</cfquery>

<cfloop index='i' from='1' to='#query.RecordCount#'>
	<cfset start=replace(#query["startdate"][i]#, " ", "T", "one")>
	<cfset end=replace(#query["enddate"][i]#, " ", "T", "one")>
    <cfset meeting[i]={title:'#query["first_name"][i]# #query["last_name"][i]#',DATE:'#query["actdate"]#',START:'#start#', END:'#end#', MEETID:#query["id"][i]#, MEETNOTES:#query["meeting_notes"][i]#}>
</cfloop>
<cfoutput>
	#serializeJSON(meeting)#
</cfoutput>
