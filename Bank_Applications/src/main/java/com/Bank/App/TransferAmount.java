package com.Bank.App;
import com.Bank.DTO.*;
import com.Bank.DAO.*;
import com.Bank.DAO.TransactionDAOImpl;
import java.util.*;

public class TransferAmount {

	public static void TransferAmount(Customer c)
	{
		CustomerDAO cdao=new CustomerDAOImpl();
		Transaction t1=null;
		Transaction t2=null;
		TransactionDAO tdao=new TransactionDAOImpl();
		Scanner sc=new Scanner(System.in);
		System.out.println("enter the amount to be transferd");
		double amount=sc.nextDouble();
		System.out.println("enter the benfisery acccount number");
		Long receiver_accno=sc.nextLong();
		Customer receiver=cdao.getCustomer(receiver_accno);
		if(c.getAccno()!=receiver.getAccno()&&c.getBal()>0&&c.getBal()>=amount&&amount>0)
		{
			System.out.println("enter the pin");
			int pin=sc.nextInt();
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
					t1.setTransaction("Debited");
					t1.setAmount(amount);
					t1.setBalance(c.getBal());
					boolean res1=tdao.insertTransaction(t1);
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
				if(c_res&& receiver_res)
				{
					System.out.println("transaction successful");
				}
				else
				{
					System.out.println("Transaction Failed");
				}
			}
		}
		else
		{
			System.out.println("transaction failed!!!");
		}
	}
}
