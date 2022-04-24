<!doctype html>
<html lang="en" class="bg-gradient-to-t from-cyan-400 to-cyan-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="dash.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="relative flex flex-row-reverse justify-center font-['Roboto'] overflow-x-hidden">
	<cfinclude template="script/checkSession.cfm">
    <!-- MAIN PANEL -->
    <div id="main" class="flex flex-col w-full max-w-4xl min-h-screen pb-4 bg-neutral-200">
        <div class="flex content-center mb-4 px-2 py-4 text-white font-semibold bg-gradient-to-r from-sky-700 to-sky-500">
            <div id="menuopen" class="block flex justify-center text-3xl lg:hidden w-9 h-9 mr-2">
                <span class="material-icons text-3xl">menu</span>
            </div>
            <h1 class="text-3xl">Dashboard</h1>
        </div>
        <!-- DASHBOARD CARDS -->
        <div id="meetings" class="mx-2 px-4 py-4 mb-4 bg-white shadow-lg border-t-4 border-t-sky-600">
            <div class="cardbar flex w-full">
                <h2 class="text-2xl pb-4">Upcoming Meetings:</h2>
                <div class="ml-auto flex text-white text-xl space-x-4">
                    <a href="cal.cfm" class="h-10 flex justify-center content-center px-4 pt-1 pb-2 bg-gradient-to-r from-sky-700 to-sky-500 rounded-lg">Calendar</a>
                </div>
                
            </div>
            <table class="w-full table-auto">
                <tbody id="upcoming">
                </tbody>
            </table>
        </div>
        <div id="clients" class="mx-2 px-4 py-4 mb-4 flex bg-white shadow-lg border-t-4 border-t-sky-600">
            <h2 class="text-2xl">Client List:</h2>
            <a id="clientcount" class="text-xl mx-auto"></a>
            <a href="cl.cfm" class="ml-auto flex justify-center content-center px-4 pt-1 pb-2 text-xl text-white bg-gradient-to-r from-sky-700 to-sky-500 rounded-lg">Client List</a>
        </div>
		<div id="history" class="mx-2 px-4 py-4 mb-4 bg-white shadow-lg border-t-4 border-t-sky-600">
            <div class="cardbar flex w-full">
                <h2 class="text-2xl pb-4">Meeting History:</h2>
            	<a class="text-xl mx-auto">Last 5 Meetings</a>
            </div>
            <table class="w-full table-auto">
                <tbody id="past">
                </tbody>
            </table>
        </div>
    </div>
    <!-- MODAL BACKGROUND -->
    <div id="modalbg" class="fixed w-full h-full bg-gray-900 opacity-40 hidden"></div>
    <!-- SIDEBAR -->
    <cfset current = GetFileFromPath(GetCurrentTemplatePath())>
    <cfinclude template="sidebar.cfm">
    <input type"text" id="coid" value="#session.user.id#" class="hidden">
	<cfoutput>#getSidebar(currentPage=current)#</cfoutput>    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- <script src="../common/common.js"></script> -->
    <script src="js/dash.js"></script>
</body>
</html>
