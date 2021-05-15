package khoa.code.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import khoa.code.model.Admin;
import khoa.code.model.MyConnect;
import khoa.code.model.Order;

public class AdminDAO {
	static Connection connect;
	static{
		try {
			connect=MyConnect.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void saveAdmin() {
		
	}
	//luu them cai id admin la ok
	//tu do truy xuat nhanh chong
	
	
	public static Admin get1Admin() {
		String sql="select * from Admin ";
		return null;
	}
	
	public static Admin findAdmin(String name,String pass) {
		String sql="select * from Admin where ad_name=? and ad_pass=?";
		PreparedStatement pst;
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, pass);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				
				return new Admin(rs.getInt(1),name,pass);
				//ta khong can biet so luong order 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public static Admin getAdminId(int id) {
		String sql="select * from Admin where ad_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1,id);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				String name= rs.getString(2);
				String pass=rs.getString(3);
				return new Admin(id,name,pass);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<Admin> getAdmins(){
		return null;
	}
	public static void saveOrder() {
		//ta can thuc hien 1 co che 
	}
	public static ArrayList<Order> getOrderList(){
		return null;
	}
	
}
