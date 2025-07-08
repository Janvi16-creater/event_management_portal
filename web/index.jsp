<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>EventEase - Event Management Portal</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"/>

    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <!-- Embedded Custom Styles -->
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Poppins', sans-serif;
            color: #ffffff;
            overflow-x: hidden;
        }

        /* Background Video */
        .hero-video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        /* Navbar */
        .navbar {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(8px);
            border-bottom: 1px solid rgba(255,255,255,0.2);
            margin-bottom: 40px; /* Added space between navbar and hero */
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.8rem;
            color: #00B4D8;
        }

        /* Navbar Icon Hover Effect */
        .nav-link {
            position: relative;
            display: inline-flex;
            align-items: center;
            font-size: 1.3rem;
        }

        .nav-link i {
            font-size: 2rem;
            padding: 10px;
            border-radius: 50%;
            background-color: #fff;
            color: #00B4D8;
            transition: all 0.3s ease;
        }

        .nav-link span {
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            display: none;
            color: #00B4D8;
            font-size: 1.1rem;
            font-weight: bold;
            padding-top: 10px;
        }

        .nav-link:hover i {
            opacity: 0;
        }

        .nav-link:hover span {
            display: block;
        }

        /* Hero Section */
        .hero {
            height: 90vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            position: relative;
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            max-width: 1200px;
            margin: 0 auto;
            animation: fadeIn 1.5s ease-in forwards;
        }

        .hero h1 {
            font-size: 3.8rem;
            font-weight: 800;
            margin-bottom: 20px;
            color: #ffffff;
        }

        .hero p {
            font-size: 1.5rem;
            color: #c4c4c4;
        }

        /* Section Title */
        .section-title {
            text-align: center;
            font-size: 3rem;
            margin: 80px 0 40px;
            color: #00B4D8;
            font-weight: bold;
            animation: fadeIn 2s ease forwards;
        }

        /* Past Events */
        .event-card {
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.6);
            transition: transform 0.4s ease;
            height: 100%;
            
            
        }
        /* Background behind Past Legendary Events */
.past-events-container {
    height: 70vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            position: relative;
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            max-width: 1200px;
            margin: 0 auto;
            animation: fadeIn 1.5s ease-in forwards;
             margin-top: 40px;
     
}


        .event-card:hover {
            transform: translateY(-8px);
        }

        .event-card h5 {
            font-weight: bold;
            font-size: 2rem;
            color: #ffffff;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
        }

        .event-card p {
            color: #d1d5db;
            margin-top: 10px;
            font-size: 1.2rem;
        }

        /* Footer */
        footer {
            padding: 20px 0;
            text-align: center;
            color: #9CA3AF;
            font-size: 0.9rem;
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(8px);
            margin-top: 80px;
        }

        /* Animations */
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        /* Past Legendary Events Section */
        .event-card {
            background: rgba(0, 0, 0, 0.75);
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.6);
            transition: transform 0.5s ease, box-shadow 0.3s ease;
        }

        .event-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
        }
    </style>
</head>
<body>

    <!-- Video Background -->
    <video autoplay muted loop class="hero-video">
        <source src="https://static.inevent.com/videos/homepage-hero-bg-video.mp4" type="video/mp4">
    </video>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">EventEase</a>
            <div class="ms-auto">
                <a href="login.jsp" class="nav-link">
                    <i class="fas fa-sign-in-alt"></i>
                    <span>Login</span>
                </a>
                <a href="register.jsp" class="nav-link">
                    <i class="fas fa-user-plus"></i>
                    <span>Register</span>
                </a>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Create, Explore, Celebrate</h1>
        <p>Manage your events in the most elegant way possible.</p>
    </section>

    <!-- Past Events -->
    <div class="container past-events-container">
    <h2 class="section-title">Past Legendary Events</h2>
    <div class="row">
            <%
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/event_portal", "root", "JP@1612");

                    String sql = "SELECT * FROM events WHERE date < CURDATE() ORDER BY date DESC LIMIT 3";
                    pstmt = conn.prepareStatement(sql);
                    rs = pstmt.executeQuery();

                    boolean eventFound = false;

                    while (rs.next()) {
                        eventFound = true;
                        String eventName = rs.getString("title");
                        String eventDesc = rs.getString("description");
            %>
            <div class="col-md-4 mb-4 d-flex align-items-stretch">
                <div class="event-card">
                    <h5><%= eventName %></h5>
                    <p><%= eventDesc %></p>
                </div>
            </div>
            <%
                    }
                    if (!eventFound) {
            %>
            <div class="col-12 text-center">
                <p class="text-muted">No past events available yet. Stay tuned!</p>
            </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p class='text-danger'>Error loading events.</p>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 EventEase. Designed to Inspire Moments ✨</p>
    </footer>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
