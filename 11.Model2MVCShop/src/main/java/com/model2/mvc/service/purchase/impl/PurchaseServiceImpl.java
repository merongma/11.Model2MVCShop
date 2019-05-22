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
	private PurchaseDao purchaseDao;

	public void setPurchaseDao(PurchaseDao purchaseDao) {
		this.purchaseDao = purchaseDao;
	}

	/// Constructor
	public PurchaseServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		purchaseDao.addPurchase(purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDao.getPurchase(tranNo);
	}

	@Override
	public Purchase getPurchase2(int ProdNo) throws Exception {
		return purchaseDao.getPurchase2(ProdNo);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {

		int totalCount = purchaseDao.getTotalCount(search);

		Map<String, Object> map = purchaseDao.getPurchaseList(search, buyerId);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDao.updateTranCode(purchase);

	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDao.updatePurcahse(purchase);

	}

	@Override
	public Map<String, Object> getShippingList(Search search) throws Exception {

		int totalCount = purchaseDao.getTotalCount(search);

		Map<String, Object> map = purchaseDao.getShippingList(search);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

}