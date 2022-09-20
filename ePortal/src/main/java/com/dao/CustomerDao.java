package com.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.beans.Customer;
import com.beans.Product;

public class CustomerDao {
JdbcTemplate template;

public void setTemplate(JdbcTemplate template) {
    this.template = template;
}
public int register(Customer c){
    String sql="insert into Customer(username,email,password,address) values('"+c.getUsername()+"','"+c.getEmail()+"','"+c.getPassword()+"','"+c.getAddress()+"')";
    return template.update(sql);
}

public boolean checkUnique(String username, String email)
{
	String sql="select * from Customer where username=? or email=?";
	List<Customer> customer = template.query(sql, new Object[] {username,email}, new RowMapper<Customer>() {
		public Customer mapRow(ResultSet rs, int row) throws SQLException
		{
			Customer c1 = new Customer();
			c1.setUsername(rs.getString(1));
			c1.setEmail(rs.getString(2));
			return c1;
		}
	});
	return !customer.isEmpty();
}

public boolean login(String username, String password)
{
	String sql="select * from Customer where username=? and password=?";
	List<Customer> customer = template.query(sql, new Object[] {username,password}, new RowMapper<Customer>() {
		public Customer mapRow(ResultSet rs, int row) throws SQLException
		{
			Customer c1 = new Customer();
			c1.setUsername(rs.getString(1));
			c1.setPassword(rs.getString(2));
			return c1;
		}
	});
	return !customer.isEmpty();
}

public List<Product> customerPortalViewProduct(){    
    return template.query("select pimg,pname,pcategory,punitsold,pstock,price,pid from product order by RAND() limit 5;",new RowMapper<Product>(){    
        public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPimg(rs.getString(1));
        	p.setPname(rs.getString(2));
        	p.setPcategory(rs.getString(3));
        	p.setPunitSold(rs.getInt(4));
        	p.setPstock(rs.getInt(5));
        	p.setPrice(rs.getDouble(6));   
        	p.setPid(rs.getInt(7));
            return p;    
        }    
    }); 
  	}

public Customer getCustomerByUsername(String username){    
    String sql="select username,email,address from customer where username=?";    
    return template.queryForObject(sql, new Object[]{username},new BeanPropertyRowMapper<Customer>(Customer.class));    
}  

public int updateAddress(Customer c){    
    String sql="update Customer set address='"+c.getAddress()+"'where username='"+c.getUsername()+"'";    
    return template.update(sql);    
}
}