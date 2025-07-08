<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.eventportal.model.Event" %>
<%@ page import="com.eventportal.dao.EventDAO" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    List<Event> events = EventDAO.getAllEvents();
    LocalDate today = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    // Check if registration success parameter is present
    String registrationSuccess = request.getParameter("success");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Events</title>

    <!-- Bootstrap 5 + Animate CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        /* Your CSS remains same as before (not changing it for now) */
        /* ... */
        :root {
            --primary-bg: #0D1B2A;
            --primary-light: #00B4D8;
            --secondary-light: #90E0EF;
            --accent: #0077B6;
            --text-light: #ffffff;
            --card-bg: rgba(255, 255, 255, 0.05);
            --closed-badge-bg: linear-gradient(45deg, #ff6b6b, #c9184a);
        }

        body {
            background: linear-gradient(to bottom, #e0f7fa, #caf0f8);
            color: #ffffff;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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
            opacity: 0;
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
            margin-top: 40px;
        }

        h2 {
            color: #10B4FF;
            font-weight: 700;
            margin-bottom: 2rem;
        }

        .event-card {
            background: #0D1B2A;
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 20px;
            box-shadow: 0 8px 24px rgba(0, 180, 216, 0.3);
            transition: all 0.5s ease;
            height: 100%;
        }

        .event-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 12px 32px rgba(0, 180, 216, 0.6);
        }

        .event-title {
            font-size: 1.5rem;
            color: var(--secondary-light);
            margin-bottom: 0.8rem;
            font-weight: bold;
        }

        .btn-register {
            background-color: var(--primary-light);
            border: none;
            transition: all 0.4s ease;
            color: var(--primary-bg);
            font-weight: 600;
        }

        .btn-register:hover {
            background-color: var(--accent);
            transform: scale(1.05);
            box-shadow: 0 0 10px var(--primary-light);
            color: var(--text-light);
        }

        .badge-closed {
            background: var(--closed-badge-bg);
            padding: 8px 15px;
            font-size: 0.9rem;
            border-radius: 12px;
            opacity: 0.9;
            color: #fff;
            font-weight: bold;
            display: inline-block;
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
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Event Portal</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link nav-icon-text" href="calendar.jsp">
                            <i class="fas fa-calendar-days"></i>
                            <span>Calendar</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Events Display -->
    <div class="container animate__animated animate__fadeIn">
        <h2 class="text-center mb-5">🔥 All Upcoming & Past Events 🔥</h2>

        <div class="row g-4">
            <% for(Event e : events) { 
                LocalDate eventDate = LocalDate.parse(e.getDate(), formatter);
            %>
            <div class="col-md-4 d-flex">
                <div class="event-card w-100 text-center animate__animated animate__zoomIn">
                    <h3 class="event-title"><%= e.getTitle() %></h3>
                    <p><strong>Date:</strong> <%= e.getDate() %></p>
                    <p><strong>Time:</strong> <%= e.getTime() %></p>
                    <p><strong>Venue:</strong> <%= e.getVenue() %></p>

                    <% if (eventDate.isAfter(today)) { %>
                        <form action="RegisterEventServlet" method="post">
                            <input type="hidden" name="eventId" value="<%= e.getId() %>">
                            <input type="hidden" name="eventTitle" value="<%= e.getTitle() %>">
                            <button type="submit" class="btn btn-register mt-3">Register Now</button>
                        </form>
                    <% } else { %>
                        <div class="badge-closed mt-3">Registration Closed</div>
                    <% } %>
                </div>
            </div>
            <% } %>
        </div>

    </div>

    <footer>
        &copy; 2025 Event Portal. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Popup Script -->
    <% if("true".equals(registrationSuccess)) { %>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Registered Successfully!',
            showConfirmButton: false,
            timer: 2000
        })
    </script>
    <% } %>
    
</body>
</html>
