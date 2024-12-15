<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer Amount</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #43cea2, #185a9d);
            color: #ffffff;
            font-family: 'Roboto', sans-serif;
            padding: 20px;
        }
        .transfer-form {
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
        <div class="transfer-form">
            <h3 class="form-title">Transfer Amount</h3>
   <%String Success=(String)request.getAttribute("success");
  if(Success!=null){%>
  <h5 class="text-success"><%=Success %></h5>
  <%} %>

 <%String failure=(String)request.getAttribute("failure");
 if(failure!=null){%>
  <h1 class="text-danger"><%=failure %></h1>
  <%} %> 
            <form action="transfer" method="post">
                <div class="input-group">
                    <label for="userAccountNo" class="form-label">User Account Number</label>
                    <input type="text" class="form-control" id="userAccountNo" name="userAccountNo" value="<%=c.getAccno()%>" required>
                </div>
                <div class="input-group">
                    <label for="pin" class="form-label">PIN</label>
                    <input type="password" class="form-control" id="pin" name="pin" placeholder="Enter your PIN" required>
                </div>
                <div class="input-group">
                    <label for="beneficiaryAccountNo" class="form-label">Beneficiary Account Number</label>
                    <input type="text" class="form-control" id="beneficiaryAccountNo" name="beneficiaryAccountNo" placeholder="Enter beneficiary account number" required>
                </div>
                <div class="input-group">
                    <label for="amount" class="form-label">Amount</label>
                    <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter amount to transfer" required>
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Transfer</button>
                     <a href="Dashbord.jsp" class="btn btn-primary">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>

    <footer>
        &copy; State bank of india. All rights reserved.
    </footer>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
