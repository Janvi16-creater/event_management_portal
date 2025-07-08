<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.eventportal.dao.EventDAO" %>
<%@ page import="com.eventportal.model.Event" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Event</title>

    <!-- SweetAlert2 (for beautiful alerts) -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            background: linear-gradient(to right, #e0c3fc, #8ec5fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body>

<%
    String eventId = request.getParameter("eventId");
    boolean isDeleted = EventDAO.deleteEvent(Integer.parseInt(eventId));

    if (isDeleted) {
%>
<script>
    Swal.fire({
        title: 'Deleted!',
        text: 'The event has been successfully deleted. 🎯',
        icon: 'success',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'Back to Dashboard'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'adminDashboard.jsp';
        }
    });
</script>
<%
    } else {
%>
<script>
    Swal.fire({
        title: 'Oops!',
        text: 'Error deleting the event. Please try again! ❌',
        icon: 'error',
        confirmButtonColor: '#d33',
        confirmButtonText: 'Go Back'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = 'adminDashboard.jsp';
        }
    });
</script>
<%
    }
%>

</body>
</html>
