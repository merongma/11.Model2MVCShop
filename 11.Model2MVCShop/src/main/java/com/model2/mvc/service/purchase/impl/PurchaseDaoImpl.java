package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.purchase.PurchaseDao;

@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase",purchase);
	
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase",tranNo);
	}

	@Override
	public Purchase getPurchase2(int ProdNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getPurchase2",ProdNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Purchase purchase = new Purchase();
		
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		map.put("buyerId",buyerId);
		
		List<Purchase> list = sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
		map.put("list", list);
		
		return map;
	}	

	@Override
	public Map<String, Object> getShippingList(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Purchase purchase = new Purchase();
		
		map.put("endRowNum",  search.getEndRowNum()+"" );
		map.put("startRowNum",  search.getStartRowNum()+"" );
		
		List<Purchase> list = sqlSession.selectList("PurchaseMapper.getShippingList", map);
		map.put("list", list);
		
		return map;
	}

	@Override
	public void updatePurcahse(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase",purchase);
		
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode",purchase);
		
	}

	@Override
	public int getTotalCount(Search search) {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", search);
	}


}

