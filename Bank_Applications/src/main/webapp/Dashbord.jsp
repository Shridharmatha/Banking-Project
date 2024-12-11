<%@page import="java.util.Iterator"%>
<%@page import="com.Bank.DAO.TransactionDAOImpl"%>
<%@page import="com.Bank.DAO.TransactionDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 240px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #1e2957;
            color: white;
            padding: 20px;
        }

        .sidebar .nav-link {
            color: #ccc;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 8px;
            display: flex;
            align-items: center;
        }

        .sidebar .nav-link:hover {
            background-color: #2d3e89;
            color: white;
        }

        .sidebar .nav-link i {
            margin-right: 10px;
        }

        /* Navbar */
        .navbar {
            margin-left: 240px;
            background-color: #ffffff;
            border-bottom: 1px solid #ddd;
        }

        .navbar .navbar-brand {
            color: #1e2957;
            font-weight: bold;
        }

        .navbar .nav-item .nav-link {
            color: #666;
        }

        .navbar .nav-item .nav-link:hover {
            color: #1e2957;
        }

        /* Main Section */
        .main-content {
            margin-left: 240px;
            padding: 20px;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #f8aa27;
            color: white;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .card-body h5 {
            font-size: 20px;
        }

        /* Footer */
        footer {
            margin-left: 240px;
            padding: 20px;
            background-color: #ffffff;
            border-top: 1px solid #ddd;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>

<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
<%TransactionDAO tdao=new TransactionDAOImpl();  
ArrayList<Transaction> t=(ArrayList<Transaction>)tdao.getTransaction();
Iterator<Transaction> it=t.iterator(); %>

    <!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-white mb-4">Bank Dashboard</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="#"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a class="nav-link" href="Deposit.jsp"><i class="bi bi-wallet2"></i> Deposit</a>
            <a class="nav-link" href="#"><i class="bi bi-arrow-left-right"></i> Withdraw</a>
            <a class="nav-link" href="#"><i class="bi bi-graph-up"></i> Investments</a>
            <a class="nav-link" href="#"><i class="bi bi-credit-card"></i> Cards</a>
            <a class="nav-link" href="#"><i class="bi bi-gear"></i> Settings</a>
        </nav>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">SBI(State bank of india)</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <form action="Profile.jsp" method="get">
                     <button type="submit" class="btn btn-primary btn-lg">Profile</button>
                     </form>
                </li>
                <li class="nav-item">
                    <form action="/logout" method="POST">
                    <button type="submit" class="btn btn-danger btn-lg"> Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h3 class="mb-4">Welcome, <%=c.getName()%></h3>

            <!-- Dashboard Cards -->
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Account Balance</div>
                        <div class="card-body">
                            <h5><%=c.getBal() %></h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Last Transaction</div>
                        <div class="card-body">
                            <h5></h5>
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Investment Value</div>
                        <div class="card-body">
                            <h5></h5>
                        </div>
                    </div>
                </div>
            </div>

           <!-- Transaction Table -->
      <div class="mt-4">
    <h4>Recent Transactions</h4>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Date</th>
                <th>UserID</th>
                <th>TransactioID</th>
                <th>Amount</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        
            <% 
            int i=0;
           while(it.hasNext() && i<5){
        	   Transaction T=it.next();
            %>
           
            <tr>
                <td><%= T.getDate() %></td>
                <td><%= T.getUser()%></td>
                <td><%=T.getTransactionId() %></td>
                <td><%= T.getBalance() %></td>
                <td><span class="badge bg-success"><%=T.getTransaction() %></span></td> 
            </tr>
            <% 
            i++;
            } 
            %>
           
        </tbody>
    </table>
</div>
      

        </div>
    </div>

    <!-- Footer -->
    <footer>
        © 2024 State Bank of India. All rights reserved.
    </footer>

    <!-- Bootstrap Icons -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>