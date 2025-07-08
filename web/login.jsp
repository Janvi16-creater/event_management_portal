<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Event Management</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-dark: #0D1B2A;
            --accent-light: #00B4D8;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            overflow: hidden;
            position: relative;
            display: flex;
            flex-direction: column;
            background: linear-gradient(135deg, #e0f7fa 0%, #caf0f8 100%);
            backdrop-filter: blur(10px);
        }

        /* Animated bubbles background */
        .background-bubbles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(0, 180, 216, 0.3);
            animation: float 20s infinite ease-in-out;
            backdrop-filter: blur(5px);
        }

        .bubble:nth-child(1) {
            width: 100px;
            height: 100px;
            left: 10%;
            animation-duration: 25s;
            top: 20%;
        }
        .bubble:nth-child(2) {
            width: 150px;
            height: 150px;
            left: 70%;
            animation-duration: 18s;
            top: 30%;
        }
        .bubble:nth-child(3) {
            width: 80px;
            height: 80px;
            left: 40%;
            animation-duration: 22s;
            top: 50%;
        }
        .bubble:nth-child(4) {
            width: 120px;
            height: 120px;
            left: 20%;
            animation-duration: 20s;
            top: 70%;
        }
        .bubble:nth-child(5) {
            width: 90px;
            height: 90px;
            left: 80%;
            animation-duration: 26s;
            top: 60%;
        }

        @keyframes float {
            0% {
                transform: translateY(0) scale(1);
                opacity: 0.6;
            }
            50% {
                transform: translateY(-100px) scale(1.2);
                opacity: 0.4;
            }
            100% {
                transform: translateY(0) scale(1);
                opacity: 0.6;
            }
        }

        .navbar {
            background-color: var(--primary-dark);
            padding: 12px 0;
        }

        .navbar-brand {
            color: white;
            font-size: 1.8rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .navbar-brand i {
            color: var(--accent-light);
            font-size: 2rem;
        }

        .container-main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 15px;
            z-index: 1;
        }

        .card-login {
            display: flex;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            box-shadow: 0px 8px 32px rgba(0,0,0,0.2);
            overflow: hidden;
            max-width: 950px;
            width: 100%;
            min-height: 500px;
        }

        .card-login .left-side {
            background: url('https://images.unsplash.com/photo-1601933471663-1b8a34c75b1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=870&q=80') center/cover no-repeat;
            flex: 1;
            position: relative;
        }

        .card-login .left-side::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba(13, 27, 42, 0.5);
        }

        .card-login .left-side-content {
            position: absolute;
            color: white;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            padding: 20px;
            z-index: 1;
        }

        .card-login .left-side-content h2 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .card-login .left-side-content p {
            font-size: 1rem;
            color: #d9d9d9;
        }

        .card-login .right-side {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 40px;
        }

        .login-form {
            width: 100%;
        }

        .login-form h3 {
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 25px;
            text-align: center;
        }

        .form-control {
            border-radius: 12px;
            padding: 14px;
            margin-bottom: 20px;
            font-size: 1rem;
        }

        .form-control:focus {
            border-color: var(--accent-light);
            box-shadow: 0 0 10px rgba(0, 180, 216, 0.5);
        }

        .btn-primary {
            background-color: var(--primary-dark);
            border: none;
            width: 100%;
            border-radius: 12px;
            padding: 14px;
            font-weight: 600;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #001b36;
        }

        .text-center a {
            color: var(--accent-light);
            text-decoration: none;
            font-weight: 500;
            display: inline-block;
            margin-top: 15px;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        .alert {
            border-radius: 10px;
            font-size: 0.95rem;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .card-login {
                flex-direction: column;
                min-height: auto;
            }
            .card-login .left-side {
                height: 250px;
            }
            .card-login .left-side-content {
                padding: 10px;
            }
        }
    </style>

    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</head>
<body>

    <!-- Bubbles Background -->
    <div class="background-bubbles">
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
    </div>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="container">
            <a class="navbar-brand mx-auto" href="#">
                <i class="fas fa-calendar-check"></i> Event Management
            </a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container-main">

        <div class="card-login">

            <!-- Left Side -->
            <div class="left-side">
                <div class="left-side-content">
                    <h2>Manage Your Events</h2>
                    <p>Organize amazing events easily and beautifully.</p>
                </div>
            </div>

            <!-- Right Side -->
            <div class="right-side">

                <div class="login-form">

                    <h3>Login</h3>

                    <% 
                        String message = (String)session.getAttribute("message");
                        if(message != null) {
                    %>
                        <div class="alert alert-success" role="alert">
                            <%= message %>
                        </div>
                    <%
                        session.removeAttribute("message");
                        }
                    %>

                    <form action="LoginServlet" method="post">
                        <input type="text" name="email" class="form-control" placeholder="Email address" required>
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>

                    <% if(request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger mt-3" role="alert">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <div class="text-center">
                        <a href="register.jsp">Don't have an account? Register here</a>
                    </div>

                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
