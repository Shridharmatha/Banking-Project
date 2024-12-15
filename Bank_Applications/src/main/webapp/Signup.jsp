<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            font-family: 'Arial', sans-serif;
            color: #ffffff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .card-header h3 {
            color: #fff;
            font-weight: bold;
            text-align: center;
            margin: 0;
        }

        .btn-primary {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            width: 100%;
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #feb47b, #ff7e5f);
        }

        .form-label {
            color: #ff7e5f;
            font-weight: bold;
        }

        .text-center a {
            color: #ff7e5f;
            font-weight: bold;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        .alert {
            font-size: 14px;
            margin-bottom: 20px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h3>Signup</h3>
                    </div>
                    <div class="card-body">
                        <% String success = (String) request.getAttribute("success"); 
                           if (success != null) { %>
                            <div class="alert alert-success text-center">
                                <%= success %>
                            </div>
                        <% } %>
                        <% String failure = (String) request.getAttribute("failure"); 
                           if (failure != null) { %>
                            <div class="alert alert-danger text-center">
                                <%= failure %>
                            </div>
                        <% } %>
                        <form action="Signup" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="tel" class="form-control" id="phone" name="number" placeholder="Enter your phone number" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">PIN</label>
                                <input type="password" class="form-control" id="password" name="pin" placeholder="Enter your PIN" required>
                            </div>
                            <div class="mb-3">
                                <label for="Conpassword" class="form-label">Confirm PIN</label>
                                <input type="password" class="form-control" id="Conpassword" name="conpin" placeholder="Re-enter your PIN" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Sign Up</button>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="Login.jsp">Already have an account? Login</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>