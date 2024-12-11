package com.Bank.App;
import java.io.IOException;
import java.util.*;
import com.Bank.DTO.Customer;
import com.Bank.DTO.TransactionID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.*;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Transaction;
@WebServlet("/DepositServlet")
public class Deposit extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession(false);
		String acc=req.getParameter("accno");
		String pins=req.getParameter("pin");
		long accno=Long.parseLong(acc);
		int pin=Integer.parseInt(pins);
		String amounts=req.getParameter("amount");
		double amount=Double.parseDouble(amounts);
		
		CustomerDAO cdao=new CustomerDAOImpl();
		TransactionDAO tdao=new TransactionDAOImpl();
		Customer c=(Customer)session.getAttribute("customer");
		if(accno==c.getAccno()&&pin==c.getPin())
		{
			c.setBal(c.getBal()+amount);
			 boolean res=cdao.updateCustomer(c);
			 if(res)
			 {
				 req.setAttribute("success", "Amount added successfully");
				 RequestDispatcher rd=req.getRequestDispatcher("Deposit.jsp");
				 rd.forward(req, resp);
				 
			 Transaction t=new Transaction();
			 
			 t.setTransactionId(TransactionID.generateTransactionId());
			 t.setUser(c.getAccno());
			 t.setRec_acc(c.getAccno());
			 t.setTransaction("CREDITED");
			 t.setAmount(amount);
			 t.setBalance(c.getBal());
			 boolean res1=tdao.insertTransaction(t);
			 if(res1)
			 { 
				 req.setAttribute("success", "Transaction successfully");
				 RequestDispatcher rd1=req.getRequestDispatcher("Deposit.jsp");
				 rd.forward(req, resp);
			
			 }
			 else
			 {
				 req.setAttribute("failure", "Transaction failure");
				 RequestDispatcher rd1=req.getRequestDispatcher("Deposit.jsp");
				 rd.forward(req, resp);
			 }
			 }
		}
		else {
			req.setAttribute("failure", "Amount added successfully");
			 RequestDispatcher rd=req.getRequestDispatcher("Deposit.jsp");
			 rd.forward(req, resp);
		}
		 
		}


}
