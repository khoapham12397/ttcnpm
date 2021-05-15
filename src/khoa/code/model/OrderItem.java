package khoa.code.model;

public class OrderItem {
	private int id;
	private Product product;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private Order order;//this is foreign key;
	int count;
	public OrderItem(){
		
	}
	
	public OrderItem(Product p,int count) {
		this.product=p;
		this.count=count;
	}
	
}
