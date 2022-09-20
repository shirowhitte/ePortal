package com.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.beans.Customer;
import com.beans.Product;
import com.beans.Item;
import com.beans.Order;

public class ProductDao {
JdbcTemplate template;

public void setTemplate(JdbcTemplate template) {
    this.template = template;
}
public int addProduct(Product p){
    String sql="insert into Product(pname,pdescription,pcategory,price,pstock,pimg,punitsold) values('"+p.getPname()+"','"+p.getPdescription()+"','"+p.getPcategory()+"',"+p.getPrice()+","+p.getPstock()+",'"+p.getPimg()+"',0)";
    return template.update(sql);
}

public int updateProduct(Product p){    
    String sql="update Product set price="+p.getPrice()+", pstock="+p.getPstock()+" where pid="+p.getPid()+"";    
    return template.update(sql);    
}    

public int updateProductStockAndPunitsold(Product p){    
    String sql="update Product set punitsold="+p.getPunitSold()+", pstock="+p.getPstock()+" where pid="+p.getPid()+"";    
    return template.update(sql);    
}    


public int deleteProduct(int id){    
    String sql="delete from Product where pid="+id+"";    
    return template.update(sql);    
} 

public List<Product> vendorViewProduct(){    
    return template.query("select pimg,pname,pcategory,punitsold,pstock,price,pid from product order by pid;",new RowMapper<Product>(){    
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

public List<Product> vendorGetProductByCategory(int pid){    
    String sql="select pname,pcategory,pdescription,price,pstock,pimg ,pid from product where pid=?";    
    return template.query(sql, new Object[] {pid}, new RowMapper<Product>()   
    {
    	public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPname(rs.getString(1));
        	p.setPcategory(rs.getString(2));
        	p.setPdescription(rs.getString(3));
        	p.setPrice(rs.getDouble(4));
        	p.setPstock(rs.getInt(5));
        	p.setPimg(rs.getString(6));
        	p.setPid(rs.getInt(7));
            return p;
    		}
    });
} 

public Product getProductById(int id){    
    String sql="select pname,pcategory,pdescription,price,pstock,pimg,pid,punitsold from product where pid=?";    
    return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Product>(Product.class));    
}  

public Customer getAddressByUsername(String username){    
    String sql="select address from customer where username=?";    
    return template.queryForObject(sql, new Object[]{username},new BeanPropertyRowMapper<Customer>(Customer.class));    
}  


public List<Product> getProductByCategory(String category){    
    String sql="select pimg,pname,price,pdescription,pid from product where pcategory=? order by pid";    
    return template.query(sql, new Object[] {category}, new RowMapper<Product>()   
    {
    	public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPimg(rs.getString(1));
        	p.setPname(rs.getString(2));
        	p.setPrice(rs.getDouble(3));
        	p.setPdescription(rs.getString(4));
        	p.setPid(rs.getInt(5));
            return p;
    		}
    });
} 

public List<Product> sortProductByLatest(String category){    
    String sql="select pimg,pname,price,pdescription,pid from product where pcategory=? order by pid desc";    
    return template.query(sql, new Object[] {category}, new RowMapper<Product>()   
    {
    	public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPimg(rs.getString(1));
        	p.setPname(rs.getString(2));
        	p.setPrice(rs.getDouble(3));
        	p.setPdescription(rs.getString(4));
        	p.setPid(rs.getInt(5));
            return p;
    		}
    });
} 

public List<Product> sortProductByTopSales(String category){    
    String sql="select pimg,pname,price,pdescription,pid from product where pcategory=? order by punitsold desc;";    
    return template.query(sql, new Object[] {category}, new RowMapper<Product>()   
    {
    	public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPimg(rs.getString(1));
        	p.setPname(rs.getString(2));
        	p.setPrice(rs.getDouble(3));
        	p.setPdescription(rs.getString(4));
        	p.setPid(rs.getInt(5));
            return p;
    		}
    });
} 

public List<Product> sortProductByHighestPrice(String category){    
    String sql="select pimg,pname,price,pdescription,pid from product where pcategory=? order by price desc";    
    return template.query(sql, new Object[] {category}, new RowMapper<Product>()   
    {
    	public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPimg(rs.getString(1));
        	p.setPname(rs.getString(2));
        	p.setPrice(rs.getDouble(3));
        	p.setPdescription(rs.getString(4));
        	p.setPid(rs.getInt(5));
            return p;
    		}
    });
} 

public List<Product> sortProductByLowestPrice(String category){    
    String sql="select pimg,pname,price,pdescription,pid from product where pcategory=? order by price asc";    
    return template.query(sql, new Object[] {category}, new RowMapper<Product>()   
    {
    	public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPimg(rs.getString(1));
        	p.setPname(rs.getString(2));
        	p.setPrice(rs.getDouble(3));
        	p.setPdescription(rs.getString(4));
        	p.setPid(rs.getInt(5));
            return p;
    		}
    });
} 

public List<Product> searchProductList(String search){   
    String sql="select pimg,pname,price,pdescription,pid from product where pname like ? or pcategory like ? or pdescription like ?";    
    
    return template.query(sql, new Object[] {"%"+search+"%","%"+search+"%","%"+search+"%"}, new RowMapper<Product>()   
    {
    	public Product mapRow(ResultSet rs, int row) throws SQLException {    
        	Product p=new Product();    
        	p.setPimg(rs.getString(1));
        	p.setPname(rs.getString(2));
        	p.setPrice(rs.getDouble(3));
        	p.setPdescription(rs.getString(4));
        	p.setPid(rs.getInt(5));
            return p;
    		}
    });
} 

public Item getItemById(int id,String username){    
    String sql="select quantity from temp_cart where pid=? and username=?";    
    return template.queryForObject(sql, new Object[]{id,username},new BeanPropertyRowMapper<Item>(Item.class));    
}  

public int addProductIntoTempCart(Item i){
    String sql="insert into temp_cart(pname,pcategory,pdescription,price,pstock,pimg,pid,punitsold,quantity,username)"
    		+ " values('"+i.getProduct().getPname()+"','"+i.getProduct().getPcategory()+"','"+i.getProduct().getPdescription()+"',"+i.getProduct().getPrice()+","+i.getProduct().getPstock()+",'"+i.getProduct().getPimg()+"' ,"+i.getProduct().getPid()+" ,"+i.getProduct().getPunitSold()+","+i.getQuantity()+",'"+i.getUsername().getUsername()+"')";
    return template.update(sql);
}

public int updateProductFromTempCart(Item i){    
    String sql="update temp_cart set quantity="+i.getQuantity()+", punitsold="+i.getProduct().getPunitSold()+" where pid="+i.getProduct().getPid()+" and username='"+i.getUsername().getUsername()+"'";    
    return template.update(sql);    
}    

public int removeProductFromTempCart(int id, String username){    
    String sql="delete from temp_cart where pid="+id+" and username='"+username+"'";    
    return template.update(sql);    
} 

public List<Item> customerViewTempCart(String username){    
  String sql = "select pname,pcategory,pdescription,price,pstock,pimg,pid,punitsold,quantity from temp_cart where username=?";   
    	return template.query(sql, new Object[] {username}, new RowMapper<Item>()   
        {
        	public Item mapRow(ResultSet rs, int row) throws SQLException {  
        		Product p = new Product();
        		p.setPname(rs.getString(1));
        		p.setPcategory(rs.getString(2));
        		p.setPdescription(rs.getString(3));
        		p.setPrice(rs.getDouble(4));
        		p.setPstock(rs.getInt(5));
        		p.setPimg(rs.getString(6));
        		p.setPid(rs.getInt(7));
        		p.setPunitSold(rs.getInt(8));
	        	Item i = new Item();  
	        	i.setProduct(p);
	        	i.setQuantity(rs.getInt(9));
	            return i;    
        }    
    }); 
  	}

public int addOrder(Order o){
    String sql="insert into Orders(odate,cusername,caddress,item,ostatus,totalPrice) "
    		+ "values('"+o.getOdate()+"','"+o.getCusername()+"','"+o.getCaddress()+"','"+o.getItem()+"','"+o.getOstatus()+"',"+o.getTotalPrice()+")";
    return template.update(sql);
}

public int removeProductFromCart(String username){    
    String sql="delete from temp_cart where username='"+username+"'";    
    return template.update(sql);    
} 

public int addProductIntoItemTable(Item i,String username, String odate){
    String sql="insert into Item(oid,pname,pcategory,pdescription,price,pstock,pimg,pid,punitsold,quantity)"
    		+ " values((SELECT oid FROM orders WHERE cusername=? and odate=?),'"+i.getProduct().getPname()+"','"+i.getProduct().getPcategory()+"','"+i.getProduct().getPdescription()+"',"+i.getProduct().getPrice()+","+i.getProduct().getPstock()+",'"+i.getProduct().getPimg()+"' ,"+i.getProduct().getPid()+" ,"+i.getProduct().getPunitSold()+","+i.getQuantity()+")";
    return template.update(sql,username, odate);
}

}