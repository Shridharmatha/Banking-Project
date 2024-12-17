package com.Bank.App;
import com.Bank.DTO.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.Bank.DAO.*;
import com.Bank.DAO.TransactionDAOImpl;

import java.io.IOException;
import java.util.*;
@WebServlet("/transfer")
public class TransferAmount extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		String accno=req.getParameter("userAccountNo");
		long acc=Long.parseLong(accno);
		String pins=req.getParameter("pin");
		int pin=Integer.parseInt(pins);
		String benaccnos=req.getParameter("beneficiaryAccountNo");
		long benaccno=Long.parseLong(benaccnos);
		String amounts=req.getParameter("amount");
		double amount=Double.parseDouble(amounts);
		Customer c=(Customer)session.getAttribute("customer");
		CustomerDAO cdao=new CustomerDAOImpl();
		Transaction t1=null;
		Transaction t2=null;
		TransactionDAO tdao=new TransactionDAOImpl();
		
		Customer receiver=cdao.getCustomer(benaccno);
		if(c.getAccno()!=receiver.getAccno()&&c.getBal()>0&&c.getBal()>=amount&&amount>0)
		{
			if(pin==c.getPin())
			{
				c.setBal(c.getBal()-amount);
				boolean c_res=cdao.updateCustomer(c);
				if(c_res)
				{
					t1=new Transaction();
					t1.setTransactionId(TransactionID.generateTransactionId());
					t1.setUser(c.getAccno());
					t1.setRec_acc(receiver.getAccno());
					t1.setTransaction("DEBITED");
					t1.setAmount(amount);
					t1.setBalance(c.getBal());
					boolean res1=tdao.insertTransaction(t1);
					
					 req.setAttribute("success", "Amount transfered successfully");
					 RequestDispatcher rd=req.getRequestDispatcher("TransferAmount.jsp");
					 rd.forward(req, resp);
				}
				receiver.setBal(receiver.getBal()+amount);
				boolean receiver_res=cdao.updateCustomer(receiver);
				if(receiver_res)
				{
					{
						t2=new Transaction();
						t2.setTransactionId(t1.getTransactionId());
						t2.setUser(receiver.getAccno());
						t2.setRec_acc(c.getAccno());
						t2.setTransaction("CREDITED");
						 t2.setAmount(amount);
						t2.setBalance(receiver.getBal());
						boolean res1=tdao.insertTransaction(t2);
					}
					
				}
//				if(c_res&& receiver_res)
//				{
//					System.out.println("transaction successful");
//				}
//				else
//				{
//					System.out.println("Transaction Failed");
//				}
			}
		}
		else
		{
			 req.setAttribute("failure", "Amount failed debit");
			 RequestDispatcher rd=req.getRequestDispatcher("TransferAmount.jsp");
			 rd.forward(req, resp);
		}
	}
}
