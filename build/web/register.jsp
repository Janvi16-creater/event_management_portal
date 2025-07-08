<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Event Management</title>

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

        .bubble:nth-child(1) { width: 100px; height: 100px; left: 10%; animation-duration: 25s; top: 20%; }
        .bubble:nth-child(2) { width: 150px; height: 150px; left: 70%; animation-duration: 18s; top: 30%; }
        .bubble:nth-child(3) { width: 80px; height: 80px; left: 40%; animation-duration: 22s; top: 50%; }
        .bubble:nth-child(4) { width: 120px; height: 120px; left: 20%; animation-duration: 20s; top: 70%; }
        .bubble:nth-child(5) { width: 90px; height: 90px; left: 80%; animation-duration: 26s; top: 60%; }

        @keyframes float {
            0% { transform: translateY(0) scale(1); opacity: 0.6; }
            50% { transform: translateY(-100px) scale(1.2); opacity: 0.4; }
            100% { transform: translateY(0) scale(1); opacity: 0.6; }
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

        .card-register {
            display: flex;
            flex-direction: column;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            box-shadow: 0px 8px 32px rgba(0,0,0,0.2);
            overflow: hidden;
            padding: 2rem;
            width: 100%;
            max-width: 450px;
            animation: fadeInUp 1s ease;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card-register h2 {
            color: var(--primary-dark);
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-label {
            font-weight: 600;
            color: var(--primary-dark);
        }

        .form-control, .form-select {
            border-radius: 10px;
        }

        .btn-primary {
            background-color: var(--accent-light);
            border: none;
            font-weight: 600;
        }

        .btn-primary:hover {
            background-color: #0096c7;
        }

        .alert-success {
            background: rgba(0, 180, 216, 0.2);
            border: 1px solid #00B4D8;
            color: #00B4D8;
            backdrop-filter: blur(8px);
            text-align: center;
            font-weight: 600;
        }

        footer {
            text-align: center;
            padding: 10px 0;
            font-size: 0.9rem;
            color: var(--primary-dark);
            background: transparent;
            z-index: 2;
        }

        a {
            color: var(--primary-dark);
            font-weight: 600;
        }

        a:hover {
            color: var(--accent-light);
            text-decoration: underline;
        }
    </style>
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
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-calendar-alt"></i> EventEase
            </a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container-main">
        <div class="card-register">

            <h2>Create Your Account</h2>

            <% 
                String message = (String)request.getAttribute("message");
                if(message == null){
                    message = (String)session.getAttribute("message");
                    session.removeAttribute("message");
                }
                if(message != null){
            %>
            <div class="alert alert-success" role="alert">
                <%= message %>
            </div>
            <% } %>

            <form action="RegisterServlet" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select class="form-select" id="role" name="role" required>
                        <option value="student">Student</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>

            <div class="text-center mt-3">
                <a href="login.jsp">Already have an account? Login</a>
            </div>
        </div>
    </div>

    <footer>
        &copy; 2025 EventEase. All Rights Reserved.
    </footer>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</body>
</html>
