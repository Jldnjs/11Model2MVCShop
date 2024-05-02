package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {

	// insert
	public void insertProduct(Product product) throws Exception;

	// update
	public void updateProduct(Product product) throws Exception;

	// select list
	public List<Product> getProductList(Search search) throws Exception;

	// select one
	public Product findProduct(int prodNo) throws Exception;

	// rowcount
	public int getTotalCount(Search search) throws Exception;

}
