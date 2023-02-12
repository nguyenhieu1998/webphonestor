package model;

import java.util.List;

public class Product {
	private int id;
	private String name;
	private String description;
	private float price;
	private int quantity;

	private String src;
	private String brand;
	private int number;
	private float oldPrice;
	private String productInfo;

	public Product() {
		
	}
	
	public Product(int id, String name, String description, float price, String src, String brand, int number,float oldPrice, String productInfo) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.src = src;
		this.brand = brand;
		this.number = number;
		this.oldPrice = oldPrice;
		this.productInfo = productInfo;
	}
	
	
	public Product(int id, String name, String description, float price, String src, String brand,float oldPrice, String productInfo) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.src = src;
		this.brand = brand;
		this.oldPrice = oldPrice;
		this.productInfo = productInfo;
		this.number = 1;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}

	public float getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(float oldPrice) {
		this.oldPrice = oldPrice;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	public String getProductInfo() {
		return productInfo;
	}

	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	
	
}
