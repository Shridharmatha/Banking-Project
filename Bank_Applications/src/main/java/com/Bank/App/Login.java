package com.Bank.App;
import java.io.IOException;
import java.util.*;
import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String mail=req.getParameter("mail");
		String pass=req.getParameter("pass");
		int pass1=Integer.parseInt(pass);
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=cdao.getCustomer(mail, pass1);
		
		
		if(c!=null)
		{
		    
			session.setAttribute("customer",c);
			RequestDispatcher rd=req.getRequestDispatcher("Dashbord.jsp");
			rd.forward(req, resp);	
			
			session.setAttribute("customer",c);
			RequestDispatcher rd2=req.getRequestDispatcher("Admin.jsp");
			rd2.forward(req, resp);	
			

		}else {
			
			req.setAttribute("failure", "Failed to Login");
			RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
		}
		
	}
		
	}
	


