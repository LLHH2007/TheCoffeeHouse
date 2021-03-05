package llhh2007.edu.Entity;

import java.util.Date;

public class Product {
	private String id;
	private String name;
	private String category;
	private int price;
	private String description;
	private String title;
	private String details;
	private String img;
	private Date date;
	
	public Product() {
	}

	public Product(String id, String name, String category, int price, String description, String title,
			String details, String img, Date date) {
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.description = description;
		this.title = title;
		this.details = details;
		this.img = img;
		this.date=date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
