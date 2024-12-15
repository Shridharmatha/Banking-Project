package com.Bank.App;
import java.io.IOException;
import java.util.Scanner;
import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/update")
public class UpdateAccount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	HttpSession session=req.getSession(false);
	String accno=req.getParameter("accountNo");
	long acc=Long.parseLong(accno);
	String phoneno=req.getParameter("phoneNo");
	long phone=Long.parseLong(phoneno);
	String mail=req.getParameter("email");
	String pins=req.getParameter("pin");
	int pin=Integer.parseInt(pins);
	String name=req.getParameter("name");
	
	Customer c=(Customer)session.getAttribute("customer");
	CustomerDAO cdao=new CustomerDAOImpl();
	
	if(acc==c.getAccno())
	{
		c.setPhone(phone);
		c.setMail(mail);
		c.setPin(pin);
		c.setName(name);
		boolean res=cdao.updateCustomer(c);
		if(res)
		{
			req.setAttribute("success", " Account Updated successfully");
			 RequestDispatcher rd=req.getRequestDispatcher("UpdateAccount.jsp");
			 rd.forward(req, resp);
		}else {
			req.setAttribute("failure", "Account failed to Update");
			 RequestDispatcher rd=req.getRequestDispatcher("TransferAmount.jsp");
			 rd.forward(req, resp);
		}
	}
	
	}


}
