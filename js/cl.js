// var jsonstr = '{"1":{"LName":"LName1","FName":"FName1","Address":"Address1","LastMeet":"LastMeet1"},"2":{"LName":"LName2","FName":"FName2","Address":"Address2","LastMeet":"LastMeet2"}}';
// jsonstr = '{"1":{"LName":"LName1","FName":"FName1","Address":"Address1","LastMeet":"LastMeet1"},"2":{"LName":"LName2","FName":"FName2","Address":"Address2","LastMeet":"LastMeet2"},"3":{"LName":"LName3","FName":"FName3","Address":"Address3","LastMeet":"LastMeet3"}}';
// var jsonobj = JSON.parse(jsonstr);
// console.log(jsonobj);
// console.log(jsonobj["1"]["FName"]);
// console.log(Object.keys(jsonobj).length);
console.log(Intl.DateTimeFormat().resolvedOptions().timeZone)
var selcli = document.getElementsByClassName('selectclient');
// function addClient(client, i) {
//     $("#cllist").append(
//         '<div id="'+i.toString()+'" class="client flex h-8"><div class="selectclient w-10"><input type="checkbox"></div><div class="clientname grow flex place-content-center"><div class="lname">'+client["LName"]+'</div><div class="comma mr-1">,</div><div class="fname">'+client["FName"]+'</div></div><div class="lastmeet w-36">Mmm. dd, yyyy</div></div>'
//     );
//     selcli = document.getElementsByClassName('selectclient');
// }

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

// window.onload = function() {
//     console.log("loaded");
//     var cllen = Object.keys(jsonobj).length;
//     for (let i = 1; i <= cllen; i++) {
//         addClient(jsonobj[i.toString()],i);
//     }
//     selcli = document.getElementsByClassName('selectclient');
// }
// var sideopen = false;
// $("#menuopen").click(function() {
//     sideopen = true;
//     // $("#sidebar").removeClass("hidden sticky");
//     // $("#sidebar").addClass("absolute left-0");
//     // $("#modalbg").removeClass("hidden");
//     // $("#menuclose").removeClass("hidden");
//     $("#sidebar").removeClass("hidden sticky");
//     $("#sidebar").addClass("absolute left-[10]");
//     $("#modalbg").removeClass("hidden");
//     $("#menuclose").removeClass("hidden");
//     $("#sidebar").animate({
//         left: 0
//     });
// });
// $("#modalbg, #menuclose").click(function() {
//     console.log("modalbg clicked");
//     $("#modalbg").addClass("hidden");
//     if (sideopen) {
//         $("#sidebar").addClass("hidden sticky");
//         $("#sidebar").removeClass("absolute left-0");
//         $("#menuclose").addClass("hidden");
//         sideopen = false;
//     } else {
//         $("#tempmodal").addClass("hidden");
//     }
// });


$("#selectall>input").click(function() {
    if (selall) {
        $(".selectclient>input").prop("checked", false);
        selall = false;
    } else {
        $(".selectclient>input").prop("checked", true);
        selall = true;
    }
});


// $(".selectclient>input").click(function(e) {
//     //selectclient(e);
//     console.log("Client Clicked");
//     if (selall && !($(this).prop("checked"))) {
//         $("#selectall>input").prop("checked", false);
//         selall = false;
//     } else if ($(this).prop("checked")) {
//         var alltrue = true;
//         $(".selectclient>input").each(function() {
//             if (!($(this).prop("checked"))) {
//                 alltrue = false;
//             }
//         });
//         if (alltrue) {
//             $("#selectall>input").prop("checked", true);
//             selall = true;
//         }
//     }
// });

// $(".client").click(function() {
//     $("#tempmodal").removeClass("hidden");
//     $("#modalbg").removeClass("hidden");
// });


// $("#addclient").click(function() {
//     $("#tempmodal").removeClass("hidden");
//     $("#modalbg").removeClass("hidden");
//     $("#sidebar").addClass("z-[-1]");
// });


$("#testbtn").click(function() {

});

function tf() {
    $(selcli).children().prop("checked", true);
}

var addobj;
function addobjfunc() {
    addobj = {
        "LName": $("#lname").val(),
        "FName": $("#fname").val(),
        "Address": $("#address").val(),
        "Birthdate": $("#birthdate").val()
    }
    console.log(addobj);
    cllen = cllen + 1;
    jsonobj[cllen] = addobj;
    addClient(jsonobj[cllen], cllen);
}
$("#addbtn").click(function() {
    addobjfunc();
});
// TODO: add on submit functionality


$("#addclclose").click(function() {
    $("#tempmodal").addClass("hidden");
    $("#modalbg").addClass("hidden");
    $("#sidebar").removeClass("z-[-1]");
    $(".addfield>input").val("");
    if ($("#addctxt").hasClass("hidden")) {
        $("#addctxt").removeClass("hidden");
        $("#clinfotxt").addClass("hidden");
        $("#addbtn").removeClass("hidden");
    }
});

// $(".client").click(function(e) {
//     if($(e.target).is(".selectclient>input")){
//         return;
//     }
//     $("#addctxt").addClass("hidden");
//     $("#clinfotxt").removeClass("hidden");
//     $("#addbtn").addClass("hidden");
//     var clid = $(this).attr('id');
//     $("#lname").val(jsonobj[clid]["LName"]);
//     $("#fname").val(jsonobj[clid]["FName"]);
//     $("#address").val(jsonobj[clid]["Address"]);
//     $("#birthdate").val(jsonobj[clid]["Birthdate"]);
//     $("#tempmodal").removeClass("hidden");
//     $("#modalbg").removeClass("hidden");
//     $("#sidebar").addClass("z-[-1]");
// });


// init Isotope
// var $grid = $('#cllist').isotope({
//     itemSelector: '.client',
//     layoutMode: 'vertical',
//     getSortData: {
//         lname: '.lname',
//         fname: '.fname'
//     }
// });
// $("#clientnames").click(function() {
//     $("#clientnames, .clientname").toggleClass("flex-row-reverse");
//     if ($("#clientnames").hasClass("flex-row-reverse")) {

//     }
// });


//   // bind sort button click
//   $('.sort-by-button-group').on( 'click', 'button', function() {
//     var sortValue = $(this).attr('data-sort-value');
//     $grid.isotope({ sortBy: sortValue });
//   });
  
//   // change is-checked class on buttons
//   $('.button-group').each( function( i, buttonGroup ) {
//     var $buttonGroup = $( buttonGroup );
//     $buttonGroup.on( 'click', 'button', function() {
//       $buttonGroup.find('.is-checked').removeClass('is-checked');
//       $( this ).addClass('is-checked');
//     });
//   });

$("#deleteselected").click(function() {
    const selected = [];
    $(".selectclient>input").each(function() {
        if ($(this).prop("checked")) {
            var markedclient = $(this).closest(".client");
            var selid = markedclient.attr("id");
            selected.push(selid);
            markedclient.remove();
        }
    });
    if (selected.length > 0) {
        for (let i = 0; i< selected.length; i++) {
            delete jsonobj[selected[i]];
        }
        // if (!selall) {
        //     var alltrue = true;
        //     $(".selectclient>input").each(function() {
        //         if (!($(this).prop("checked"))) {
        //             alltrue = false;
        //         }
        //     });
        //     if (alltrue) {
        //         $("#selectall>input").prop("checked", true);
        //         selall = true;
        //     }
        // }
    }
});

$(document).ready(function() {

});







$("#addclient").click(function() {
    slideIn($("#addclpanel"));
});
$("#closeaddcl").click(function() {
    slideOut($("#addclpanel"));
});

$("#singleremove").click(function() {
    var markedclient = $("#cllist").children(".client").eq(clindex);
    var selid = markedclient.attr("id");
    selid = parseInt(selid);
    selid = selid + 1;
    selid = selid.toString();
    delete jsonobj[selid];
    markedclient.remove();
    $("#closeclinfo").click();
    $(".infofield").val("");
})


$("#addmenu").click(function() {
    slideIn($("#addmeetpanel"));
});
$("#closeaddmeet").click(function() {
    $(".addfieldmeet>input").val("");
    slideOut($("#addmeetpanel"));
});
$("#addmeetbtn").click(function() {
    // TODO: add meeting to db
	var jsonobj;
	const xmlhttp = new XMLHttpRequest();
	xmlhttp.open("POST", "script/createMeeting.cfm", true);
	xmlhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
	xmlhttp.send("coid="+document.getElementById("coid").value +"&clid="+document.getElementById("clid").value+"&fname="+document.getElementById("fnameinfo").textContent+"&lname="+document.getElementById("lnameinfo").textContent+"&timezone="+document.getElementById("timezonef").value+"&date="+document.getElementById("scheddate").value+"&start="+document.getElementById("schedstart").value+"&end="+document.getElementById("schedend").value+"&notes="+document.getElementById("meetnotes").value);
	xmlhttp.onload = function() {
		jsonobj = JSON.parse(this.responseText);
		console.log(jsonobj);
		if(jsonobj["result"] == 0) {
			alert("Meeting Scheduled")
			$(".addfieldmeet>input").val("");
	    	slideOut($("#addmeetpanel"));
		} else if(jsonobj["result"] == 1){
			alert("Scheduling Overlap: Choose Different Time")
		} else if(jsonobj["result"] == 2){
			alert("Start Time must be less than End Time")
		}
	}
})
