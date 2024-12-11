package com.Bank.App;

import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;
import java.util.Iterator;
import java.util.List;
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpl;
public class Passbook {
	public static void getPassbook(Customer c)
	{
		TransactionDAO tdao=new TransactionDAOImpl();
		List<Transaction> passbook=tdao.getTransaction(c.getAccno());
		Iterator<Transaction> it=passbook.iterator();
		while(it.hasNext())
		{
			Transaction t=it.next();
			System.out.println("<------------------------------------------>");
			System.out.println("TransactionId"+t.getTransactionId());
			System.out.println("Account_Number:"+t.getRec_acc());
			System.out.println("Transaction Type:"+t.getTransaction());
			System.out.println("Transaction Date:"+t.getDate());
			if(t.getTransaction().equals("CREDITED"))
			{
				System.out.println("+"+t.getAmount());
				System.out.println("current Balance:"+t.getBalance());
				System.out.println("<----------------------------------------->");	
			}else{
				System.out.println("-"+t.getAmount());
				System.out.println("current Balance:"+t.getBalance());
				System.out.println("<----------------------------------------->");	
			}
			
		}
	}

}
