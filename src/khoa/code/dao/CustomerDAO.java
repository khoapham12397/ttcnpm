package khoa.code.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import khoa.code.model.MyConnect;
import khoa.code.model.CustomerInfo;;

public class CustomerDAO {
	private static Connection connect=null;
	//luu cache lai trong app
	//thuc chat cai nay neu ta luu tru lai 1 instance thi no se ton tai trong suot qua trinh
	//
	static{
		try {
			connect=MyConnect.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
	}
	public static CustomerInfo getCustomer(int id) {
		String sql="select * from Customer where cus_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				String name=rs.getString(2);
				String pass=rs.getString(3);
				String phone=rs.getString(4);
				String add=rs.getString(5);
				String email=rs.getString(6);
				return new CustomerInfo(id,name,pass,phone,add,email);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public CustomerDAO() {
		try {
			connect=MyConnect.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		};
	}
	
	//ta chi can luu co hoac khong la duoc 
	public  static boolean hasCus(String phone, String pass) {
		String sql="select * from Customer where phone=? and pass=?";
		try {
			PreparedStatement stmt= connect.prepareStatement(sql);
			stmt.setString(1, phone);
			stmt.setString(2, pass);
			ResultSet rs= stmt.executeQuery();
			if(rs.next()) return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public static CustomerInfo findCus(String phone, String pass) {
		//ta kiem tra trung so dien thoai thi khong duoc || khi do cho nhap lai pass moi
	
		String sql="select * from Customer where cus_phone=? and cus_pass=?";
		try {
			PreparedStatement stmt= connect.prepareStatement(sql);
			stmt.setString(1, phone);
			stmt.setString(2, pass);
			ResultSet rs= stmt.executeQuery();
			if(rs.next()) {
				int id=rs.getInt(1);
				String name=rs.getString(2);
				String add=rs.getString(5);
				String email=rs.getString(6);
				CustomerInfo cus=new CustomerInfo(id,name,pass,phone,add,email);
				return cus;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public static ArrayList<CustomerInfo> getCustomers(){
		ArrayList<CustomerInfo> customers=new ArrayList<>();
		if(connect!=null) {
			String sql="select * from Customer";
			try {
				Statement stmt=connect.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()) {
					int id=rs.getInt(1);
					String name=rs.getString(2);
					String pass=rs.getString(3);
					String phone=rs.getString(4);
					String add=rs.getString(5);
					String email=rs.getString(6);
					CustomerInfo cus=new CustomerInfo(id,name,pass,phone,add,email);
					customers.add(cus);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return customers;
	}
	public static int updateCus(int id,CustomerInfo cus) {
		String name=cus.getCustomerName();
		String pass=cus.getPassword();
		String phone=cus.getCustomerPhone();
		String add=cus.getCustomerAddress();
		String email=cus.getCustomerEmail();
		String sql="update Customer set cus_name=?,cus_pass=?,cus_phone=?,cus_add=?,cus_email=? where cus_id=?";
		PreparedStatement preStmt;
		try {
			preStmt = connect.prepareStatement(sql);
			preStmt.setString(1,name);
			preStmt.setString(2, pass);
			preStmt.setString(3, phone);
			preStmt.setString(4, add);
			preStmt.setString(5, email);
			preStmt.setInt(6, id);
			return preStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public static boolean saveCus(CustomerInfo customerInfo) {
		if(connect!=null) {
			//ta khong set id cho no la ok
			//dung nhu vay
			
			try {
				String name=customerInfo.getCustomerName();
				String pass=customerInfo.getPassword();
				String phone=customerInfo.getCustomerPhone();
				String add=customerInfo.getCustomerAddress();
				String email=customerInfo.getCustomerEmail();
				String sql="insert into Customer values(?,?,?,?,?)";
				PreparedStatement preStmt=connect.prepareStatement(sql);
				preStmt.setString(1,name);
				preStmt.setString(2, pass);
				preStmt.setString(3, phone);
				preStmt.setString(4, add);
				preStmt.setString(5, email);
				if(preStmt.execute()) return true;
				else return false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}
}
