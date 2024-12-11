<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-success text-white">
                        <h3 class="text-center">Login</h3>
                    </div>
                    <%String success=(String)request.getAttribute("success");
                     if(success!=null){%>
                    <h1 class="--bs-success-text-emphasis"><%="success" %></h1>
                    <%} %>

                    <%String failure=(String)request.getAttribute("failure");
                    if(failure!=null){%>
                    <h1 class="--bs-danger-text-emphasis"><%="failure" %></h1>
                    <%} %> 
                    <div class="card-body">
                        <form action="Login" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="mail" placeholder="Enter your email">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="pass" placeholder="Enter your password">
                            </div>
                            <button type="submit" class="btn btn-success w-100">Login</button>
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
