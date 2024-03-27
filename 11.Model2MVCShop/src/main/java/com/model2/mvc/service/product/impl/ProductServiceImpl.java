package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

//==> 회원관리 서비스 구현
@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	

	public ProductServiceImpl() {
		System.out.println(this.getClass());
	}


	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDao.findProduct(prodNo);
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		List<Product> list = productDao.getProductList(search);
		int totalCount = productDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalcount", totalCount);
		
		return map;
	}

	@Override
	public void insertProduct(Product productVO) throws Exception {
		productDao.insertProduct(productVO);
		
	}

	@Override
	public void updateProduct(Product productVO) throws Exception {
		productDao.updateProduct(productVO);
	}
	
	@Override
	public int getTotalCount(Search search) throws Exception{
		return productDao.getTotalCount(search);
	}
	
}