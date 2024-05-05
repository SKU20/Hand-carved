package com.dao;

import java.util.List;

public interface ProductsImp {
     
	public abstract boolean addProduct(ProductDetails details);
	public List <ProductDetails> getAllProducts();
	public ProductDetails getProductById(int id);
	public boolean updateProduct(ProductDetails b);
	public boolean deleteProduct(int id);
	
}
