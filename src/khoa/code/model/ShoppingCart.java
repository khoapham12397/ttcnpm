package khoa.code.model;

import java.util.ArrayList;

public class ShoppingCart {
	public double getTotalCost() {
		calTotalCost();
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}
	//ta cho them vao la 
	 private ArrayList<CartLineInfo> cartLines=null;
	 private double totalCost;
	 public void calTotalCost() {
		 double s=0;
		 for(int i=0;i<cartLines.size();i++) {
			 CartLineInfo cartLine=cartLines.get(i);
			 Product p=cartLine.getProduct();
			 double val=(100-p.getDiscount())*p.getCost()*cartLine.getCount()/100;
			 s+=val;
		 }
		 totalCost=s;
	 }
	 
	 public ArrayList<CartLineInfo> getList(){
		 return cartLines;
	 }
	 public int getCount() {
		 if(cartLines!=null) return cartLines.size();
		 return -1;
	 }
	 public ShoppingCart() {
		 cartLines=new ArrayList<CartLineInfo>();
	 }
	 public void addCartLine(CartLineInfo line) {
		 cartLines.add(line);
	 }
	 public int findIndexProduct(int id) {
		 for(int i=0;i<cartLines.size();i++) {
			 if(cartLines.get(i).getProduct().getId()==id) {
				 return i;
			 }
		 }
		 return -1;
	 }
	 public void changeCount(int id,int count) {
		 int ind=findIndexProduct(id);
		 if(ind>=0) {
			 cartLines.get(ind).setCount(count);
		 }
	 }
	
	 //ok
}
