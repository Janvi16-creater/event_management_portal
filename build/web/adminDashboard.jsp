<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.eventportal.model.Event" %>
<%@ page import="com.eventportal.dao.EventDAO" %>

<%
    List<Event> events = EventDAO.getAllEvents();
    LocalDate today = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <style>
   body {
        background: linear-gradient(to right, #e0f7fa, #caf0f8);
        font-family: 'Poppins', sans-serif;
        overflow-x: hidden;
    }

    .navbar {
        background-color: #0D1B2A;
    }

    .navbar-brand, .nav-link {
        color: #00B4D8 !important;
        font-weight: 600;
        letter-spacing: 1px;
    }

    .nav-icon-text {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 60px;
        height: 60px;
        
    }

    .nav-icon-text i {
        font-size: 1.6rem;
        color: #00B4D8;
    }

    .nav-icon-text span {
        font-size: 1rem;
        font-weight: 600;
        color: #00B4D8;
        margin-left: 10px;
        opacity: 0; /* Always visible */
    }

    .nav-icon-text:hover {
        width: 180px;
        justify-content: flex-start;
        padding-left: 20px;
    }

    .nav-icon-text:hover span {
        opacity: 1;
    }

        .container {
            margin-top: 50px;
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.1);
            animation: fadeInContainer 1s ease forwards;
        }

        h2 {
            color: #0D1B2A;
            font-weight: bold;
            margin-bottom: 30px;
            font-size: 2.5rem;
        }

        h4 {
            color: #0D1B2A;
            font-weight: 600;
            margin-top: 50px;
            margin-bottom: 20px;
            border-bottom: 2px solid #00B4D8;
            display: inline-block;
            padding-bottom: 5px;
        }

        .btn-success {
            background-color: #00B4D8;
            border-color: #00B4D8;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 20px;
        }

        .btn-success:hover {
            background-color: #0096c7;
            border-color: #0096c7;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        thead {
            background-color: #0D1B2A;
            color: #fff;
        }

        th {
            padding: 15px;
            text-align: center;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        tbody tr {
            background: #ffffff;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 12px;
            opacity: 0;
            transform: translateY(30px);
            animation: slideFadeIn 0.6s forwards;
        }

        tbody tr:nth-child(1) { animation-delay: 0.2s; }
        tbody tr:nth-child(2) { animation-delay: 0.4s; }
        tbody tr:nth-child(3) { animation-delay: 0.6s; }
        tbody tr:nth-child(4) { animation-delay: 0.8s; }
        tbody tr:nth-child(5) { animation-delay: 1.0s; }
        tbody tr:nth-child(6) { animation-delay: 1.2s; }
        tbody tr:nth-child(7) { animation-delay: 1.4s; }
        tbody tr:nth-child(8) { animation-delay: 1.6s; }

        tbody tr:hover {
            transform: scale(1.02);
            box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
        }

        td {
            padding: 20px;
            text-align: center;
            font-weight: 500;
            color: #333;
        }

        .btn {
            border-radius: 12px;
            font-weight: bold;
            padding: 8px 15px;
        }

        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
        }

        .btn-info {
            background-color: #00B4D8;
            border-color: #00B4D8;
        }

        .btn-danger {
            background-color: #ff6b6b;
            border-color: #ff6b6b;
        }

        @keyframes fadeInContainer {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        @keyframes slideFadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Event Portal (Admin)</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link nav-icon-text" href="viewEvents.jsp">
                        <i class="fas fa-list"></i>
                        <span>View Events</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-icon-text" href="calendar.jsp">
                        <i class="fas fa-calendar-days"></i>
                        <span>Calendar</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-icon-text" href="index.jsp">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>


    <!-- Main Content -->
    <div class="container mt-5">
        <h2 class="text-center">Welcome Admin 👩‍💻</h2>

        <div class="text-center mb-4">
            <a class="btn btn-success" href="createEvent.jsp">+ Create New Event</a>
        </div>

        <!-- Upcoming Events Section -->
        <h4>Upcoming Events</h4>
        <div class="table-container mb-5">
            <table class="table text-center align-middle">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Venue</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        boolean hasUpcoming = false;
                        for (Event e : events) {
                            LocalDate eventDate = LocalDate.parse(e.getDate(), formatter);
                            if (eventDate.isAfter(today) || eventDate.isEqual(today)) {
                                hasUpcoming = true;
                    %>
                    <tr>
                        <td><%= e.getTitle() %></td>
                        <td><%= e.getDate() %></td>
                        <td><%= e.getVenue() %></td>
                        <td>
                            <a href="editEvent.jsp?id=<%= e.getId() %>" class="btn btn-warning btn-sm me-2">Edit</a>
                            <a href="ViewParticipantsServlet?eventId=<%= e.getId() %>" class="btn btn-info btn-sm me-2">View Participants</a>
                            <form action="deleteEvent.jsp" method="post" class="d-inline">
                                <input type="hidden" name="eventId" value="<%= e.getId() %>">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this event?');">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                        if (!hasUpcoming) {
                    %>
                    <tr><td colspan="4">No Upcoming Events</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Held Events Section -->
        <h4>Held Events</h4>
        <div class="table-container">
            <table class="table text-center align-middle">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Date</th>
                        <th>Venue</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        boolean hasHeld = false;
                        for (Event e : events) {
                            LocalDate eventDate = LocalDate.parse(e.getDate(), formatter);
                            if (eventDate.isBefore(today)) {
                                hasHeld = true;
                    %>
                    <tr>
                        <td><%= e.getTitle() %></td>
                        <td><%= e.getDate() %></td>
                        <td><%= e.getVenue() %></td>
                        <td class="text-muted">Completed</td>
                    </tr>
                    <%
                            }
                        }
                        if (!hasHeld) {
                    %>
                    <tr><td colspan="4">No Held Events</td></tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
