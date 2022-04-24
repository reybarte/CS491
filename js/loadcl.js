var jsonobj;

const xmlhttp = new XMLHttpRequest();
xmlhttp.onload = function() {
    jsonobj = JSON.parse(this.responseText);
    var cllen = Object.keys(jsonobj).length;
    for (let i = 0; i < cllen; i++) {
        addClient(jsonobj[i.toString()], i);
    }
};
xmlhttp.open("POST", "script/clientList.cfm", true);
window.onload = function(){
xmlhttp.send("counselorid="+document.getElementById("coid").value);
}


var selall = false;

$(function(){
    var dtToday = new Date();

    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();

    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();

    var minDate = year + '-' + month + '-' + day;    
    $('#scheddate').attr('min', minDate);
});

function hide() {
    $(this).addClass("hidden");
}
function show() {
    $(this).removeClass("hidden");
}

function slideIn(target) {
    target.removeClass("hidden");
    target.animate({
        left: 0,
        opacity: 1
    }, 250);
}
function slideOut(target) {
    target.animate({
        left: "25%",
        opacity: 0
    }, 250, function() {
        target.addClass("hidden");
    });
}

function selectclient(e) {
    console.log("Client Clicked");
    if (selall && !($(this).prop("checked"))) {
        $("#selectall>input").prop("checked", false);
        selall = false;
    } else if ($(this).prop("checked")) {
        var alltrue = true;
        $(".selectclient>input").each(function() {
            if (!($(this).prop("checked"))) {
                alltrue = false;
            }
        });
        if (alltrue) {
            $("#selectall>input").prop("checked", true);
            selall = true;
        }
    }
}

var testvar = true;
var clindex;
function clientClick(e) {
    if($(e.target).is(".selectclient>input")){
        return;
    }
    if (testvar) {
        // $("#main").hide();
        // $("#clinfopanel").show();
        slideIn($("#clinfopanel"));
        var clid = $(this).attr('id');
        clindex = $(this).index();
        $("#lnameinfo").text(jsonobj[clid]["LNAME"]);
        $("#fnameinfo").text(jsonobj[clid]["FNAME"]);
        $("#addressinfo").text(jsonobj[clid]["ADDRESS"]);
        $("#cityinfo").text(jsonobj[clid]["CITY"]);
        $("#stateinfo").text(jsonobj[clid]["STATE"]);
        $("#birthdateinfo").text(jsonobj[clid]["BIRTHDATE"]);
        $("#lastmeetinfo").text(jsonobj[clid]["LASTMEET"]);
		$("#clid").val(jsonobj[clid]["CLID"]);
    } else {
        $("#addctxt").addClass("hidden");
        $("#clinfotxt").removeClass("hidden");
        $("#addbtn").addClass("hidden");
        var clid = $(this).attr('id');
        $("#lname").val(jsonobj[clid]["LNAME"]);
        $("#fname").val(jsonobj[clid]["FNAME"]);
        $("#address").val(jsonobj[clid]["Address"]);
        $("#birthdate").val(jsonobj[clid]["Birthdate"]);
        $("#tempmodal").removeClass("hidden");
        $("#modalbg").removeClass("hidden");
        $("#sidebar").addClass("z-[-1]");
    }
}
$("#closeclinfo").click(function() {
    // $("#clinfopanel").hide();
    // $("#main").show();
    slideOut($("#clinfopanel"));
});

function addClient(client, i) {
	var lastmeet;
    $("#cllist").append(
        '<div id="'+i.toString()+'" class="client flex h-10 pt-[0.5rem] odd:bg-neutral-200 even:bg-neutral-50"><input type="text" class="hidden" value="'+client["CLID"]+'"><div class="clientname grow flex place-content-center"><div class="lname">'+client["LNAME"]+'</div><div class="comma mr-1">,</div><div class="fname">'+client["FNAME"]+'</div></div><div class="lastmeet w-36">'+ client["LASTMEET"]+'</div></div>'
    );
    document.getElementById(i.toString()).addEventListener("click", clientClick);
    $(document.getElementById(i.toString())).children(".selectclient").children().on("click", selectclient);
    //console.log($(document.getElementById(i.toString())).children(".selectclient").children());
    if (selall) {
        selall = false;
        $("#selectall>input").prop("checked", false);
    }
    $(".addfield>input").val("");
    $("#closeaddcl").click();
}
