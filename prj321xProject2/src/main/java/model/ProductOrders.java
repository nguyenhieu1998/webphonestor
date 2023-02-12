package model;

public class ProductOrders {
	private int orderId;
	private int productId;
	private int amountProduct;
	private String nameProduct;
	private float priceProduct;
	
	public ProductOrders(int orderId, int productId, int amountProduct, float priceProduct) {
		this.orderId = orderId;
		this.productId = productId;
		this.amountProduct = amountProduct;
		this.priceProduct = priceProduct;
	}
	
	public ProductOrders() {
		
	}
	
	
	public float getPriceProduct() {
		return priceProduct;
	}

	public void setPriceProduct(int priceProduct) {
		this.priceProduct = priceProduct;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getAmountProduct() {
		return amountProduct;
	}

	public void setAmountProduct(int amountProduct) {
		this.amountProduct = amountProduct;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	
	
	
}
