<!doctype html>
<html lang="en" class="bg-gradient-to-t from-cyan-400 to-cyan-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="login.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<script src="https://cdn.tailwindcss.com"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="flex flex-col h-screen justify-center items-center font-['Roboto'] to-cyan-100">
    <div id="loginpanel" class="flex flex-col content-center bg-white p-10 rounded-xl">
        <div id="logoandtitle" class="w-full h-40 relative mb-8">
            <h3 class="text-center text-3xl font-bold">Telehealth Video Platform</h3>
        </div>
        
        <form id="form" action="script/loginFunc.cfm" method="POST" class="w-full">
            <div id="usn" class="field w-full">
                <label for="usn" class="text-sm text-gray-700">Username</label><br>
                <input type="text" id="usn" name="username" spellcheck="false" class="text-lg w-full pl-1 h-10">
            </div><br>
            <div id="pw" class="field">
                <label for="pw" class="text-sm text-gray-700">Password</label><br>
                <input type="password" id="pw" name="password" spellcheck="false" class="text-lg w-full pl-1 h-10">
            </div><br><br>
            <div class="w-full flex justify-center">
                <input type="submit" id="submit" name="submit" value="Log In" class="mx-auto px-4 pt-1 pb-2 bg-gradient-to-r from-sky-700 to-sky-500 rounded-lg text-white text-xl">
            </div><br>

			<cfif StructKeyExists(session, 'failedLogIn')>
    	        <cfif session.failedLogIn eq true>
    	            <p style='color:red; text-align:center' class='content-center'>Invalid Credentials</p>
    	            <cfset session.failedLogIn = false>
    	        </cfif>
	        </cfif>
        </form>
    </div>
</body>
</html>
