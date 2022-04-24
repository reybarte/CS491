/*
    INTEGRATION FIELDS

    Meeting info
        #clientnameinfo     Client full name    text
        #dateinfo           Meeting date        date
        #startinfo          Meeting start time  time
        #endinfo            Meeting end time    time
    
    Add Meeting
        #clientname         Client full name    text
            note, dropdown alternative as follows (commented out atm)
        #clientname         Client full name    select
        #date               Meeting date        date
        #start              Meeting start time  time
        #end                Meeting end time    time
        #addbtn             Add meeting         clickable div
*/

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

function suppress() {
    $(".fc-button-active").animate({
        opacity: 0
    }, 250);
}
function enable() {
    $(".fc-button-active").animate({
        opacity: 1
    }, 250);
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
/*
function btntextchange() {
    $(".fc-listDay-button").text("");
    $(".fc-listWeek-button").text("");
    $(".fc-listMonth-button").text("");
    $(".fc-listDay-button").text("Day");
    $(".fc-listWeek-button").text("Week");
    $(".fc-listMonth-button").text("Month");
}
*/
function addMeeting() {
    // TODO: add meeting using fields with 
    var clientname = $("#clientname").val();
    var date = $("#date").val();
    var starttime = $("#start").val();
    var endtime = $("#end").val();
    console.log(clientname, date, starttime, endtime);

    var startdt = new Date(date + 'T' + starttime);
    var enddt = new Date(date + 'T' + endtime);
    console.log(startdt, enddt);

    calendar.addEvent({
        title: clientname,
        start: startdt,
        end: enddt
    });

    // var eventname = prompt('Enter event name');
    // if (eventname == '') {
    //     eventname = '<blank>';
    // }
    // var dateStr = prompt('Enter a date in YYYY-MM-DD format');
    // var date = new Date(dateStr + 'T00:00:00'); // will be in local time
    // var date2 = new Date(dateStr + 'T03:00:00');
    // console.log(date);

    // if (!isNaN(date.valueOf())) { // valid?
    //     calendar.addEvent({
    //         title: eventname,
    //         start: date,
    //         end: date2  
    //     });
    //     alert('Success');
    // } else {
    //     alert('Invalid date.');
    // }
}

function getTimeStr(dt) {
    var hours = dt.getHours();
    var minutes = dt.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12
    minutes = (minutes < 10 ? "0" : "") + minutes;
    hours = (hours < 10 ? "0" : "") + hours;
    return hours + ":" + minutes + " " + ampm;
}


//get list of meetings
var Calendar;
var calendarEl;
var calendar;
var eventid;
var jsonobj;
var calEvents=[];
xmlhttp = new XMLHttpRequest();
xmlhttp.onload = function() {
    jsonobj = JSON.parse(this.responseText);
	console.log(Object.keys(jsonobj).length);
	console.log(jsonobj);
	for (let i = 1; i <= Object.keys(jsonobj).length; i++) {
		calendar.addEvent({'title':jsonobj[i]["TITLE"],'actdate':jsonobj[i]["DATE"],'start':jsonobj[i]["START"], 'end':jsonobj[i]["END"], "meetid":jsonobj[i]["MEETID"], "notes":jsonobj[i]["MEETNOTES"]});
	}
	calendar.render();
	console.log(calendar.getEvents());
	//calEvents = JSON.parse(calEvents);
};
xmlhttp.open("POST", "script/getCalendarEvents.cfm", true);
window.onload = function(){
xmlhttp.send("coid="+document.getElementById("coid").value);
};


document.addEventListener('DOMContentLoaded', function() {
    Calendar = FullCalendar.Calendar;
    calendarEl = document.getElementById('calendar');

    // initialize the calendar
    calendar = new Calendar(calendarEl, {
        headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'listMonth,listWeek,listDay'
		},
		buttonText:{
		today: 'Today',
		month: 'Monthly',
		week: 'Weekly',
		day: 'Daily'
        },
        contentHeight: "auto",
        initialView: 'listDay',
        events: calEvents,
        eventClick: function(info) {
            suppress();


			eventid = info.event.id;

            $("#clientnameinfo").text(info.event.title);
            
            eventstart = info.event.start

            var month = eventstart.getMonth() + 1;
            var date = eventstart.getDate();
            var year = eventstart.getFullYear();
            $("#dateinfo").text(info.event.extendedProps.actdate);
            $('#mid').val(info.event.extendedProps.meetid);
            $("#startinfo").text(getTimeStr(eventstart));
            $("#endinfo").text(getTimeStr(info.event.end));
			$("#meetnotes").text(info.event.extendedProps.notes);
            slideIn($("#meetinfopanel"));


            // alert('Event: ' + info.event.title);
            // $("#eventname").text(info.event.title);
            // $("#eventstart").text(info.event.start);
            // $("#eventend").text(info.event.end);
            // eventid = info.event.id;
            // $("#tempmodal").removeClass("hidden");
            // $("#modalbg").removeClass("hidden");
            // $("#calendar-container").addClass("z-[-1]");
            // $("#modalbg").addClass("z-[-1]");
            // $("#sidebar").addClass("z-[-1]");
        },
        eventAfterAllRender: function() {
            setTimeout(function() {
                //btntextchange();
            },100) // not working???
        }
    });

    calendar.render();
    btntextchange(); // not working???
});

/*
$(".fc-button").on("click", function() {
    setTimeout(function() {
        btntextchange();
    },100)
});
*/
/*
    var eventtest;
    function testadd() {
        var Calendar = FullCalendar.Calendar;
        var calendarEl = document.getElementById('calendar');
        eventtest = new Calendar(calendarEl, {
            events: [
                {
                    title: 'The Title',
                    start: '2022-04-15',
                    end: '2022-04-16'
                }
            ]
        })
        calendarEl.addEvent(eventtest);
    }
*/

// $("#eventclose").click(function() {
//     $("#modalbg").addClass("hidden");
//     $("#tempmodal").addClass("hidden");
//     $("#calendar-container").removeClass("z-[-1]");
//     $("#modalbg").removeClass("z-[-1]");
//     $("#sidebar").removeClass("z-[-1]");
//     $("#eventname").text("");
//     $("#eventstart").text("");
//     $("#eventend").text("");
//     eventid = -1;
// });

// $("#eventremove").click(function() {
//     if (eventid != -1) {
//         calendar.getEventById(eventid).remove();
//         $("#eventclose").click();
//     }
// });
$("#meetremove").click(function() {
    if (eventid != -1) {
        calendar.getEventById(eventid).remove();
        $("#closemeetinfo").click();
    }
});

$("#joinmeet").click(function(){
	slideIn($("#jitsipanel"));
	xmlhttp = new XMLHttpRequest();
	xmlhttp.onload = function() {
		jsonobj = JSON.parse(this.responseText);
    	console.log(jsonobj);
			
		let api;
    	const initIframeAPI = () => {
    		const domain = '8x8.vc';
    		const options = {
				roomName: jsonobj["LINK"],
				width: '100%',
				height: '100%',
				userInfo: {displayName: jsonobj["FNAME"]+" "+jsonobj["LNAME"]},
				parentNode: document.querySelector('#jitsimeet')
			};
		api = new JitsiMeetExternalAPI(domain, options);
		}
		initIframeAPI();
		api.addListener("videoConferenceLeft", function (left){
			if(left) {
				api.dispose();
				slideOut($("#jitsipanel"));
			}
		});
	};
	xmlhttp.open("POST", "script/getJitsiMeeting.cfm", true);
	xmlhttp.send("mid="+document.getElementById("mid").value);

});

$("#closemeetinfo").click(function() {
	enable();
    slideOut($("#meetinfopanel"));
});


/*
$("#addmenu").click(function() {
    slideIn($("#addmeetpanel"));
});

$("#closeaddmeet").click(function() {
    slideOut($("#addmeetpanel"));
    $(".addfield>input").val("");
});

$("#addbtn").click(function() {
    addMeeting();
    $(".addfield>input").val("");
    $("#closeaddmeet").click();
});
*/
