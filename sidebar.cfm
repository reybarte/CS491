<cffunction access="public" name="getSidebar"> 
 <cfargument required="true" type="any" name="currentPage"> 
 <!--- Some function bits ---> 
<cfoutput>
<div id="sidebar" class="sticky top-0 w-64 h-screen hidden lg:flex flex-col bg-white border-r-4 border-r-sky-700 z-20">
        <!-- LOGO -->
        <div id="main-logo-wrap" class="w-full h-40 flex justify-center content-center bg-[##106baa] overflow-hidden">
            <img src="https://web.njit.edu/~rvb7/RDELogo.png" alt="RDE-logo" class="object-contain scale-125">
        </div>
        <!-- MENU OPTIONS -->
		<cfif currentPage eq "dash.cfm">
        <a href="dash.cfm" class="menuoption w-full h-16 px-6 flex items-center text-2xl text-white bg-sky-700 active relative" >
            <span class="material-icons text-3xl mr-2">dashboard</span>
            Dashboard
        </a>
		<cfelse>
		<a href="dash.cfm" class="menuoption w-full h-16 px-6 flex items-center text-2xl hover:bg-sky-300" >
            <span class="material-icons text-3xl mr-2">dashboard</span>
            Dashboard
        </a>	
		</cfif>
		<cfif currentPage eq "cal.cfm">
        <a href="cal.cfm" class="menuoption w-full h-16 px-6 flex items-center text-2xl text-white bg-sky-700 active relative">
            <span class="material-icons text-3xl mr-2">calendar_today</span>
            Calendar
        </a>
		<cfelse>
		 <a href="cal.cfm" class="menuoption w-full h-16 px-6 flex items-center text-2xl hover:bg-sky-300">
            <span class="material-icons text-3xl mr-2">calendar_today</span>
            Calendar
        </a>
		</cfif>
		<cfif currentPage eq "cl.cfm">
        <a href="cl.cfm" class="menuoption w-full h-16 px-6 flex items-center text-2xl text-white bg-sky-700 active relative">
            <span class="material-icons text-3xl mr-2">people_alt</span>
            Clients
        </a>
		<cfelse>
		 <a href="cl.cfm" class="menuoption w-full h-16 px-6 flex items-center text-2xl hover:bg-sky-300">
            <span class="material-icons text-3xl mr-2">people_alt</span>
            Clients
        </a>
		</cfif>
        <a href="script/logoutFunc.cfm" class="menuoption mt-auto w-full h-16 px-6 flex items-center text-2xl hover:bg-sky-300">
            <span class="material-icons text-3xl mr-2">logout</span>
            Log Out
        </a>
        <div id="menuclose" class="hidden absolute top-2 -right-14 w-12 h-12 bg-sky-700">
            <span class="material-icons text-5xl text-white">close</span>
        </div>
</div>
</cfoutput>
</cffunction>
