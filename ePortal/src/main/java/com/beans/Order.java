package com.beans;

import java.util.List;

public class Order {

	private int oid;
	private String odate;
	private String cusername;
	private String caddress;
	private List <Item>item;
	private String ostatus;
	private double totalPrice;
	private Item singleItem;
	
	public Order()
	{
		
	}

	public Order(String odate, String cusername, String caddress, List<Item> item, String ostatus, double totalPrice) {
		super();
		this.odate = odate;
		this.cusername = cusername;
		this.caddress = caddress;
		this.item = item;
		this.ostatus = ostatus;
		this.totalPrice = totalPrice;
	}
	
	public Item getSingleItem() {
		return singleItem;
	}


	public void setSingleItem(Item singleItem) {
		this.singleItem = singleItem;
	}


	public String getOstatus() {
		return ostatus;
	}


	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}


	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}
	
	public String getCusername() {
		return cusername;
	}

	public void setCusername(String cusername) {
		this.cusername = cusername;
	}

	public String getCaddress() {
		return caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	
	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<Item> getItem() {
		return item;
	}

	public void setItem(List<Item> item) {
		this.item = item;
	}
	
	

	
}
