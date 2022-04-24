<cfcomponent restpath="/api" rest="true">
	<!---
	Requests must be sent to url with "Content-type: application/x-www-form-urlencoded"
	and packet body with name=value&name2=value2 (as Form Data)
	--->
	
	<!---
	Returns code:1 if successful else return code:0
	--->
	<cffunction name="register" access="remote" httpmethod="POST" returnType="any" restpath="accRegister">
		<cfargument name="counselor_id" required="yes" type="string" restArgSource="form" restArgName="counselor_id">
		<cfargument name="username" required="yes" type="string" restArgSource="form" restArgName="username">
		<cfargument name="password" required="yes" type="string" restArgSource="form" restArgName="password">
		<cfargument name="email" required="yes" type="string" restArgSource="form" restArgName="email">
		<cfargument name="first_name" required="yes" type="string" restArgSource="form" restArgName="first_name">
		<cfargument name="last_name" required="yes" type="string" restArgSource="form" restArgName="last_name">
		<cfargument name="birth_date" required="yes" type="string" restArgSource="form" restArgName="birth_date">
		<cfargument name="state" required="yes" type="string" restArgSource="form" restArgName="state">
		<cfargument name="city" required="yes" type="string" restArgSource="form" restArgName="city">
		<cfargument name="street" required="yes" type="string" restArgSource="form" restArgName="street">
		<cfargument name="zip_code" required="yes" type="string" restArgSource="form" restArgName="zip_code">
		<cfset password=PassphraseHash('#password#',"bcrypt",[rounds=10])>
		<cfquery name="usernameCheck" datasource="telehealthdb">
			select username from users where username = '#username#'
		</cfquery>
		<cfif #usernameCheck.RecordCount# neq 0>
			<cfreturn {data:{response:0,message:'Username Taken'}}>
		</cfif>
		<cfquery name="emailCheck" datasource="telehealthdb">
			select email from users where email = '#email#'
		</cfquery>
		<cfif #emailCheck.RecordCount# neq 0>
			<cfreturn {data:{response:0,message:'Email Taken'}}>
		</cfif>

		<cfquery datasource="telehealthdb">
			insert into users (username, email, password, role) values ('#username#','#email#', cast('#password#' as binary(60)),3) 
		</cfquery>
		<cfquery name="users" datasource="telehealthdb">
			select id from users where username = '#username#'
		</cfquery>
		<!---
		<cfquery name="counselors" datasource="telehealthdb">
			select counselors.id from counselors inner join codes on counselors.id = codes.id where codes.account_code = '#account_code#'
		</cfquery>
		--->
		<cfquery datasource="telehealthdb">
			insert into clients (user_id, assigned_counselor, first_name, last_name, birth_date, state, city, street, zip_code) values ('#users.id#','#counselor_id#','#first_name#','#last_name#',convert(date, '#birth_date#',103), '#state#','#city#','#street#','#zip_code#')
		</cfquery>
		<cfquery name="clients" datasource="telehealthdb">
			select clients.id from clients inner join users on users.id = clients.user_id where username='#username#'
		</cfquery>
		<cfquery datasource="telehealthdb">
			insert into notes (client_id, created_by, date_created, type) values ('#clients.id#','#counselor_id#',getdate(), 0)
		</cfquery>
		<cfquery datasource="telehealthdb">
			insert into notes (client_id, created_by, date_created, type) values ('#clients.id#','#counselor_id#',getdate(), 1) 
		</cfquery>
		<cfreturn {data:{response:1}}>
	</cffunction>



	<!---
	Returns counselor_id if registration_code is valid else returns 403
	--->
	<cffunction name="authRegister" access="remote" httpmethod="POST" returnType="any" restpath="authRegister">
		<cfargument name="registration_code" required="yes" type="string" restArgSource="form" restArgName="registration_code">
		<cfquery name="qry" datasource="telehealthdb">
			select counselors.id from counselors inner join codes on counselors.id = codes.id where registration_code='#registration_code#'
		</cfquery>
		<cfif #qry.RecordCount# eq 1>
			<cfreturn {data:{response:1,counselor_id:'#qry.id#'}}>
		<cfelse>
			<cfreturn {data:{response:0,message:'Bad Code'}}>
		</cfif>
	</cffunction>


	<!---	
	Returns information about client account if successful login.
	--->
	<cffunction name="login" access="remote" httpmethod="POST" returnType="any" restpath="login">
		<cfargument name="username" required="yes" type="string" restArgSource="form" restArgName="username">
		<cfargument name="password" required="yes" type="string" restArgSource="form" restArgName="password">
		<cfquery name="getPassword" datasource="telehealthdb">
			select password from users inner join clients on users.id = clients.user_id where username='#username#'
		</cfquery>
		<cfif #getPassword.RecordCount# neq 0>
			<cfset pass=toString(#getPassword.password#)>
			<cfif PassphraseCheck(#password#, pass)>
				<cfquery name="getProfile" datasource="telehealthdb">
					select clients.id, username, email, first_name, last_name, birth_date, states.state, city, street, zip_code from users inner join clients on users.id = clients.user_id inner join states on clients.state = states.id where username='#username#'
				</cfquery>
				<cfreturn {data:{response:1,client_id:'#getProfile.id#',username:'#getProfile.username#',email:'#getProfile.email#',first_name:'#getProfile.first_name#',last_name:'#getProfile.last_name#',birth_date:'#getProfile.birth_date#',state:'#getProfile.state#',city:'#getProfile.city#',street:'#getProfile.street#',zip_code:'#getProfile.zip_code#'}}>
			<cfelse>
				<cfreturn {data:{response:0,message:'Invalid username/password'}}>
			</cfif>
		<cfelse>
			<cfreturn {data:{response:0,message:'Invalid username/password'}}>
		</cfif>
	</cffunction>



	<!---
	Returns list of meetings client has
	--->
	<cffunction name="meetingList" access="remote" httpmethod="POST" returnType="any" restpath="meetingList">
		<cfargument name="client_id" required="yes" type="string" restArgSource="form" restArgName="client_id">
		<cfargument name="client_timezone" required="yes" type="string" restArgSource="form" restArgName="client_timezone">
		<cfquery name="qry" datasource="telehealthdb">
			select convert(varchar(19), convert(datetime, start_date, 120) at time zone 'UTC' at time zone '#client_timezone#', 120) as new_start_date, convert(varchar(19), convert(datetime, end_date, 120) at time zone 'UTC' at time zone '#client_timezone#', 120) as new_end_date, meeting_link, meeting_notes from meetings where client_id ='#client_id#' order by start_date
		</cfquery>
		<cfset row=[]>
		<cfloop index='i' from='1' to='#qry.RecordCount#'>
			<cfset row[i]={start_date:ToString(#qry['new_start_date'][i]#),end_date:ToString(#qry['new_end_date'][i]#),meeting_link:#qry['meeting_link'][i]#,meeting_notes:#qry['meeting_notes'][i]#}>		
		</cfloop>
		<cfquery name="counselor" datasource="telehealthdb">
                        select counselors.first_name, counselors.last_name from counselors inner join clients on counselors.id = clients.assigned_counselor where clients.id='#client_id#'
		</cfquery>
		<cfreturn {data:{response:1,meetings:row,counselor:{first_name='#counselor.first_name#',last_name='#counselor.last_name#'}}}>
	</cffunction>
</cfcomponent>
