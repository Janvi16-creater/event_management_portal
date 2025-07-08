<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.eventportal.dao.EventDAO" %>
<%@ page import="com.eventportal.model.Event" %>

<%
    String eventId = request.getParameter("eventId");
    String title = request.getParameter("title");
    String date = request.getParameter("date");
    String venue = request.getParameter("venue");

    Event event = new Event();
    event.setId(Integer.parseInt(eventId));
    event.setTitle(title);
    event.setDate(date);
    event.setVenue(venue);

    boolean isUpdated = EventDAO.updateEvent(event);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Event</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #caf0f8);
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            padding: 40px;
            border-radius: 20px;
            background: #fff;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.1);
            text-align: center;
            animation: fadeIn 1s ease forwards;
        }

        .btn-primary {
            background-color: #00B4D8;
            border: none;
            padding: 10px 25px;
            border-radius: 30px;
            font-weight: bold;
            margin-top: 20px;
        }

        .btn-primary:hover {
            background-color: #0096c7;
        }

        h1 {
            font-size: 2.5rem;
            color: #0D1B2A;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.2rem;
            color: #555;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>

<body>

<div class="card">
    <% if (isUpdated) { %>
        <h1>✅ Update Successful!</h1>
        <p>The event details were updated successfully.</p>
        <a href="adminDashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    <% } else { %>
        <h1>❌ Update Failed!</h1>
        <p>Something went wrong while updating the event.</p>
        <a href="adminDashboard.jsp" class="btn btn-primary">Try Again</a>
    <% } %>
</div>

</body>
</html>
