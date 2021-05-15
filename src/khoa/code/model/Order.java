package khoa.code.model;

import java.sql.Date;
import java.util.ArrayList;

public class Order {
	private int orderId;
	private Date time;
	private double count;
	private CustomerInfo cusInfo;
	public CustomerInfo getCusInfo() {
		return cusInfo;
	}
	public void setCusInfo(CustomerInfo cusInfo) {
		this.cusInfo = cusInfo;
	}
	private int status;
	private int adminId;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
	private ArrayList<OrderItem> orderItems;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Date getTime() {
		return time;
	}
	public int getAdmin() {
		return adminId;
	}
	public void setAdmin(int adminId) {
		this.adminId = adminId;
	}
	public void setTime(Date date) {
		time=date;
	}
	public double getCount() {
		return count;
	}
	public void setCount(double count) {
		this.count = count;
	}
	public ArrayList<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(ArrayList<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public Order() {
		orderItems=null;
		count=0;
	}
	public Order(int id,CustomerInfo cusInfo,double count,Date da,int status,int adminId) {
		this.orderId=id;
		this.cusInfo=cusInfo;
		this.count=count;
		this.time=da;
		this.status=status;
		//khi lay cai id ra thi can truy xuat db de get duoc admin ra:
		this.adminId=adminId;
	
	}
	
}
