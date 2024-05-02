package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	@Qualifier("purchaseDaoImpl")
	private PurchaseDao purchaseDAO;

	public void setPurchaseDao(PurchaseDao purchaseDAO) {
		this.purchaseDAO = purchaseDAO;
	}

	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPurchase(Purchase purchaseVO) throws Exception {
		purchaseDAO.insertPurchase(purchaseVO);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {

		return purchaseDAO.findPurchase(tranNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String userId) throws Exception {

		Map<String, Object> map = new HashMap<>();

		List<Purchase> list = purchaseDAO.getPurchaseList(search, userId);
		map.put("list", list);
		return map;
	}

	@Override
	public Map<String, Object> getSaleList(Search searchVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updatePurchaseVO(Purchase purchaseVO) throws Exception {
		purchaseDAO.updatePurchase(purchaseVO);
	}

	@Override
	public void updateTranCode(Purchase purchaseVO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int getTotalCount(String userId) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDAO.getTotalCount(userId);
	}

}
