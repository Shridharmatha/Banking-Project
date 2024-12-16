package com.Bank.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import com.Bank.DTO.Customer;
import com.Bank.connectors.ConnectionFactory;


public class CustomerDAOImpl implements CustomerDAO  {
	private Connection con;
	public CustomerDAOImpl()
	{
	 this.con=ConnectionFactory.requestConnection();
	 
	}
public boolean insertCustomer(Customer c) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		 String query="INSERT INTO CUSTOMER(NAME,PHONE,MAIL,PIN)VALUES(?,?,?,?)";
		 int res=0;
		 try {
		 con.setAutoCommit(false);
		 ps=con.prepareStatement(query);
		 ps.setString(1,c.getName());
		 ps.setLong(2, c.getPhone());
		 ps.setString(3, c.getMail());
		 ps.setInt(4, c.getPin());
		 res=ps.executeUpdate(); 
		 } catch (SQLException e) {
		 e.printStackTrace();
		 }
		 if(res>0)
		 {
		 try {
		 con.commit();
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return true;
		 }
		 else
		 { 
		 try {
		 con.rollback();
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return false;
		 }
		
	}

	public Customer getCustomer(long accno, int pin) {
		// TODO Auto-generated method stub
		//@Override
		 PreparedStatement ps=null;
		 ResultSet rs=null;
		 Customer c=null;
		 String query="SELECT * FROM CUSTOMER WHERE ACC_NO=? AND PIN=?";
		 try {
		 ps=con.prepareStatement(query);
		 ps.setLong(1,accno);
		 ps.setInt(2, pin);
		 rs=ps.executeQuery();
		 if(rs.next())
		 {
		 c=new Customer();
		 c.setAccno(rs.getInt(1));
		 c.setName(rs.getString(2));
		 c.setPhone(rs.getLong(3));
		 c.setMail(rs.getString(4));
		 c.setBal(rs.getDouble(5));
		 c.setPin(rs.getInt(6));
		 }
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return c;
	}

	public Customer getCustomer(long phone, String mail) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		 ResultSet rs=null;
		 Customer c=null;
		 String query="SELECT * FROM CUSTOMER WHERE PHONE=? AND MAIL=?";
		 try {
		 ps=con.prepareStatement(query);
		 ps.setLong(1,phone);
		 ps.setString(2, mail);
		 rs=ps.executeQuery();
		 if(rs.next())
		 {
		 c=new Customer();
		 c.setAccno(rs.getInt(1));
		 c.setName(rs.getString(2));
		 c.setPhone(rs.getLong(3));
		 c.setMail(rs.getString(4));
		 c.setBal(rs.getDouble(5));
		 c.setPin(rs.getInt(6));
		 }
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return c;
	}

	public Customer getCustomer(long accno) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		 ResultSet rs=null;
		 Customer c=null;
		 String query="SELECT * FROM CUSTOMER WHERE acc_no=? ";
		 try {
		 ps=con.prepareStatement(query);
		 ps.setLong(1,accno);
		 rs=ps.executeQuery();
		 if(rs.next())
		 {
		 c=new Customer();
		 c.setAccno(rs.getInt(1));
		 c.setName(rs.getString(2));
		 c.setPhone(rs.getLong(3));
		 c.setMail(rs.getString(4));
		 c.setBal(rs.getDouble(5));
		 c.setPin(rs.getInt(6));
		 }
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return c;
	}

	public List getCustomer() {
		PreparedStatement ps=null;
		 ArrayList<Customer> customers=new ArrayList<Customer>();
		 ResultSet rs=null;
		 Customer c=null;
		 String query="SELECT * FROM CUSTOMER";
		 try {
		 ps=con.prepareStatement(query);
		 rs=ps.executeQuery();
		 while(rs.next())
		 {
		 c=new Customer();
		 c.setAccno(rs.getInt(1));
		 c.setName(rs.getString(2));
		 c.setPhone(rs.getLong(3));
		 c.setMail(rs.getString(4));
		 c.setBal(rs.getDouble(5));
		 c.setPin(rs.getInt(6));
		 customers.add(c);
		 }
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return customers;
		
	}

	public boolean updateCustomer(Customer c) {
		 PreparedStatement ps=null;
		 int res=0;
		 String query="UPDATE CUSTOMER SET NAME=?,PHONE=?,MAIL=?,BALANCE=?,PIN=? WHERE ACC_NO=?";
		 try {
		 con.setAutoCommit(false);
		 ps=con.prepareStatement(query);
		 ps.setString(1, c.getName());
		 ps.setLong(2, c.getPhone());
		 ps.setString(3, c.getMail());
		 ps.setDouble(4, c.getBal());
		 ps.setInt(5, c.getPin());
		 ps.setLong(6, c.getAccno());
		 res=ps.executeUpdate();
		 
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 if(res>0)
		 {
		 try {
		 con.commit();
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return true;
		 }
		 else
		 {
		 try {
		 con.rollback();
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return false;
		 }
	}

//	public boolean deleteCustomer(Customer c) {
//		 PreparedStatement ps=null;
//		 int res=0;
//		 String query="DELETE FROM CUSTOMER WHERE ACC_NO=?";
//		 try {
//		 con.setAutoCommit(false);
//		 ps=con.prepareStatement(query);
//		 ps.setLong(1, c.getAccno());
//		 res=ps.executeUpdate();
//		 
//		 } catch (SQLException e) {
//		 // TODO Auto-generated catch block
//		 e.printStackTrace();
//		 }
//		 if(res>0)
//		 {
//		 try {
//		 con.commit();
//		 } catch (SQLException e) {
//		 // TODO Auto-generated catch block
//		 e.printStackTrace();
//		 }
//		 return true;
//		 }
//		 else
//		 {
//		 try {
//		 con.rollback();
//		 } catch (SQLException e) {
//		 // TODO Auto-generated catch block
//		 e.printStackTrace();
//		 }
//		 return false;
//		 }
//		}
	
	public Customer getCustomer(String mail, int pass) {
		PreparedStatement ps=null;
		 ResultSet rs=null;
		 Customer c=null;
		 String query="SELECT * FROM CUSTOMER WHERE mail=? AND pin=?";
		 try {
		 ps=con.prepareStatement(query);
		 ps.setString(1,mail);
		 ps.setInt(2, pass);
		 rs=ps.executeQuery();
		 if(rs.next())
		 {
		 c=new Customer();
		 c.setAccno(rs.getInt(1));
		 c.setName(rs.getString(2));
		 c.setPhone(rs.getLong(3));
		 c.setMail(rs.getString(4));
		 c.setBal(rs.getDouble(5));
		 c.setPin(rs.getInt(6));
		 }
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return c;
	}
	@Override
	public boolean deleteCustomre(Customer c) {
		PreparedStatement ps=null;
		 int res=0;
		 String query="DELETE FROM CUSTOMER WHERE ACC_NO=?";
		 try {
		 con.setAutoCommit(false);
		 ps=con.prepareStatement(query);
		 ps.setLong(1, c.getAccno());
		 res=ps.executeUpdate();
		 
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 if(res>0)
		 {
		 try {
		 con.commit();
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return true;
		 }
		 else
		 {
		 try {
		 con.rollback();
		 } catch (SQLException e) {
		 // TODO Auto-generated catch block
		 e.printStackTrace();
		 }
		 return false;
		 }
		}
	}
	

	


 

