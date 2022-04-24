<!---
Used for embedding jitsi meetings
--->
<cfquery name="counselor" datasource="telehealthdb">
        select first_name, last_name from counselors where id = '#session.user.id#'
</cfquery>
<cfquery name="meeting" datasource="telehealthdb">
	select meetings.counselor_id, meetings.meeting_link from meetings where meetings.id = '#form.mid#'
</cfquery>
<cfif #meeting.counselor_id# neq #session.user.id#>
	<cfreturn>
</cfif>

<cfoutput>
#serializeJSON({"FNAME":'#counselor.first_name#', "LNAME":'#counselor.last_name#', "LINK":'#meeting.meeting_link#'})#
</cfoutput>

