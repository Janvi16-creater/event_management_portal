<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.eventportal.model.Event" %>
<%@ page import="com.eventportal.dao.EventDAO" %>

<%
    String eventIdStr = request.getParameter("id");
    Event event = null;

    if (eventIdStr != null) {
        int eventId = Integer.parseInt(eventIdStr);
        event = EventDAO.getEventById(eventId);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Event</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Creative Styling -->
    <style>
        body {
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            animation: fadeIn 1s ease;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-10px);}
            to {opacity: 1; transform: translateY(0);}
        }
        .btn-primary {
            background: #4f8ef7;
            border: none;
        }
        .btn-primary:hover {
            background: #3c7be0;
        }
        .form-control:focus {
            box-shadow: 0 0 5px rgba(79,142,247,0.7);
            border-color: #4f8ef7;
        }
        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #4f8ef7;
            transition: all 0.3s;
        }
        .back-link:hover {
            text-decoration: underline;
            color: #2c6cd3;
        }
    </style>
</head>

<body>

<% if (event == null) { %>
    <div class="text-center">
        <h2 class="text-danger">🚫 Event Not Found!</h2>
        <a href="adminDashboard.jsp" class="back-link">Back to Dashboard</a>
    </div>
<% } else { %>

<div class="card p-5" style="max-width: 600px; width: 100%;">
    <h2 class="text-center mb-4">Edit Event ✏️</h2>

    <form action="updateEvent.jsp" method="post">

        <input type="hidden" name="eventId" value="<%= event.getId() %>">

        <div class="mb-3">
            <label for="title" class="form-label">Event Title</label>
            <input type="text" class="form-control" id="title" name="title" value="<%= event.getTitle() %>" required>
        </div>

        <div class="mb-3">
            <label for="date" class="form-label">Event Date</label>
            <input type="date" class="form-control" id="date" name="date" value="<%= event.getDate() %>" required>
        </div>

        <div class="mb-3">
            <label for="venue" class="form-label">Venue</label>
            <input type="text" class="form-control" id="venue" name="venue" value="<%= event.getVenue() %>" required>
        </div>

        <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary">Update Event</button>
            <a href="adminDashboard.jsp" class="btn btn-outline-secondary">Cancel</a>
        </div>

    </form>
</div>

<% } %>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
