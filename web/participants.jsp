<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Participants List</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #caf0f8);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
        }
        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(13, 27, 42, 0.25);
            width: 100%;
            max-width: 1100px;
            animation: fadeIn 1s ease;
        }
        .page-title {
            color: #0D1B2A;
            font-weight: 700;
            text-align: center;
            margin-bottom: 40px;
            font-size: 2.8rem;
            letter-spacing: 1px;
        }
        .card {
            border: none;
            background: #f9fcfd;
            transition: transform 0.4s, box-shadow 0.4s;
            overflow: hidden;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 180, 216, 0.3);
        }
        .card-header {
            background: linear-gradient(90deg, #0D1B2A, #00B4D8);
            color: #ffffff;
            font-weight: 600;
            font-size: 1.4rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .list-group-item {
            border: none;
            display: flex;
            align-items: center;
            font-weight: 500;
            color: #0D1B2A;
            background: transparent;
            animation: fadeUp 0.5s ease forwards;
            opacity: 0;
            transform: translateY(20px);
            animation-delay: 0.2s;
        }
        .list-group-item i {
            color: #00B4D8;
            margin-right: 10px;
            font-size: 1.2rem;
        }
        .no-data {
            color: #999;
            text-align: center;
            font-size: 1.2rem;
            margin-top: 20px;
        }
        .no-data i {
            font-size: 2rem;
            color: #00B4D8;
            display: block;
            margin-bottom: 10px;
        }
        .btn-back {
            background-color: #00B4D8;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
            padding: 10px 20px;
            display: block;
            margin: 30px auto 0;
            transition: background-color 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .btn-back:hover {
            background-color: #0096c7;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95);}
            to { opacity: 1; transform: scale(1);}
        }
        @keyframes fadeUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>

<div class="container">
    <h2 class="page-title">Participants List</h2>

    <%
        Map<String, List<String>> eventParticipants = (Map<String, List<String>>) request.getAttribute("eventParticipants");

        if (eventParticipants != null && !eventParticipants.isEmpty()) {
            for (Map.Entry<String, List<String>> entry : eventParticipants.entrySet()) {
                String eventTitle = entry.getKey();
                List<String> participants = entry.getValue();
    %>

    <div class="card mb-4 shadow-sm">
        <div class="card-header">
            <span><%= eventTitle %></span>
            <span class="badge bg-light text-dark"><%= participants.size() %> Participants</span>
        </div>
        <div class="card-body">
            <% if (!participants.isEmpty()) { %>
                <ul class="list-group list-group-flush">
                    <% for (String participant : participants) { %>
                        <li class="list-group-item">
                            <i class="bi bi-person-circle"></i> <%= participant %>
                        </li>
                    <% } %>
                </ul>
            <% } else { %>
                <div class="no-data">
                    <i class="bi bi-emoji-frown"></i>
                    No participants registered yet.
                </div>
            <% } %>
        </div>
    </div>

    <%
            }
        } else {
    %>
        <div class="no-data">
            <i class="bi bi-emoji-frown"></i>
            No event data available.
        </div>
    <%
        }
    %>

    <a href="adminDashboard.jsp" class="btn btn-back">Back to Dashboard</a>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
