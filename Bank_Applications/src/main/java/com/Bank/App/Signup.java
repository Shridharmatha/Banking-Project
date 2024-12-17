package com.Bank.App;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.*;
import com.Bank.DTO.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;

@WebServlet("/Signup")
public class Signup extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		HttpSession session=req.getSession();
		String Name=req.getParameter("name");
		String phonenum=req.getParameter("number");
		String mail=req.getParameter("email");
		String pins=req.getParameter("pin");
		String conpins=req.getParameter("conpin");
//		PrintWriter out=resp.getWriter();
		
		long Phone=Long.parseLong(phonenum);
		int Pin=Integer.parseInt(pins);
		int cnfpin=Integer.parseInt(conpins);
		
		Customer c=new Customer();
		CustomerDAO cdao=new CustomerDAOImpl();
	
		if(Pin==cnfpin )
		{
			c.setName(Name);
			c.setPhone(Phone);
			c.setMail(mail);
			c.setPin(Pin);
			
			boolean res=cdao.insertCustomer(c);
			if(res)
			{
				req.setAttribute("success", "data added Successfully");
				req.setAttribute("cust", c);
				RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
				rd.forward(req, resp);
				
			}
			else
			{
				req.setAttribute("failure", "data failed to add");
				RequestDispatcher rd=req.getRequestDispatcher("Signup.jsp");
				rd.forward(req, resp);
			}
		
		}
	}

}

