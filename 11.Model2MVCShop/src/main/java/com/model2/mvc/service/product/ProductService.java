package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductService {

	public Product getProduct(int prodNo) throws Exception;

	public Map<String, Object> getProductList(Search search) throws Exception;

	public Product insertProduct(Product productVO) throws Exception;

	public void updateProduct(Product productVO) throws Exception;

	public int getTotalCount(Search search) throws Exception;
}