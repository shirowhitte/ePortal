package com.beans;

public class Item {
	
	private Product product;
	private int quantity;
	private Customer username;
	private int oid;
	
	public Item() {
	}

	public Item(Product product, int quantity,Customer username) 
	{
		this.product = product;
		this.quantity = quantity;
		this.username = username;
	}
	
	
	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public Customer getUsername() {
		return username;
	}

	public void setUsername(Customer username) {
		this.username = username;
	}

	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

}
