package khoa.code.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import khoa.code.model.CartLineInfo;
import khoa.code.model.CustomerInfo;
import khoa.code.model.MyConnect;
import khoa.code.model.Order;
import khoa.code.model.OrderItem;
import khoa.code.model.Product;
import khoa.code.model.ShoppingCart;

public class OrderDAO {
	private static Connection connect=null;
	//tang nang suat he thong
	//cho 
	static {
		try {
			connect=MyConnect.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateStatus(int id,int st) {
		String sql="update NewOrder set order_status=? where order_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, st);
			pst.setInt(2, id);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//khi xoa thi can tinh toan lai gi tri don hang
	
	private static int getMaxOrderId()
	{
		Statement stmt;
		try {
			stmt = connect.createStatement();
			String sql="select max(order_id) from NewOrder";
			ResultSet rs=stmt.executeQuery(sql);
			rs.next();
			int gt= rs.getInt(1);
			return gt;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static ArrayList<Order> getResults(ResultSet rs){
		try {
			ArrayList<Order> orders=new ArrayList<Order>();
			while(rs.next()) {
				int id=rs.getInt(1);
				int cusId=rs.getInt(2);
				int oId=rs.getInt(3);
				Date time=rs.getDate(4);
				int st=rs.getInt(5);
				int adId=rs.getInt(6);
				CustomerInfo cus=CustomerDAO.getCustomer(cusId);
				Order od=new Order(id,cus,oId,time,st,adId);
				od.setOrderItems(getOrderItems(od));
				orders.add(od);
				//co luon roi vi du : khi ma getResult thi no tra ve cai list OrderItem trong do luon 
				//moi lan ta can xem lai cai don hang thi don gian ta truy xuat lai toan bo
				//orderItem lien quan
				
			}
			return orders;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<Order> getOrdersAdmin(int idAdmin){
		String sql ="select * from NewOrder where admin_id=?";
		try {
			
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, idAdmin);
			ResultSet rs= pst.executeQuery();
			return getResults(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<Order> getOrders(int type,int cusId){
		if(connect==null)
			try {
				connect=MyConnect.getConnection();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		ArrayList<Order> orders=null;
		if(type==1 || type==2 || type==3 ||type==4) {
		try {
			String sql="select * from NewOrder where cus_id=? and order_status=?";
			//luc moi code thi bi nham lan nen ta lam nhu vay ok 
			//tu do nen co the nhung dcai khac 
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, cusId);
			pst.setInt(2, type);
			ResultSet rs= pst.executeQuery();
			orders=getResults(rs);
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			
			try {
				String sql="select * from NewOrder where cus_id=?";
				PreparedStatement pst = connect.prepareStatement(sql);
				pst.setInt(1, cusId);
				ResultSet rs= pst.executeQuery();
				orders=getResults(rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return orders;
	}
	public static boolean deleteOrder(int orderId) {
		//can delete cac orderItem
		String sql1="delete from OrderItem where order_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql1);
			pst.setInt(1, orderId);
			pst.executeUpdate();
			String sql2="update NewOrder set order_status=? where order_id=?";
			
			pst=connect.prepareStatement(sql2);
			pst.setInt(1, 4);
			pst.setInt(2, orderId);
			pst.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static int setOrderTotalCost(int orderId , float val) {
		String sql="update NewOrder set order_amount=? where order_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setFloat(1, val);
			pst.setInt(2, orderId);
			return pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public static int delOrderItem(int itemId) {
		
		String sql="delete from OrderItem where item_id=?";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			pst.setInt(1, itemId);
			return pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	public static ArrayList<OrderItem> getOrderItems(Order order){
		ArrayList<OrderItem> list=new ArrayList<>();
		String sql="select * from OrderItem where order_id=?";
		PreparedStatement pst;
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1,order.getOrderId());
			ResultSet rs= pst.executeQuery();
			while(rs.next()) {
				int id= rs.getInt(1);
				int prodId=rs.getInt(2);
				int count=rs.getInt(4);
				Product p=ProductDAO.findProduct(prodId);
				OrderItem oi=new OrderItem(p,count);
				oi.setOrder(order);
				oi.setId(id);
				list.add(oi);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return list;
	}
	public static boolean saveOrder(ShoppingCart cartInfo,int customerId) {
	
		ArrayList<CartLineInfo> cartLines=cartInfo.getList();
		//doi voi 1 cartinfo thi ta khong can co ...
		//
		//sau do thi ta thuc hien
		Order order=new Order();
		
		//can save admin luon
		
		order.setCount(cartInfo.getTotalCost());
		order.setTime(new Date(System.currentTimeMillis()));
		order.setStatus(1);
	
		if(connect==null)
			try {
				connect=MyConnect.getConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		//may cai nay ta tao ra de lam gi ???
		//can co bo thu gom rac de thu lai bo nho
		
		String sql="insert into NewOrder values(?,?,?,?,?)";
		
		try {
			PreparedStatement pst= connect.prepareStatement(sql);
			//khi luu lai thi moi co id do do ta can co id truoc 
			pst.setInt(1,customerId );
			pst.setFloat(2, (float) order.getCount());
			pst.setDate(3, order.getTime());
			pst.setInt(4, order.getStatus());
			pst.setInt(5, 1);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		int orderId=getMaxOrderId();
		order.setOrderId(orderId);
		//create orderItems and save them
		for(int i=0;i<cartLines.size();i++) {
			Product p=cartLines.get(i).getProduct();
			OrderItem orderItem=new OrderItem();
			
			orderItem.setProduct(p);
		
			orderItem.setOrder(order);
			orderItem.setCount(cartLines.get(i).getCount());
			//save it to db
			if(!saveOrderItem(orderItem)) return false;
			
		}
		return true;
	}
	public static boolean saveOrderItem(OrderItem orderItem) {
		if(connect==null)
			try {
				connect=MyConnect.getConnection();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		//ta chi them vao customerID
		String sql="insert into OrderItem(prod_id,order_id,item_count) values(?,?,?)";
		try {
			PreparedStatement pst=connect.prepareStatement(sql);
			
			pst.setInt(1,orderItem.getProduct().getId());
			pst.setInt(2,orderItem.getOrder().getOrderId());
			pst.setInt(3, orderItem.getCount());
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
}

