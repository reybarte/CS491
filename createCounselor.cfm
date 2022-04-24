<html>

<body>
	<cfform name='register' action='registerFunc.cfm' method='POST'>
		<cfif StructKeyExists(session,'counselorCreated')>
			<cfif session.counselorCreated eq true>
				<p>Counselor Created</p>
				<cfset session.counselorCreated=false>	
			</cfif>
		</cfif>
		<label for='username'>Username:</label>
		<br>
		<cfif StructKeyExists(session,'usernameTaken')>
			<cfif session.usernameTaken eq true>
				<p>Username Taken</p>
				<cfset session.usernameTaken=false>	
			</cfif>
		</cfif>
		<input type='text' name='username'>
		<br>	
		<label for='password'>Password:</label>	
		<br>
		<input type='text' name='password'>
		<br>
		<label for='email'>Email:</label>
		<br>
		<input type='text' name='email'>
		<cfif StructKeyExists(session,'emailTaken')>
			<cfif session.emailTaken=true>
				<p>Email Taken</p>
				<cfset sessionemailTaken=false>	
			</cfif>
		</cfif>
		<br>	
		<label for='first_name'>First Name:</label>
		<br>
		<input type='text' name='first_name'>
		<br>	
		<label for='last_name'>Last Name:</label>
		<br>
		<input type='text' name='last_name'>
		<br>
		<input type='submit' value="Submit">
	</cfform>
</body>

</html>
