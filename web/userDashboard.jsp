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
    <title>View Events</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
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
            flex-grow: 1;
            padding-top: 60px;
            padding-bottom: 60px;
        }

        h2 {
            color: #10B4FF; /* Accent Light */
            font-weight: 700;
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
            color: #10A4FF; /* Accent Light */
            border-bottom: 2px solid #00B4D8; /* Accent Light */
            display: inline-block;
        }

        .event-card {
            background: #0D1B2A; /* Dark background for cards */
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 180, 216, 0.3);
            padding: 20px;
            margin-bottom: 20px;
            height: 100%;
            transition: 0.4s;
            color: #ffffff; /* Ensure text is visible */
        }

        .event-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 8px 24px rgba(0, 180, 216, 0.5);
        }

        .event-card h4 {
            color: #00B4D8; /* Accent Light for the card title */
            font-weight: bold;
            margin-bottom: 10px;
        }

        .event-card p {
            color: #d3d3d3;
        }

        footer {
            text-align: center;
            color: rgba(255,255,255,0.5);
            font-size: 0.9rem;
            padding: 10px 0;
            background: transparent;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Event Portal (User)</a>
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

    <!-- Page Content -->
    <div class="container animate__animated animate__fadeIn">
        <h2 class="text-center">Upcoming and Past Events</h2>

        <!-- Upcoming Events -->
        <div class="mb-5">
            <h3 class="section-title">Upcoming Events</h3>
            <div class="row g-4">
                <% 
                    for(Event e : events) { 
                        LocalDate eventDate = LocalDate.parse(e.getDate(), formatter);
                        if (eventDate.isAfter(today) || eventDate.isEqual(today)) {
                %>
                <div class="col-md-4">
                    <div class="event-card text-center">
                        <h4><%= e.getTitle() %></h4>
                        <p><strong>Date:</strong> <%= e.getDate() %></p>
                        <p><strong>Time:</strong> <%= e.getTime() %></p>
                        <p><strong>Venue:</strong> <%= e.getVenue() %></p>
                    </div>
                </div>
                <% 
                        }
                    } 
                %>
            </div>
        </div>

        <!-- Held Events -->
        <div>
            <h3 class="section-title">Past Events</h3>
            <div class="row g-4">
                <% 
                    for(Event e : events) { 
                        LocalDate eventDate = LocalDate.parse(e.getDate(), formatter);
                        if (eventDate.isBefore(today)) {
                %>
                <div class="col-md-4">
                    <div class="event-card text-center">
                        <h4><%= e.getTitle() %></h4>
                        <p><strong>Date:</strong> <%= e.getDate() %></p>
                        <p><strong>Time:</strong> <%= e.getTime() %></p>
                        <p><strong>Venue:</strong> <%= e.getVenue() %></p>
                    </div>
                </div>
                <% 
                        }
                    } 
                %>
            </div>
        </div>

    </div>

    <footer>
        &copy; 2025 Event Portal. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
