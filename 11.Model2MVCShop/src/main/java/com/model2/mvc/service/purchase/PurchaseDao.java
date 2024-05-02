package com.model2.mvc.service.purchase;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	public void insertPurchase(Purchase purchaseVO) throws SQLException;

	public void updatePurchase(Purchase purchaseVO) throws Exception;

	public void updateTranCode(Purchase purchaseVO);

	public Map<String, Object> getSaleList(Search searchVO) throws Exception;

	public List<Purchase> getPurchaseList(Search search, String userId) throws Exception;

	public Purchase findPurchase(int tranNo) throws Exception;

	public int getTotalCount(String userId) throws Exception;
}
