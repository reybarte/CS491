<!---
Used for embedding jitsi meetings
--->


<script src='https://8x8.vc/external_api.js'></script>
.....
<cfoutput>
<cfquery name="counselor" datasource="telehealthdb">
        select first_name, last_name from counselors where id = '2'
</cfquery>
<cfquery name="meeting" datasource="telehealthdb">
	select meeting_link from meetings where id = '1'
</cfquery>
<cfset username='#counselor.first_name# ' & '#counselor.last_name#'>
<cfset appID='vpaas-magic-cookie-4e984cb2baec4c3d805f5d69bbb7da4e'>
<script type="text/javascript">
  let api;

  const initIframeAPI = () => {
    const domain = '8x8.vc';
    const options = {
      roomName: '#appID#/testroom',
      width: 700,
      height: 700,
      userInfo: {displayName:'#username#'},
      parentNode: document.querySelector('##meet')
    };
    api = new JitsiMeetExternalAPI(domain, options);
  }

  window.onload = () => {
    initIframeAPI();
  }
</script>
</cfoutput>
...
<body><div id="meet" /></body>

