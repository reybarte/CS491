<html>
<body>
<!---
Check if username is taken
--->
<cfquery name="username" datasource="telehealthdb">
	select * from users where username = '#form.username#'
</cfquery>
<cfif #username.RecordCount# neq 0>
	<cfset session.usernameTaken = true>
	<cflocation url = "createCounselor.cfm">
</cfif>
<!---
Check if email is taken
--->
<cfquery name="email" datasource="telehealthdb">
	select * from users where email = '#form.email#'
</cfquery>
<cfif #email.RecordCount# neq 0>
	<cfset session.emailTaken = true>
	<cflocation url = "createCounselor.cfm">
</cfif>

<cfset pass = PassphraseHash(#form.password#, "bcrypt", [rounds=10])>
<cfquery datasource="telehealthdb">
	insert into users (username, email, password, role) values ('#form.username#', '#form.email#', cast('#pass#' as binary(60)), 2)
</cfquery>
<cfquery name="user" datasource="telehealthdb">
	select id from users where username = '#form.username#'
</cfquery>
<cfquery datasource="telehealthdb">
	insert into counselors (user_id, first_name, last_name) values ('#user.id#', '#form.first_name#', '#form.last_name#')
</cfquery>
<cfquery name="counselor" datasource="telehealthdb">
	select id from counselors where user_id = '#user.id#'
</cfquery>
<!---
Generate random registration code to connect to counselor
--->
<cfset code = ''>
<cfloop index='i' from='1' to='10'>
	<cfset ran = randRange(0, 63)>
	<cfset a = Mid('aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ0123456789',ran,1)>
	<cfset code=code&a>
</cfloop>
<cfquery name="query" datasource="telehealthdb">
	insert into codes values ('#counselor.id#', '#code#')
</cfquery>

<cfset session.counselorCreated = true>
<cflocation url = "front/createCounselor.cfm">
</body>
</html>
