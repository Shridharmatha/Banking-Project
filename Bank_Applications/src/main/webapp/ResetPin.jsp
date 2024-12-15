<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset PIN</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            color: #ffffff;
            font-family: 'Roboto', sans-serif;
            padding: 20px;
        }
        .reset-form {
            max-width: 550px;
            margin: auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            color: #333;
        }
        .form-title {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: bold;
            color: #185a9d;
        }
        .form-label {
            font-weight: bold;
            color: #185a9d;
            text-align: left;
            display: block;
            margin-bottom: 8px;
        }
        .input-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        .input-group input {
            text-align: justify;
        }
        .btn-primary {
            background: linear-gradient(to right, #43cea2, #185a9d);
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 10px;
        }
        .btn-primary:hover {
            background: linear-gradient(to right, #185a9d, #43cea2);
        }
        footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: #ffffff;
        }
    </style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
    <div class="container">
        <div class="reset-form">
            <h3 class="form-title">Reset Your PIN</h3>
<%String Success=(String)request.getAttribute("success");
  if(Success!=null){%>
  <h5 class="text-success"><%=Success %></h5>
  <%} %>

 <%String failure=(String)request.getAttribute("failure");
 if(failure!=null){%>
  <h1 class="text-danger"><%=failure %></h1>
  <%} %> 
            <form action="reset" method="post">
                <div class="input-group">
                    <label for="email" class="form-label">Email ID</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%=c.getMail() %>" required>
                </div>
                <div class="input-group">
                    <label for="accountNo" class="form-label">Account Number</label>
                    <input type="text" class="form-control" id="accountNo" name="accountNo" value="<%=c.getAccno() %>" required>
                </div>
                <div class="input-group">
                    <label for="phone" class="form-label">Phone Number</label>
                    <input type="text" class="form-control" id="phone" name="phone" value="<%=c.getPhone() %>" required>
                </div>
                <div class="input-group">
                    <label for="newPin" class="form-label">New PIN</label>
                    <input type="password" class="form-control" id="newPin" name="newPin" placeholder="Enter new PIN" required>
                </div>
                <div class="input-group">
                    <label for="confirmPin" class="form-label">Confirm New PIN</label>
                    <input type="password" class="form-control" id="confirmPin" name="confirmPin" placeholder="Confirm new PIN" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Reset PIN</button>
                    <br>
                    <br>
                     <a href="Dashbord.jsp" class="btn btn-primary">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>

    <footer>
        &copy; State Bank of India. All rights reserved.
    </footer>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
