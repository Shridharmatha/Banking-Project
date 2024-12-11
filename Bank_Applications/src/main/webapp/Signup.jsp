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
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h3 class="text-center">Signup</h3>
                        <%String success=(String)request.getAttribute("success"); %>
                        <%if(success!=null) {%>
                       <h2 class="--bs-success-text-emphasis"><%="success" %></h2>
                        <%} %>
                        
                         <%String failure=(String)request.getAttribute("failure"); %>
                        <%if(failure!=null) {%>
                       <h2 class="--bs-danger-text-emphasis"><%="failure" %></h2>
                        <%} %>
                    </div>
                    <div class="card-body">
                        <form action="Signup" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name">
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="tel" class="form-control" id="phone" name="number" placeholder="Enter your phoneno">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Pin</label>
                                <input type="password" class="form-control" id="password" name="pin" placeholder="Enter your pin">
                            </div>
                            <div class="mb-3">
                                <label for="Conpassword" class="form-label">ConPin</label>
                                <input type="password" class="form-control" id="Conpassword" name="conpin" placeholder="Enter your Conpin">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
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
