var jsonstr = '{"1":{"LName":"LName1","FName":"FName1","Address":"Address1","LastMeet":"LastMeet1"},"2":{"LName":"LName2","FName":"FName2","Address":"Address2","LastMeet":"LastMeet2"}}';
jsonstr = '{"1":{"LName":"LName1","FName":"FName1","Address":"Address1","Birthdate":"01/01/2001","LastMeet":"LastMeet1"},"2":{"LName":"LName2","FName":"FName2","Address":"Address2","Birthdate":"02/02/2002","LastMeet":"LastMeet2"},"3":{"LName":"LName3","FName":"FName3","Address":"Address3","Birthdate":"03/03/2003","LastMeet":"LastMeet3"}}';
var jsonobj = JSON.parse(jsonstr);


var selall = false;


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


function clientClick(e) {
    if($(e.target).is(".selectclient>input")){
        return;
    }
    $("#addctxt").addClass("hidden");
    $("#clinfotxt").removeClass("hidden");
    $("#addbtn").addClass("hidden");
    var clid = $(this).attr('id');
    $("#lname").val(jsonobj[clid]["LName"]);
    $("#fname").val(jsonobj[clid]["FName"]);
    $("#address").val(jsonobj[clid]["Address"]);
    $("#birthdate").val(jsonobj[clid]["Birthdate"]);
    $("#tempmodal").removeClass("hidden");
    $("#modalbg").removeClass("hidden");
    $("#sidebar").addClass("z-[-1]");
}

function addClient(client, i) {
    $("#cllist").append(
        '<div id="'+i.toString()+'" class="client flex h-8"><div class="selectclient w-10"><input type="checkbox"></div><div class="clientname grow flex place-content-center"><div class="lname">'+client["LName"]+'</div><div class="comma mr-1">,</div><div class="fname">'+client["FName"]+'</div></div><div class="lastmeet w-36">Mmm. dd, yyyy</div></div>'
    );
    document.getElementById(i.toString()).addEventListener("click", clientClick);
    $(document.getElementById(i.toString())).children(".selectclient").children().on("click", selectclient);
    //console.log($(document.getElementById(i.toString())).children(".selectclient").children());
    if (selall) {
        selall = false;
        $("#selectall>input").prop("checked", false);
    }
}

var cllen = Object.keys(jsonobj).length;
for (let i = 1; i <= cllen; i++) {
    addClient(jsonobj[i.toString()],i);
}

