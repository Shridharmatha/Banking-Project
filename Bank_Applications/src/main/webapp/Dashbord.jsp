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
            background: linear-gradient(120deg, #d4e3fc, #f9f9f9);
            margin: 0;
        }

        /* Sidebar */
        .sidebar {
            height: 100vh;
            width: 260px;
            position: fixed;
            top: 0;
            left: 0;
            background: linear-gradient(180deg, #003366, #00509e);
            color: white;
            padding: 30px 20px;
        }

        .sidebar h4 {
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 20px;
            color: #f8aa27;
        }

        .sidebar .nav-link {
            color: #f9f9f9;
            margin-bottom: 15px;
            padding: 10px 15px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            transition: 0.3s;
        }

        .sidebar .nav-link:hover {
            background-color: #4c8fd1;
            color: white;
        }

        .sidebar .nav-link i {
            margin-right: 10px;
        }

        /* Navbar */
        .navbar {
            margin-left: 260px;
            background: #ffffff;
            border-bottom: 2px solid #ddd;
            padding: 15px 20px;
        }

        .navbar .navbar-brand {
            color: #003366;
            font-weight: bold;
        }

        .navbar .btn {
            border-radius: 25px;
            font-size: 14px;
            padding: 5px 20px;
        }

        .navbar .btn-primary {
            background: #4CAF50;
            border: none;
        }

        .navbar .btn-primary:hover {
            background: #45a049;
        }

        .navbar .btn-danger {
            background: #f44336;
            border: none;
        }

        .navbar .btn-danger:hover {
            background: #e53935;
        }

        /* Main Content */
        .main-content {
            margin-left: 260px;
            padding: 30px;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(90deg, #003366, #00509e);
            color: white;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
            font-weight: bold;
        }

        .card-body h5 {
            font-size: 22px;
            color: #333;
        }

        /* Table */
        .table-bordered {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
        }

        .table-bordered thead th {
            background: #003366;
            color: white;
            font-weight: bold;
            text-align: center;
        }

        .table-bordered tbody tr:nth-child(odd) {
            background: #f2f7ff;
        }

        .table-bordered tbody tr:nth-child(even) {
            background: #e1efff;
        }

        .table-bordered tbody td {
            text-align: center;
            color: #555;
        }

        .badge.bg-success {
            background: #4CAF50;
        }

        .badge.bg-danger {
            background: #f44336;
        }

        /* Footer */
        footer {
            margin-left: 260px;
            padding: 20px;
            background-color: #ffffff;
            border-top: 1px solid #ddd;
            text-align: center;
            font-size: 14px;
            color: #555;
        }
    </style>
</head>

<body>
    <% Customer c=(Customer)session.getAttribute("customer"); %>
    <% TransactionDAO tdao = new TransactionDAOImpl();
        ArrayList<Transaction> t = (ArrayList<Transaction>) tdao.getTransaction();
        Iterator<Transaction> it = t.iterator(); %>
<%if(c.getAccno()==1100110011){ %>
    <!-- Sidebar -->
    <div class="sidebar">
        <h4>Bank Dashboard</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="Admin.jsp"><i class="bi bi-speedometer2"></i> Admin Page</a>
            <a class="nav-link" href="Deposit.jsp"><i class="bi bi-wallet2"></i> Deposit</a>
            <a class="nav-link" href="TransferAmount.jsp"><i class="bi bi-arrow-left-right"></i> Transfer Amount</a>
            <a class="nav-link" href="UpdateAccount.jsp"><i class="bi bi-graph-up"></i> Update Account</a>
            <a class="nav-link" href="ResetPin.jsp"><i class="bi bi-credit-card"></i> Reset Pin</a>
            <a class="nav-link" href="#"><i class="bi bi-gear"></i> Settings</a>
        </nav>
    </div>
<%}else{%>

<div class="sidebar">
        <h4>Bank Dashboard</h4>
        <nav class="nav flex-column">
           
            <a class="nav-link" href="Deposit.jsp"><i class="bi bi-wallet2"></i> Deposit</a>
            <a class="nav-link" href="TransferAmount.jsp"><i class="bi bi-arrow-left-right"></i> Transfer Amount</a>
            <a class="nav-link" href="UpdateAccount.jsp"><i class="bi bi-graph-up"></i> Update Account</a>
            <a class="nav-link" href="ResetPin.jsp"><i class="bi bi-credit-card"></i> Reset Pin</a>
            <a class="nav-link" href="#"><i class="bi bi-gear"></i> Settings</a>
        </nav>
    </div>
<% }%>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">SBI (State Bank of India)</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <form action="Profile.jsp" method="get">
                        <button type="submit" class="btn btn-primary btn-lg">Profile</button>
                    </form>
                </li>
                <li class="nav-item">
                    <form action="Logout" method="get">
                        <button type="submit" class="btn btn-danger btn-lg">Logout</button>
                    </form>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h3 class="mb-4" style="color: #003366;">Welcome, <%= c.getName() %></h3>

            <!-- Dashboard Cards -->
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Account Balance</div>
                        <div class="card-body">
                            <h5><%= c.getBal() %>/-</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Apply loan</div>
                        <div class="card-body">
                            <a href="#" class="btn btn-primary">Go To Application</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-header">Investment Value</div>
                        <div class="card-body">
                            <h5>In Progress</h5>
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
                            <th>Transaction ID</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <% 
                        int i = 0;
                        while (it.hasNext() && i < 5) {
                            Transaction T = it.next();
                        %>
                        
                            <td><%= T.getDate() %></td>
                            <td><%= T.getUser() %></td>
                            <td><%= T.getTransactionId() %></td>
                            <td><%= T.getBalance() %>/-</td>
                            <td>
                                <span class="badge <%= T.getTransaction().equals("Success") ? "bg-success" : "bg-danger" %>">
                                    <%= T.getTransaction() %>
                                </span>
                            </td>
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
        © 2024 State Bank of India. (Developed by @Shridhar) All rights reserved.
    </footer>

    <!-- Bootstrap Icons -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>
