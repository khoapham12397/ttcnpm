package khoa.code.model;

public class CartLineInfo {
	//khi do can thao tac tren database sau
	
	private Product product;
	private int count;
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public CartLineInfo() {
		
	}
	public CartLineInfo(Product p,int sl) {
		product=p;
		count=sl;
	}
}
