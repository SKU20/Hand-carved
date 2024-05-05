package com.dao;

public class ProductDetails {
      
	private int Id;
	private String name;
	private String description;
	private String price;
	private String photoName;
	public ProductDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductDetails( String name, String description, String price, String photoName) {
		super();
		this.name = name;
		this.description = description;
		this.price = price;
		this.photoName = photoName;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	@Override
	public String toString() {
		return "ProductDetails [Id=" + Id + ", name=" + name + ", description=" + description + ", price=" + price
				+ ", photoName=" + photoName + "]";
	}
	
	
}
