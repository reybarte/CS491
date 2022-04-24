// Sidebar menu open
$("#menuopen").click(function() {
    $("#sidebar").removeClass("hidden sticky");
    $("#sidebar").addClass("absolute");
    $("#sidebar").css("left", "-16rem");
    $("#modalbg").removeClass("hidden");
    $("#menuclose").removeClass("hidden");
    $("#sidebar").animate({left:0}, 200);
});
// Sidebar menu close
$("#modalbg, #menuclose").click(function() {
    $("#modalbg").addClass("hidden");
    $("#menuclose").addClass("hidden");
    $("#sidebar").animate({left:"-16rem"}, 200, function() {
        $("#sidebar").addClass("hidden sticky");
        $("#sidebar").removeClass("absolute");
    });
});

const xmlhttp = new XMLHttpRequest();
xmlhttp.onload = function() {
    jsonobj = JSON.parse(this.responseText);
    var cllen = Object.keys(jsonobj["UPCOMINGMEETINGS"]).length;
    for (let i = 1; i <= cllen; i++) {
        addUpcomingMeeting(jsonobj["UPCOMINGMEETINGS"][i]);
    }
    cllen = Object.keys(jsonobj["PASTMEETINGS"]).length;
    for (let i = 1; i <= cllen; i++) {
        addPastMeeting(jsonobj["PASTMEETINGS"][i]);
    }
	addClientCount(jsonobj["CLIENTCOUNT"]);
};
xmlhttp.open("POST", "script/getDashboard.cfm", true);
window.onload = function(){
xmlhttp.send("counselorid="+document.getElementById("coid").value);
}

function addUpcomingMeeting(meeting, i) {
	$("#upcoming").append('<tr><td class="text-xl">'+meeting["MEETDAY"] + ', ' + meeting["MEETDATE"]+'</td><td class="text-xl">'+meeting["MEETSTART"]+' - '+meeting["MEETEND"]+'</td><td class="text-xl">'+meeting["LNAME"]+', '+meeting["FNAME"]+'</td></tr>');   
};

function addPastMeeting(meeting, i) {
	$("#past").append('<tr><td class="text-xl">'+meeting["MEETDAY"] + ', ' + meeting["MEETDATE"]+'</td><td class="text-xl">'+meeting["MEETSTART"]+' - '+meeting["MEETEND"]+'</td><td class="text-xl">'+meeting["LNAME"]+', '+meeting["FNAME"]+'</td></tr>');   
};

function addClientCount(count) {
	$("#clientcount").text(count + ' assigned clients');
;}



