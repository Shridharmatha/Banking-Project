<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #43cea2, #185a9d);
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
            background: linear-gradient(to right, #43cea2, #185a9d);
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .card-header h3 {
            color: #fff;
            font-weight: bold;
            text-align: center;
            margin: 0;
        }

        .btn-success {
            background: linear-gradient(to right, #43cea2, #185a9d);
            border: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            width: 100%;
        }

        .btn-success:hover {
            background: linear-gradient(to right, #185a9d, #43cea2);
        }

        .form-label {
            color: #185a9d;
            font-weight: bold;
        }

        .text-center a {
            color: #185a9d;
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
                        <h3>Login</h3>
                    </div>
                    <div class="card-body">
                    <%Customer c=(Customer)request.getAttribute("cust"); %>
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
                        <form action="Login" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <%if(c!=null){ %>
                                <input type="email" class="form-control" id="email" name="mail" value="<%=c.getMail() %>" required>
                                <%}else{ %>
                                <input type="email" class="form-control" id="email" name="mail" placeholder="Enter your email" required>
                                <%} %>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">PIN</label>
                                <input type="password" class="form-control" id="password" name="pass" placeholder="Enter your PIN" required>
                            </div>
                            <button type="submit" class="btn btn-success">Login</button>
                        </form>
                        <div class="mt-3 text-center">
                            <a href="Signup.jsp">Don't have an account? Signup</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>