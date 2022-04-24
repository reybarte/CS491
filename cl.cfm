<!doctype html>
<html lang="en" class="bg-gradient-to-t from-cyan-400 to-cyan-100">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client List</title>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="cl.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex flex-row-reverse justify-center font-['Roboto'] overflow-x-hidden">
	<cfinclude template="script/checkSession.cfm">
    <div id="mainwrap" class="w-full max-w-4xl min-h-screen relative overflow-x-hidden">
        <!-- MAIN PANEL -->
        <div id="main" class="flex flex-col w-full max-w-4xl min-h-screen pb-4 bg-neutral-300">
            <div class="flex flex-col content-center pb-4">
                <div class="flex content-center px-2 py-4 text-white font-semibold bg-gradient-to-r from-sky-700 to-sky-500">
                    <div id="menuopen" class="block flex justify-center text-3xl lg:hidden w-9 h-9 mr-2">
                        <span class="material-icons text-3xl">menu</span>
                    </div>
                    <h1 class="text-3xl">Client List</h1>
                    <div class="ml-auto flex flex-row-reverse mr-8">
                        <!---
						<div id="deleteselected" class="bg-red-400">
                            <span class="material-icons text-4xl absolute right-8 top-3">delete</span>
                        </div>
						--->
                    </div>
                </div>
                <div id="clmodule" class="flex flex-col">
                    <div id="clhead" class="flex h-12 items-center bg-white border-b-2 border-sky-600 font-semibold">
                        <!---
						<div id="selectall" class="w-10">
                            <input type="checkbox" id="allclients" name="allclients" value="allclients" class="">
                        </div>
						--->
                        <div id="clientnames" class="grow flex place-content-center">
                            <div class="lname">Last Name</div>
                            <div class="comma mr-1">,</div>
                            <div class="fname">First Name</div>
                        </div>
                        <div id="lastmeet" class="w-36">Last Meeting</div>
                    </div>  
                    <div id="cllist" class="flex flex-col ">
                        <!-- <div class="client flex h-8">
                            <!---
							<div class="selectclient w-10"><input type="checkbox"></div>
                            --->
							<div class="clientname grow flex place-content-center">
                                <div class="lname">LName1</div>
                                <div class="comma mr-1">,</div>
                                <div class="fname">FName1</div>
                            </div>
                            <div class="lastmeet w-36">Mmm. dd, yyyy</div>
                        </div>
                        <div class="client flex h-8">
                            <div class="selectclient w-10"><input type="checkbox"></div>
                            <div class="clientname grow flex place-content-center">
                                <div class="lname">LName2</div>
                                <div class="comma mr-1">,</div>
                                <div class="fname">FName2</div>
                            </div>
                            <div class="lastmeet w-36">Mmm. dd, yyyy</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div> <!-- END MAIN PANEL -->
        <!-- CLIENT INFO PANEL -->
        <div id="clinfopanel" class="absolute top-0 left-1/4 opacity-0 flex flex-col w-full max-w-4xl min-h-screen pb-4 bg-neutral-50 hidden">
            <div class="flex content-center px-2 py-4 text-white font-semibold bg-gradient-to-r from-sky-700 to-sky-500">
                <div id="closeclinfo" class="block flex justify-center text-3xl w-9 h-9 mr-2">
                    <span class="material-icons text-3xl">arrow_back</span>
                </div>
                <h1 class="text-3xl">Client Info</h1>
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-2 py-8 px-4">
                <div class="infofield">
                    <div class="text-sm text-gray-700">Last Name</div>
                    <div id="lnameinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield">
                    <div class="text-sm text-gray-700">First Name</div>
                    <div id="fnameinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield col-span-1 sm:col-span-2 lg:col-span-1 mb-8">
                    <div class="text-sm text-gray-700">Birthdate</div>
                    <div id="birthdateinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield">
                    <div class="text-sm text-gray-700">Street Address</div>
                    <div id="addressinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield">
                    <div class="text-sm text-gray-700">City</div>
                    <div id="cityinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield col-span-1 sm:col-span-2 lg:col-span-1 mb-8">
                    <div class="text-sm text-gray-700">State</div>
                    <div id="stateinfo" class="w-full h-8 text-lg"></div>
                </div>
                <div class="infofield">
                    <div class="text-sm text-gray-700">Last Meeting</div>
                    <div id="lastmeetinfo" class="w-full h-8 text-lg"></div>
                </div>
					<input type="text" class="hidden" id="clid">
            </div>
            <div class="ml-auto mr-8 flex flex-row-reverse justify-end text-white text-xl gap-4">
                <div id="addmenu" class="w-55 h-10 flex justify-center content-center px-4 pt-1 pb-2 bg-gradient-to-r from-sky-700 to-sky-500 rounded-lg">Schedule Meeting</div>
                <!---<div id="singleremove" class="w-28 h-10 flex justify-center content-center px-4 pt-1 pb-2 bg-gradient-to-r from-rose-600 to-rose-400 rounded-lg">Remove</div>--->
            </div>
        </div> <!-- END CLIENT INFO PANEL -->
        <!-- ADD MEETING PANEL -->
        <div id="addmeetpanel" class="absolute top-0 left-1/4 opacity-0 flex flex-col w-full max-w-4xl min-h-screen pb-4 bg-neutral-50 hidden">
            <div class="flex content-center px-2 py-4 text-white font-semibold bg-gradient-to-r from-sky-700 to-sky-500">
                <div id="closeaddmeet" class="block flex justify-center text-3xl w-9 h-9 mr-2">
                    <span class="material-icons text-3xl">arrow_back</span>
                </div>
                <h1 class="text-3xl">Schedule Meeting</h1>
            </div>
            <form action="script/createMeeting.cfm" method="POST" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 px-4 py-8">
                <div id="datef" class="addfieldmeet">
                    <label for="date" class="text-sm text-gray-700">Date</label><br>
                    <input type="date" id="scheddate" name="date" class="w-full pl-1 h-8">
                </div>
                <div id="startf" class="addfieldmeet">
                    <label for="birthdate" class="text-sm text-gray-700">Start Time</label><br>
                    <input type="time" id="schedstart" name="start" class="w-full pl-1 h-8">
                </div>
                <div id="endf" class="addfieldmeet">
                    <label for="end" class="text-sm text-gray-700">End Time</label><br>
                    <input type="time" id="schedend" name="end" class="w-full pl-1 h-8">
                </div>
				<div id="timezone" class="addfieldmeet">
                    <label for="timezone">Timezone</label><br>
					<select name="timezone" id="timezonef" class="w-full pl-1 h-8">
						<option value="Alaskan Standard Time">Alaskan Standard TIme</option>
						<option value="Aleutian Standard Time">Aleutian Standard Time</option>
						<option value="Central Standard Time">Central Standard Time</option>
						<option selected="selected" value="Eastern Standard Time">Eastern Standard Time</option>
						<option value="Hawaiian Standard Time">Hawaiian Standard Time</option>
						<option value="Pacific Standard Time">Pacific Standard Time</option>
						<option value="Mountain Standard Time">Mountain Standard Time</option>
					</select>
                </div>
				<div id="notef" class="addfieldmeet">
                    <label for="notes" class="text-sm text-gray-700">Meeting Notes</label><br>
                    <input type="text" id="meetnotes" name="notes" class="w-full pl-1 h-8">
                </div>
                <div id="addmeetbtn" class="outline-0 sm:col-span-2 lg:col-span-3 w-36 h-10 mt-8 ml-auto mr-4 flex justify-center content-center px-4 pt-1 pb-2 bg-gradient-to-r from-sky-700 to-sky-500 rounded-lg text-white text-xl">Schedule</div>
            </form>
        </div> <!-- END ADD MEETING PANEL -->
    </div>
    <!-- MODAL BACKGROUND -->
    <div id="modalbg" class="fixed w-full h-full bg-gray-900 opacity-40 hidden"></div>
    <!-- TEMP MODAL -->
    <!-- <div id="tempmodal" class="fixed top-0 left-0 w-full h-full flex justify-center items-center hidden">
        <div id="tempbox" class="w-3/4 h-3/4 p-4 bg-pink-300">
            <div class="w-full flex">
                <h2 id="addctxt" class="text-2xl mb-4">Add Client</h2>
                <h2 id="clinfotxt" class="text-2xl mb-4 hidden">Client Info</h2>
                <div id="addclclose" class="ml-auto">Close</div>
            </div>
            <!-- <form id="form" class="flex flex-wrap space-x-4 space-y-4">
                <div id="lnamef" class="field ml-4">
                    <label for="lname">Last Name</label><br>
                    <input type="text" id="lname" name="lname" spellcheck="false">
                </div>
                <div id="fnamef" class="field">
                    <label for="lname">First Name</label><br>
                    <input type="text" id="lname" name="lname" spellcheck="false">
                </div>
                <div id="addressf" class="field">
                    <label for="address">Address</label><br>
                    <input type="text" id="address" name="address" spellcheck="false">
                </div>
                <div id="birthdatef" class="field">
                    <label for="birthdate">Birthdate</label><br>
                    <input type="text" id="birthdate" name="birthdate" value="test" spellcheck="false">
                </div>
                <input type="submit" id="submit" name="submit" value="Add Client"><br>
                <a id="testbtn">testbtn</a>
    
            </form> -->
            
        <!-- </div>
    </div> -->
    <!-- SIDEBAR -->
    <cfset current = GetFileFromPath(GetCurrentTemplatePath())>
    <cfinclude template="sidebar.cfm">
    <cfoutput>#getSidebar(currentPage=current)#
	<input type"text" id="coid" value="#session.user.id#" class="hidden">
	</cfoutput>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
    <!-- <script src="common.js"></script> -->
    <!-- <script type="text/javascript" src="data.json"></script> -->
    <!--- <script src="loadjson.js"></script> --->
    <script src="js/loadcl.js"></script>
    <script src="js/cl.js"></script>
</body>
</html>
