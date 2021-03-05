package llhh2007.edu.Dto;

public class BillDetails {
	private int id;
	private int bill;
	private String product;
	private int quantity;
	private double totalPrice;
	public BillDetails() {
	}
	public BillDetails(int bill, String product, int quantity, double totalPrice) {
		this.bill = bill;
		this.product = product;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBill() {
		return bill;
	}
	public void setBill(int bill) {
		this.bill = bill;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
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
	
	
}
