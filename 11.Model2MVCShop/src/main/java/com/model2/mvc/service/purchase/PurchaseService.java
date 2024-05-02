package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseService {

	public void addPurchase(Purchase purchaseVO) throws Exception;

	public Purchase getPurchase(int tranNo) throws Exception;

	public Map<String, Object> getPurchaseList(Search searchVO, String userId) throws Exception;

	public Map<String, Object> getSaleList(Search search) throws Exception;

	public void updatePurchaseVO(Purchase purchaseVO) throws Exception;

	public void updateTranCode(Purchase purchaseVO) throws Exception;

	public int getTotalCount(String userId) throws Exception;

}