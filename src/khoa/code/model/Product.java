package khoa.code.model;

import java.sql.Date;

public class Product {
	private int id;
	private String name;
	private Date createDate;
	private String pathImg;
	private double cost;
	private String description;
	private int brand;
	private int count;
	private int discount;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getBrand() {
		return brand;
	}
	public void setBrand(int brand) {
		this.brand = brand;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	

	public String getPathImg() {
		return pathImg;
	}
	public void setPathImg(String pathImg) {
		this.pathImg = pathImg;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	//co san pham duoc ton tai va nhieu yeu to khac:  
	//can validate cac yeu to di vao thi moi co the set up cho no duoc 
	
	public Product() {
		
	}
	public Product(int id, String name, double cost,int brand,int count ,int discount ,String pathImg,Date nsx) {
		this.id = id;
		this.name = name;
		this.brand=brand;
		this.count=count;
		this.discount=discount;
		this.pathImg=pathImg;
		this.cost = cost;
		this.createDate=nsx;
	}
}
