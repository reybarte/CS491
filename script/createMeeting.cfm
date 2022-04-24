<!---
Store time in UTC, let counselor select meeting time begin, end, and timezone.
--->

<cfif '#form.start#' gte '#form.end#'>
		<cfoutput>
			{"result":2}	
		</cfoutput>
	<cfexit>
</cfif>
<cfset start='#form.date# #form.start#'>
<cfset end='#form.date# #form.end#'>
<cfset jitsiAPIKey='vpaas-magic-cookie-4e984cb2baec4c3d805f5d69bbb7da4e/#form.fname##form.lname#'>
<cfset meetingLink=#jitsiAPIKey#>

<cfquery name="qry" datasource="telehealthdb">
	select * from meetings where convert(datetime, convert(datetime, '#start#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') between start_date and end_date or convert(datetime, convert(datetime,'#end#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') between start_date and end_date or start_date >= convert(datetime, convert(datetime, '#start#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') and end_date <= convert(datetime, convert(datetime,'#end#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') or start_date > convert(datetime, convert(datetime, '#start#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') and start_date < convert(datetime, convert(datetime,'#end#',120) at time zone 'Eastern Standard Time' at time zone 'UTC') and end_date > convert(datetime, convert(datetime,'#end#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') or start_date < convert(datetime, convert(datetime, '#start#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') and end_date > convert(datetime, convert(datetime,'#start#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC') and end_date < convert(datetime, convert(datetime, '#end#', 120) at time zone 'Eastern Standard Time' at time zone 'UTC')
</cfquery>
<cfif #qry.recordCount# eq 0>
<cfquery datasource="telehealthdb">
	insert into meetings (counselor_id, client_id, date_created, start_date, end_date, timezone, meeting_link, meeting_notes) values ('#form.coid#','#form.clid#',getutcdate(), convert(datetime, '#start#',120) at time zone '#form.timezone#' at time zone 'UTC', convert(datetime,'#end#',120) at time zone '#form.timezone#' at time zone 'UTC', '#form.timezone#', '#jitsiAPIKey#', '#form.notes#')
</cfquery>
	<cfoutput>
		{"result":0}
	</cfoutput>
<cfelse>
	<cfoutput>
		{"result":1}
	</cfoutput>
</cfif>
