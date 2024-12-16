package com.Bank.App;

import java.io.IOException;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;
import com.Bank.DTO.TransactionID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeletAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accno = req.getParameter("acc");
        long acc=Long.parseLong(accno);
        String amounts = req.getParameter("amt");
        double amount=Double.parseDouble(amounts);
       HttpSession session=req.getSession(false);
        Customer admin = (Customer) session.getAttribute("customer");

        CustomerDAO cdao = new CustomerDAOImpl();
        TransactionDAO tdao=new TransactionDAOImpl();
        Transaction t1=null;
        Transaction t2=null;
        Customer c = cdao.getCustomer(acc);

        if(admin.getAccno()!=c.getAccno())
        {
        	if(acc==c.getAccno())
  		  {
  			  c.setBal(c.getBal()-amount);
  			  boolean s_res=cdao.updateCustomer(c);
  			  if(s_res)
  			  {
  				  t1=new Transaction();
  				  t1.setTransactionId(TransactionID.generateTransactionId());
  				  t1.setUser(c.getAccno());
  				  t1.setRec_acc(admin.getAccno());
  				  t1.setTransaction("DEBITED");
  				  t1.setBalance(c.getBal());
  				  t1.setAmount(amount);
  				  boolean res1=tdao.insertTransaction(t1);
					
					 req.setAttribute("success", "Amount transfered successfully");
					 RequestDispatcher rd=req.getRequestDispatcher("Admin.jsp");
					 rd.forward(req, resp);
  			  }
  			  admin.setBal(admin.getBal()+amount);
  			  boolean r_res=cdao.updateCustomer(admin);
  			  if(r_res)
  			  {
  				  t2=new Transaction();
  				  t2.setTransactionId(TransactionID.generateTransactionId());
  				  t2.setUser(admin.getAccno());
  				  t2.setRec_acc(c.getAccno());
  				  t2.setTransaction("CREDITED");
  				  t2.setBalance(admin.getBal());
  				  t2.setAmount(amount);
  				  boolean res1=tdao.insertTransaction(t2);
  			  }
  			  
  		  }else {
  			  req.setAttribute("failure", "failed to transfered amount");
					 RequestDispatcher rd=req.getRequestDispatcher("Admin.jsp");
					 rd.forward(req, resp);
  			  
  		  }

        	
        	boolean res = cdao.deleteCustomre(c);
            if (res) {
                req.setAttribute("success", "Successfully deleted account.");
            } else {
                req.setAttribute("failure", "Failed to delete the account.");
            }

            RequestDispatcher rd = req.getRequestDispatcher("Admin.jsp");
            rd.forward(req, resp);
        }else {
        	req.setAttribute("failure", "Failed to delete the admin account.");
        	RequestDispatcher rd = req.getRequestDispatcher("Admin.jsp");
            rd.forward(req, resp);
        }
        
    }
}
