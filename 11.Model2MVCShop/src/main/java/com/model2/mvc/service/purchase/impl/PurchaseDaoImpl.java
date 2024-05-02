package com.model2.mvc.service.purchase.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertPurchase(Purchase purchaseVO) throws SQLException {
		sqlSession.insert("PurchaseMapper.insertPurchase", purchaseVO);

	}

	@Override
	public void updatePurchase(Purchase purchaseVO) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchaseVO);

	}

	@Override
	public void updateTranCode(Purchase purchaseVO) {
		//

	}

	@Override
	public Map<String, Object> getSaleList(Search searchVO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Purchase> getPurchaseList(Search search, String userId) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("search", search);
		map.put("userId", userId);

		// return sqlSession.selectMap("PurchaseMapper.getPurchaseList", search,
		// userId);
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}

	@Override
	public Purchase findPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.findPurchase", tranNo);
	}

	@Override
	public int getTotalCount(String userId) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", userId);
	}

}
