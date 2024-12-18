<%@page import="java.util.Iterator"%>
<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Bank.DAO.TransactionDAOImpl"%>
<%@page import="com.Bank.DAO.TransactionDAO"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e0f7fa;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            padding: 20px 0;
            border-bottom: 2px solid #009688;
            background-color: #00796b;
            color: #ffffff;
            border-radius: 8px 8px 0 0;
        }

        .header h1 {
            margin: 0;
            color: #ffffff;
        }

        .admin-details {
            margin: 20px 0;
            padding: 20px;
            border: 1px solid #009688;
            border-radius: 8px;
            background: #b2dfdb;
            color: #004d40;
        }

        .admin-details h2 {
            margin-bottom: 15px;
            color: #00695c;
        }

        .admin-details p {
            margin: 8px 0;
            line-height: 1.6;
        }

        .admin-details .back-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background: #009688;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }

        .admin-details .back-btn:hover {
            background: #00796b;
        }

        .user-table {
            margin: 20px 0;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background: #e0f2f1;
        }

        table th, table td {
            text-align: left;
            padding: 12px;
            border: 1px solid #004d40;
        }

        table th {
            background: #004d40;
            color: #ffffff;
        }

        table tr:nth-child(even) {
            background: #a7ffeb;
        }

        table tr:nth-child(odd) {
            background: #80cbc4;
        }

        .delete-btn {
            padding: 8px 12px;
            color: #ffffff;
            background: #d32f2f;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background: #b71c1c;
        }
    </style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("customer"); %>
<%TransactionDAO tdao=new TransactionDAOImpl(); 
ArrayList<Transaction> lst=(ArrayList<Transaction>)tdao.getTransaction();
Iterator<Transaction> it=lst.iterator();%>
    <div class="container">
        <div class="header">
            <h1>Welcome, Admin <%=c.getName() %></h1>
        </div>

        <div class="admin-details">
            <h2>Admin Details</h2>
            <p><strong>Name:</strong><%=c.getName() %></p>
            <p><strong>Phone:</strong><%=c.getPhone() %></p>
            <p><strong>Email:</strong> <%=c.getMail() %></p>
            <p><strong>Account Number:</strong> <%=c.getAccno() %></p>
            <p><strong>Balance:</strong> <%=c.getBal() %></p>
            <a href="Dashbord.jsp" class="back-btn">Back to Dashboard</a>
            <a href="Admin.jsp" class="back-btn">Back to Admin</a>
        </div>

        <div class="user-table">
            <h2>Transaction Details</h2>
            <table>
                <thead>
                    <tr>
                        <th>Transaction ID</th>
                        <th>User Account</th>
                        <th>Receiver Account</th>
                        <th>Transaction Date</th>
                        <th>Transaction Type</th>
                        <th>Amount</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                <% while(it.hasNext()) {
                  Transaction T=it.next();
                %>
                    <tr>
                        <td><%=T.getTransactionId() %></td>
                        <td><%=T.getUser() %></td>
                        <td><%=T.getRec_acc() %></td>
                        <td><%=T.getDate() %></td>
                        <td><%=T.getTransaction() %></td>
                        <td><%=T.getAmount() %></td>
                        <td><%=T.getBalance() %></td>
                    </tr>
                   <%} %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
