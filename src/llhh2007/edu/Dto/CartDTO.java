package llhh2007.edu.Dto;

import llhh2007.edu.Entity.Product;

public class CartDTO {
	private int quantity;
	private double totalPrice;
	private String categoryName;
	private Product product;

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public CartDTO(int quantity, double totalPrice,String categoryName, Product product) {
		this.quantity = quantity;
		this.totalPrice = totalPrice;
		this.product = product;
		this.categoryName=categoryName;
	}

	public CartDTO() {
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}
