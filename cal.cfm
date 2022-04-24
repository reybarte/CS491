<!doctype html>
<html lang="en" class="bg-gradient-to-t from-cyan-400 to-cyan-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css">
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="cal.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src='https://8x8.vc/external_api.js'></script>
	<title>Calendar</title>
</head>
<body class="flex flex-row-reverse justify-center font-['Roboto'] overflow-x-hidden">
	<cfinclude template="script/checkSession.cfm">
    <!-- MAIN PANEL -->
    <div id="main" class="relative flex flex-col w-full max-w-4xl min-h-screen pb-4 bg-neutral-100 overflow-x-hidden">
        <div class="flex content-center mb-4 px-2 py-4 text-white font-semibold bg-gradient-to-r from-sky-700 to-sky-500">
            <div id="menuopen" class="block flex justify-center text-3xl lg:hidden w-9 h-9 mr-2">
                <span class="material-icons text-3xl">menu</span>
            </div>
            <h1 class="text-3xl">Calendar</h1>
            <div class="ml-auto flex flex-row-reverse mr-8">
				<!---
				<div id="addmenu" class="">
                    <span class="material-icons text-4xl absolute right-8 top-3">add</span>
                </div>
				--->
            </div>
        </div>
        <!-- CALENDAR -->
        <div id="calendar-container" class="px-2">
            <div id="calendar"></div>
        </div>
        <!-- MEETING INFO PANEL -->
        <div id="meetinfopanel" class="absolute top-0 left-1/4 opacity-0 flex flex-col w-full max-w-4xl min-h-screen pb-4 bg-neutral-50 hidden">
            <div class="flex content-center px-2 py-4 text-white font-semibold bg-gradient-to-r from-sky-700 to-sky-500">
                <div id="closemeetinfo" class="block flex justify-center text-3xl w-9 h-9 mr-2">
                    <span class="material-icons text-3xl">arrow_back</span>
                </div>
                <h1 class="text-3xl">Meeting Info</h1>
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2 pt-8 px-4">
                <div class="infofield col-span-1 sm:col-span-2 lg:col-span-3 mb-8">
                    <div class="text-sm text-gray-700">Client Name</div>
                    <div id="clientnameinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield">
                    <div class="text-sm text-gray-700">Date</div>
                    <div id="dateinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield">
                    <div class="text-sm text-gray-700">Start Time</div>
                    <div id="startinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield col-span-1 sm:col-span-2 lg:col-span-1 mb-8">
                    <div class="text-sm text-gray-700">End Time</div>
                    <div id="endinfo" class="w-full h-8 text-lg"></div>
                </div>
				<input type="text" id="mid" class="hidden">
            </div>
            <div class="ml-auto mr-8 flex flex-row-reverse justify-end text-white text-xl gap-4">
                <div id="joinmeet" class="w-40 h-10 flex justify-center content-center px-4 pt-1 pb-2 bg-gradient-to-r from-sky-700 to-sky-500 rounded-lg">Join Meeting</div>
			</div>
            <div id="meetnotes" class="mt-4 p-4">
                <div class="text-sm text-gray-700 mb-1">Meeting Notes</div>
                <p class="" id="notes">
                </p>
            </div>
        </div> <!-- END MEETING INFO PANEL -->
        <!-- ADD MEETING PANEL -->
        <div id="addmeetpanel" class="absolute top-0 left-1/4 opacity-0 flex flex-col w-full max-w-4xl min-h-screen pb-4 bg-neutral-50 hidden">
            <div class="flex content-center px-2 py-4 text-white font-semibold bg-gradient-to-r from-sky-700 to-sky-500">
                <div id="closeaddmeet" class="block flex justify-center text-3xl w-9 h-9 mr-2">
                    <span class="material-icons text-3xl">arrow_back</span>
                </div>
                <h1 class="text-3xl">Schedule Meeting</h1>
            </div>
            <form class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 px-4 py-8">
                <div id="clientnamef" class="addfield w-full sm:w-1/2 lg:w-1/3 col-span-1 sm:col-span-2 lg:col-span-3 mb-8 sm:pr-4 lg:pr-6">
                    <label for="clientname" class="text-sm text-gray-700">Client Name</label><br>
                    <input type="text" id="clientname" name="clientname" spellcheck="false" class="w-full pl-1 h-8">
                </div>
                <!-- Dropdown alternative -->
                <!-- <div id="clientnamef" class="addfield w-full sm:w-1/2 lg:w-1/3 col-span-1 sm:col-span-2 lg:col-span-3 mb-8 sm:pr-4 lg:pr-6">
                    <div class="text-sm text-gray-700">Client Name</div>
                    <select id="clientname" class="w-full h-8 pl-1"></select>
                </div> -->
                <div id="datef" class="addfield">
                    <label for="date" class="text-sm text-gray-700">Date</label><br>
                    <input type="date" id="date" name="date" class="w-full pl-1 h-8">
                </div>
                <div id="startf" class="addfield">
                    <label for="birthdate" class="text-sm text-gray-700">Start Time</label><br>
                    <input type="time" id="start" name="start" class="w-full pl-1 h-8">
                </div>
                <div id="endf" class="addfield">
                    <label for="end" class="text-sm text-gray-700">End Time</label><br>
                    <input type="time" id="end" name="end" class="w-full pl-1 h-8">
                </div>
                <div id="addbtn" class="outline-0 sm:col-span-2 lg:col-span-3 w-36 h-10 mt-8 ml-auto mr-4 flex justify-center content-center px-4 pt-1 pb-2 bg-gradient-to-r from-sky-700 to-sky-500 rounded-lg text-white text-xl">Schedule</div>
            </form>
        </div> <!-- END ADD MEETING PANEL -->
		<div id="jitsipanel" class="absolute top-0 left-1/4 opacity-0 flex flex-col w-full max-w-4xl min-h-screen bg-neutral-50 h-full hidden">
			<div id="jitsimeet" class="bg-gray-900 grow w-full h-full relative">
            </div>
     </div>


    </div>

		    <!-- MODAL BACKGROUND -->
    <div id="modalbg" class="fixed w-full h-full bg-gray-900 opacity-40 hidden z-10"></div>
    <!-- TEMP MODAL -->
    <!-- <div id="tempmodal" class="fixed top-0 left-0 w-full h-full flex justify-center items-center hidden">
        <div id="tempbox" class="w-3/4 h-3/4 p-4 bg-pink-300">
            <div class="w-full flex">
                <h2 id="eventname" class="text-2xl mb-4"></h2>
                <div id="eventclose" class="ml-auto">Close</div>
            </div>
            <div class="flex">
                <div class="mr-4">Start:</div>
                <div id="eventstart"></div>
            </div>
            <div class="flex">
                <div class="mr-4">End:</div>
                <div id="eventend"></div>
            </div>
            <div id="eventremove" class="w-40 bg-yellow-400">Remove Event</div>
        </div>
    </div> -->
    <!-- SIDEBAR -->
    <cfset current = GetFileFromPath(GetCurrentTemplatePath())>
	<cfinclude template="sidebar.cfm">
	<cfoutput>
	<input type="text" class="hidden" id="coid" value='#session.user.id#'>
	#getSidebar(currentPage=current)#
	</cfoutput>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
    <!-- <script src="../common/common.js"></script> -->
    <script src="js/cal.js"></script>
    
</body>
</html>
