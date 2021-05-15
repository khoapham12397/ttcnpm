package khoa.code.model;

public class CustomerInfo {
	private int customerId;
	private String customerName;
	private String customerPhone;
	private String customerAddress;
	private String customerEmail;
	private String password;
	
	
	public CustomerInfo() {
		
	}
	public String getPassword() {
		return password;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCustomerName() {
		return customerName;
	}
	public CustomerInfo(int id,String name,String pass,String phone,String address,String email) {
		this.customerId=id;
		this.customerName=name;
		this.customerAddress=address;
		this.customerPhone=phone;
		this.password=pass;
		this.customerEmail=email;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getCustomerAddress() {
		return customerAddress;
	}
	public void setCustomerAddress(String customerAddress) {
		this.customerAddress = customerAddress;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	
}
