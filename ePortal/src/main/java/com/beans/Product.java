package com.beans;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Min;
public class Product 
{

	private int pid;
	@NotNull(message="Product name must be filled")
	private String pname;
	@NotNull(message="Description must be filled")
	private String pdescription;
	private String pcategory;
	@DecimalMin(value = "1.0", message = "Price must be >= 1.0")
	private double price;
	@Min(value=1, message="Stock must be >= 1")
	private int pstock;
	@NotNull(message="Please select an image")
	private String pimg;
	private int punitSold;

	private void checkNull() {
	    if(this.pname == null || this.pname.isEmpty())
	    {
	    	this.pname = null;
	    }
	    if(this.pdescription == null || this.pdescription.isEmpty())
	    {
	    	this.pdescription = null;
	    }
	    if(this.price == 0.0)
	    {
	    	this.price = 0;
	    }
	    if(this.pstock == 0.0)
	    {
	    	this.pstock = 0;
	    }
	    if(this.pimg == null || this.pimg.isEmpty())
	    {
	    	this.pimg = null;
	    }
	}
	public Product()
	{
		
	}
	
	public Product(int pid, double price, int pstock) {
		super();
		this.pid = pid;
		this.price = price;
		this.pstock = pstock;
	}

	public Product(String pname, String pdescription, String pcategory, double price, int pstock,String pimg) {
		super();
		this.pname = pname;
		this.pdescription = pdescription;
		this.pcategory = pcategory;
		this.price = price;
		this.pstock = pstock;
		this.pimg = pimg;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
		checkNull();
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
		checkNull();
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
		checkNull();
	}

	public int getPstock() {
		return pstock;
	}

	public void setPstock(int pstock) {
		this.pstock = pstock;
		checkNull();
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
		checkNull();
	}

	public int getPunitSold() {
		return punitSold;
	}

	public void setPunitSold(int punitSold) {
		this.punitSold = punitSold;
	}
	
	
	
}
