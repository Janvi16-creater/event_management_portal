<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Event</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #e0f7fa, #caf0f8);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #0D1B2A;
        }

        .card {
            border: none;
            border-radius: 20px;
            background: #ffffff;
            box-shadow: 0px 10px 30px rgba(0,0,0,0.1);
            animation: slideUp 1s ease forwards;
        }

        .form-control {
            border-radius: 12px;
        }

        label {
            font-weight: bold;
            color: #0D1B2A;
        }

        .btn-success {
            background-color: #00B4D8;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-success:hover {
            background-color: #0096c7;
        }

        .btn-link {
            color: #00B4D8;
            font-weight: bold;
            text-decoration: none;
        }

        .btn-link:hover {
            text-decoration: underline;
            color: #0096c7;
        }

        h2 {
            font-weight: bold;
            color: #0D1B2A;
            margin-bottom: 20px;
            animation: fadeIn 1s ease forwards;
        }

        @keyframes slideUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">Event Management Portal</a>
        </div>
    </nav>

    <!-- Create Event Form Section -->
    <div class="container mt-5 mb-5 flex-grow-1 d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <div class="card p-5">
                <h2 class="text-center">Create New Event 🎉</h2>

                <form action="CreateEventServlet" method="post">
                    <div class="mb-4">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter event title" required>
                    </div>

                    <div class="mb-4">
                        <label for="description" class="form-label">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Enter event description" required></textarea>
                    </div>

                    <div class="mb-4">
                        <label for="date" class="form-label">Date</label>
                        <input type="date" class="form-control" id="date" name="date" required>
                    </div>

                    <div class="mb-4">
                        <label for="time" class="form-label">Time</label>
                        <input type="time" class="form-control" id="time" name="time" required>
                    </div>

                    <div class="mb-4">
                        <label for="venue" class="form-label">Venue</label>
                        <input type="text" class="form-control" id="venue" name="venue" placeholder="Enter event venue" required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-success">Create Event</button>
                    </div>
                </form>

                <div class="text-center mt-4">
                    <a href="adminDashboard.jsp" class="btn btn-link">← Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
