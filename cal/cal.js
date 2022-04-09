// $("#menuopen").click(function() {
//     $("#sidebar").removeClass("hidden sticky");
//     $("#sidebar").addClass("absolute left-0");
//     $("#modalbg").removeClass("hidden");
//     $("#menuclose").removeClass("hidden");
// });
// $("#modalbg, #menuclose").click(function() {
//     $("#sidebar").addClass("hidden sticky");
//     $("#sidebar").removeClass("absolute left-0");
//     $("#modalbg").addClass("hidden");
//     $("#menuclose").addClass("hidden");
// });

document.addEventListener('DOMContentLoaded', function() {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');


    // initialize the external events
    new Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
        return {
            title: eventEl.innerText
        };
        }
    });

    // initialize the calendar
    var calendar = new Calendar(calendarEl, {
        headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'listMonth,listWeek,listDay'
        },
        initialView: 'listDay',
        editable: true,
        droppable: true,
        drop: function(info) {
        if (checkbox.checked) {
            info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
        },
        events: 'https://fullcalendar.io/api/demo-feeds/events.json'
    });

    calendar.render(); 


    /*
var calendar = new Calendar(calendarEl, {
        headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listDay'
        },
        initialView: 'listWeek',
        editable: true,
        droppable: true,
        drop: function(info) {
        if (checkbox.checked) {
            info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
        },
        events: 'https://fullcalendar.io/api/demo-feeds/events.json'
    });



    */
    // var calendarL = document.getElementById('calendar2');
    // var calendar2 = new Calendar(calendarL, {
    //     plugins: [ listPlugin ],
    //     initialView: 'listWeek',
    //     headerToolbar: {
    //         left: 'prev,next today',
    //         center: 'title',
    //         right: 'dayGridMonth,timeGridWeek,timeGridDay,listDay'
    //         },
    //         editable: true,
    //         droppable: true,
    //         drop: function(info) {
    //         if (checkbox.checked) {
    //             info.draggedEl.parentNode.removeChild(info.draggedEl);
    //         }
    //         },
    //         events: 'https://fullcalendar.io/api/demo-feeds/events.json'
    // });
    // calendar2.render();
});
