package com.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.beans.Vendor;

public class VendorDao 
{
	JdbcTemplate template;
	
	public void setTemplate(JdbcTemplate template) {
	    this.template = template;
	}
	
	
	public boolean login(String vusername, String vpassword)
	{
		String sql="select * from Vendor where vusername=? and vpassword=?";
		List<Vendor> vendor = template.query(sql, new Object[] {vusername,vpassword}, new RowMapper<Vendor>() {
			public Vendor mapRow(ResultSet rs, int row) throws SQLException
			{
				Vendor v1 = new Vendor();
				v1.setVusername(rs.getString(1));
				v1.setVpassword(rs.getString(2));
				return v1;
			}
		});
		return !vendor.isEmpty();
	}

}