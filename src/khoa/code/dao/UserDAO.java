package khoa.code.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import khoa.code.model.MyConnect;
import khoa.code.model.CustomerInfo;

public class UserDAO {
	Connection connect=null;
	public UserDAO() {
		try {
			connect=MyConnect.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//su dung sdt 
	}
	public ArrayList<CustomerInfo> getCustomers(){
		ArrayList<CustomerInfo> customers=new ArrayList<CustomerInfo>();
		
		try {
			Statement st= connect.createStatement();
			String sql="select (cus_id,cus_name,cus_pass,cus_add,cus_phone,cus_email) from Customer";
			ResultSet rs= st.executeQuery(sql);
			while(rs.next()) {
				int id=rs.getInt(1);
				String name=rs.getString(2);
				String pass=rs.getString(3);
				String add=rs.getString(4);
				String phone=rs.getString(5);
				String email=rs.getString(6);
				CustomerInfo cus=new CustomerInfo(id,name,pass,add,phone,email);
				customers.add(cus);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customers;
	}
	public CustomerInfo findCustomer(String phone,String pass) {
		CustomerInfo cus=null;
		String sql="select (cus_id,cus_name,cus_pass,cus_add,cus_phone,cus_email) from Customer";

		try {
			PreparedStatement pst=connect.prepareStatement(sql+" where cus_phone=?, cus_pass=? ");
			pst.setString(1, phone);
			pst.setString(2, pass);
		 	ResultSet rs= pst.executeQuery();
		 	if(rs.next()) {
		 		int id=rs.getInt(1);
				String name=rs.getString(2);
				String pass1=rs.getString(3);
				String add=rs.getString(4);
				String phone1=rs.getString(5);
				String email=rs.getString(6);
				cus=new CustomerInfo(id,name,pass,add,phone,email);
		 	}else cus=null;
		 	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cus;
	}
}
