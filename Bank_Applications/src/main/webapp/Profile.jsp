<%@page import="com.Bank.DAO.TransactionDAOImpl"%>
<%@page import="com.Bank.DAO.TransactionDAO"%>
<%@page import="com.Bank.DTO.Transaction"%>
<%@page import="com.Bank.DTO.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Application - Profile Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-header {
            background-color: #007bff;
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .card {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%Customer c=(Customer)session.getAttribute("customer"); %>
<%Transaction t1=new Transaction();
t1.setUser(c.getAccno());
session.setAttribute("tran", t1); %>
<%Transaction t=(Transaction)session.getAttribute("tran"); %>

<%TransactionDAO tdao=new TransactionDAOImpl();  
ArrayList<Transaction> transList=(ArrayList<Transaction>)tdao.getTransaction(t.getUser());
Iterator<Transaction> it=transList.iterator(); %>

    <div class="container mt-5">
        <!-- Profile Header -->
        <div class="profile-header">
            <h1>Customer Profile</h1>
            <p>Hi <%= c.getName() %> Welcome to your profile page</p>
        </div>

        <!-- Customer Information -->
        <div class="card shadow">
            <div class="card-body">
                <h5 class="card-title">Customer Information</h5>
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Name:</strong> <%=c.getName() %></p>
                        <p><strong>Email:</strong> <%=c.getMail() %> </p>
                        <a href="Dashbord.jsp" class="btn btn-primary">Go To Dashbord</a>
                    </div>
                    <div class="col-md-6">
                        <p><strong>Phone:</strong> <%=c.getPhone() %></p>
                        <p><strong>Account Number:</strong> <%=c.getAccno()%></p>
                        <p><strong>Balance:</strong> <%=c.getBal() %> </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Transaction History -->
        <div class="card shadow">
            <div class="card-body">
                <h5 class="card-title">Transaction History</h5>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="table-primary">
                            <tr>
                                <th>Date</th>
                                <th>Transaction ID</th>
                                <th>UserAccount</th>
                                <th>RecverAccount</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        
                        <%while(it.hasNext()){
                          Transaction T=it.next();
                        %>
                            <tr>
                                <td><%=T.getDate() %></td>
                                <td><%=T.getTransactionId() %></td>
                                <td><%=T.getUser() %></td>
                                <td><%=T.getRec_acc() %></td>
                                <td><%=T.getAmount() %></td>
                                <td><span class="badge bg-success"><%=T.getTransaction() %></span></td>
                            </tr>
                          <%} %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>