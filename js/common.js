$("#menuopen").click(function() {
    $("#sidebar").removeClass("hidden sticky");
    $("#sidebar").addClass("absolute left-0");
    $("#modalbg").removeClass("hidden");
    $("#menuclose").removeClass("hidden");
});
$("#modalbg, #menuclose").click(function() {
    $("#sidebar").addClass("hidden sticky");
    $("#sidebar").removeClass("absolute left-0");
    $("#modalbg").addClass("hidden");
    $("#menuclose").addClass("hidden");
});
