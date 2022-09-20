package com.beans;

import javax.validation.constraints.Pattern;  
import javax.validation.constraints.NotNull;

public class Customer 
{
	
	private int id;
	@NotNull(message="Username must be filled.") @Pattern(regexp="^([a-zA-Z0-9]{5,50})?$",message="Username must be more than 5.")
	private String username;
	@NotNull(message="Email must be filled.")
	private String email;
	@Pattern(regexp="^([a-zA-Z0-9]{8,30})?$",message="Password must be more than 8." )
	private String password;
	@NotNull(message="Password not match.")
	private String confirmPassword;
	@NotNull(message="Address must be filled.")
	private String address;
	
	public Customer()
	{
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
		checkNull();
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
		checkNull();
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
		checkPassword();
	}

	public void setConfirmPassword(String confirmPassword) {
	    this.confirmPassword = confirmPassword;
	    checkPassword();
	}

	public String getConfirmPassword()
	{
		return confirmPassword;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
		checkNull();
	}
	
	private void checkPassword() {
	    if(this.password == null || this.confirmPassword == null){
	        return;
	    }else if(!this.password.equals(confirmPassword)){
	        this.confirmPassword = null;
	    }
	}
	
	private void checkNull() {
	    if(this.username == null || this.username.isEmpty())
	    {
	    	this.username = null;
	    }
	    if(this.email == null || this.email.isEmpty())
	    {
	    	this.email = null;
	    }
	    if(this.address == null || this.address.isEmpty())
	    {
	    	this.address = null;
	    }
	}
	
	
}
