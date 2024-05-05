package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao implements ProductsImp {

	private Connection con;
	
	
	public ProductDao(Connection con) {
		super();
		this.con = con;
	}


	@Override
	public boolean addProduct(ProductDetails details) {
		try {
			String query = "insert into add_products(name,description,price,photo) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, details.getName());
			ps.setString(2, details.getDescription());
			ps.setString(3, details.getPrice());
			ps.setString(4, details.getPhotoName());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}


	@Override
	public List<ProductDetails> getAllProducts() {
		List<ProductDetails> list = new ArrayList<ProductDetails>();
		 ProductDetails b = null;
		 
		 try {
			 String query = "select *from add_products";
			 PreparedStatement ps = con.prepareStatement(query);
			 
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()) {
				 b=new ProductDetails();
				 b.setId(rs.getInt(1));
				 b.setName(rs.getString(2));
				 b.setDescription(rs.getString(3));
				 b.setPrice(rs.getString(4));
				 b.setPhotoName(rs.getString(5));
				 list.add(b);
			 }
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}


	@Override
	public ProductDetails getProductById(int id) {
		ProductDetails details = null;
		
		try {
			String query = "select * from add_products where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				details = new ProductDetails();
				details.setId(rs.getInt(1));
				 details.setName(rs.getString(2));
				 details.setDescription(rs.getString(3));
				 details.setPrice(rs.getString(4));
				 details.setPhotoName(rs.getString(5));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return details;
	}


	@Override
	public boolean updateProduct(ProductDetails b) {
		boolean f=false;
		try {
			String query="update add_products set name=?,description=?,price=? where id=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, b.getName());
			ps.setString(2, b.getDescription());
			ps.setString(3, b.getPrice());
			ps.setInt(4, b.getId());
			
			int i = ps.executeUpdate();
			
			if(i>0) {
				f=true;
			}
			
		}catch (Exception e) {
            e.printStackTrace();
		}
		return f;
	     
	}


	@Override
	public boolean deleteProduct(int id) {
		boolean result = false;
	    try {
			String query="delete from add_products where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			
			int count = ps.executeUpdate();
			
			if(count>0) {
				result = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	
	
      
}
