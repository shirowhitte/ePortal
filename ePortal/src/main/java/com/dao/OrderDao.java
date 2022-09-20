package com.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.beans.Item;
import com.beans.Order;
import com.beans.Product;

public class OrderDao {
JdbcTemplate template;

public void setTemplate(JdbcTemplate template) {
    this.template = template;
}

public List<Order> customerViewOrderHistory(String username){    
	String sql = "select oid,odate,cusername,caddress, ostatus,totalPrice from orders where cusername=? order by oid desc limit 10;";
	 return template.query(sql, new Object[] {username}, new RowMapper<Order>() {    
        public Order mapRow(ResultSet rs, int row) throws SQLException {    
        	Order o=new Order();
        	o.setOid(rs.getInt(1));
        	o.setOdate(rs.getString(2));
        	o.setCusername(rs.getString(3));
        	o.setCaddress(rs.getString(4));
        	o.setOstatus(rs.getString(5));
        	o.setTotalPrice(rs.getDouble(6));
            return o;    
        }    
    }); 
  	}

public List<Order> customerViewOrderHistoryDetails(int oid){    
    String sql="select Orders.oid, Orders.odate, Orders.cusername, Orders.caddress, Orders.ostatus, Orders.totalPrice, item.pname, item.price, item.pstock, item.pimg, item.punitsold, item.quantity from Orders inner join item on Orders.oid = item.oid where Orders.oid=?";    
    return template.query(sql, new Object[] {oid}, new RowMapper<Order>()   
    {
    	public Order mapRow(ResultSet rs, int row) throws SQLException {    
    		Order o=new Order();
        	o.setOid(rs.getInt(1));
        	o.setOdate(rs.getString(2));
        	o.setCusername(rs.getString(3));
        	o.setCaddress(rs.getString(4));
        	o.setOstatus(rs.getString(5));
        	o.setTotalPrice(rs.getDouble(6));
        	Product p = new Product();
        	p.setPname(rs.getString(7));
        	p.setPrice(rs.getDouble(8));
        	p.setPstock(rs.getInt(9));
        	p.setPimg(rs.getString(10));
        	p.setPunitSold(rs.getInt(11));
        	Item i = new Item();
        	i.setProduct(p);
        	i.setQuantity(rs.getInt(12));
        	o.setSingleItem(i);
            return o;    
    		}
    });
}

public Order getOrderById(int oid,String username){    
    String sql="select oid,odate,cusername,caddress, ostatus,totalPrice from orders where oid=? and cusername=?";    
    return template.queryForObject(sql, new Object[]{oid,username},new BeanPropertyRowMapper<Order>(Order.class));    
}  

public List<Order> vendorViewNewOrder(){    
    return template.query("select oid,odate,cusername,caddress, ostatus,totalPrice from orders where ostatus='Received' or ostatus='Preparing' order by oid;",new RowMapper<Order>(){    
        public Order mapRow(ResultSet rs, int row) throws SQLException {    
        	Order o = new Order();
        	o.setOid(rs.getInt(1));
        	o.setOdate(rs.getString(2));
        	o.setCusername(rs.getString(3));
        	o.setCaddress(rs.getString(4));
        	o.setOstatus(rs.getString(5));
        	o.setTotalPrice(rs.getDouble(6));
        	return o;
        }    
    }); 
  	}  

public List<Order> vendorViewOldOrder(){    
    return template.query("select oid,odate,cusername,caddress, ostatus,totalPrice from orders where ostatus='Delivered' order by oid;",new RowMapper<Order>(){    
        public Order mapRow(ResultSet rs, int row) throws SQLException {    
        	Order o = new Order();
        	o.setOid(rs.getInt(1));
        	o.setOdate(rs.getString(2));
        	o.setCusername(rs.getString(3));
        	o.setCaddress(rs.getString(4));
        	o.setOstatus(rs.getString(5));
        	o.setTotalPrice(rs.getDouble(6));
        	return o;
        }    
    }); 
  	}  

public List<Order> vendorViewOrderHistoryDetails(int oid){    
    String sql="select Orders.oid, Orders.odate, Orders.cusername, Orders.caddress, Orders.ostatus, Orders.totalPrice, item.pname, item.price, item.pstock, item.pimg, item.punitsold, item.quantity from Orders inner join item on Orders.oid = item.oid where Orders.oid=?";    
    return template.query(sql, new Object[] {oid}, new RowMapper<Order>()   
    {
    	public Order mapRow(ResultSet rs, int row) throws SQLException {    
    		Order o=new Order();
        	o.setOid(rs.getInt(1));
        	o.setOdate(rs.getString(2));
        	o.setCusername(rs.getString(3));
        	o.setCaddress(rs.getString(4));
        	o.setOstatus(rs.getString(5));
        	o.setTotalPrice(rs.getDouble(6));
        	Product p = new Product();
        	p.setPname(rs.getString(7));
        	p.setPrice(rs.getDouble(8));
        	p.setPstock(rs.getInt(9));
        	p.setPimg(rs.getString(10));
        	p.setPunitSold(rs.getInt(11));
        	Item i = new Item();
        	i.setProduct(p);
        	i.setQuantity(rs.getInt(12));
        	o.setSingleItem(i);
            return o;    
    		}
    });
}

public Order getOrderById(int oid){    
    String sql="select oid,odate,cusername,caddress, ostatus,totalPrice from orders where oid=?";    
    return template.queryForObject(sql, new Object[]{oid},new BeanPropertyRowMapper<Order>(Order.class));    
}  

public int updateOrderStatus(Order o){ 
    String sql="update Orders set ostatus='"+o.getOstatus()+"' where oid="+o.getOid()+"";    
    return template.update(sql);    
}    


}
