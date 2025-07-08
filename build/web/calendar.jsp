<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Event Calendar</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FullCalendar CSS -->
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #caf0f8);
            font-family: 'Poppins', sans-serif;
        }
        .calendar-container {
            max-width: 1100px;
            margin: 60px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(13, 27, 42, 0.25);
            transition: all 0.3s ease;
        }
        #calendar {
            border: none;
        }
        .fc-toolbar-title {
            color: #0D1B2A;
            font-weight: 700;
            font-size: 2rem;
        }
        .fc-button-primary {
            background-color: #00B4D8;
            border: none;
            color: #fff;
            font-weight: 500;
            padding: 8px 15px;
            border-radius: 8px;
            transition: 0.3s;
        }
        .fc-button-primary:hover {
            background-color: #0096c7;
        }
        .fc-event, .fc-event-dot {
            background-color: #00B4D8 !important;
            border: none;
            color: white;
            font-size: 0.9rem;
            padding: 5px 10px;
            border-radius: 6px;
            transition: 0.2s;
        }
        .fc-event:hover {
            background-color: #0096c7 !important;
            transform: scale(1.05);
        }
        h2.page-title {
            text-align: center;
            color: #0D1B2A;
            font-weight: 700;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }
    </style>

    <!-- FullCalendar and Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                events: 'FetchCalendarEventsServlet', // Fetch from backend
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                eventClick: function(info) {
                    alert('Event: ' + info.event.title);
                }
            });
            calendar.render();
        });
    </script>

</head>
<body>

    <div class="container calendar-container">
        <h2 class="page-title">Event Calendar</h2>
        <div id="calendar"></div>
    </div>

</body>
</html>
