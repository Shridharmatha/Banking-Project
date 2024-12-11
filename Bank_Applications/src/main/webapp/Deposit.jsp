<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Money</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            font-family: 'Arial', sans-serif;
        }

        .deposit-container {
            max-width: 500px;
            margin: 50px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .deposit-container h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .btn-primary {
            width: 100%;
        }
    </style>
</head>

<body>
  <%Customer c=(Customer)session.getAttribute("customer"); %>
    <div class="container">
        <div class="deposit-container">
            <h3>Deposit Money</h3>
          
 <%String Success=(String)request.getAttribute("success");
  if(Success!=null){%>
  <h5 class="text-success"><%=Success %></h5>
  <%} %>

 <%String failure=(String)request.getAttribute("failure");
 if(failure!=null){%>
  <h1 class="text-danger"><%="failure" %></h1>
  <%} %> 
            
            <form action="DepositServlet" method="post">
                <div class="mb-3">
                    <label for="accno" class="form-label">Account Number</label>
                    <input type="text" class="form-control" id="accno" name="accno" value="<%=c.getAccno() %>" required>
                </div>

                <div class="mb-3">
                    <label for="pin" class="form-label">PIN</label>
                    <input type="password" class="form-control" id="pin" name="pin" placeholder="Enter your PIN" required>
                </div>

                <div class="mb-3">
                    <label for="amount" class="form-label">Deposit Amount</label>
                    <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter deposit amount" required>
                </div>

                <button type="submit" class="btn btn-primary">Deposit</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
