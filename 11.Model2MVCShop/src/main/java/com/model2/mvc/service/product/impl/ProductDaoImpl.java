package com.model2.mvc.service.product.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ProductDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addProduct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct", product);

	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		sqlSession.update("ProductMapper.updateProduct", product);
	}

	@Override
	public List<Product> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}

	@Override
	public int getTotalCount(Search search) {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}

	@Override
	public int getTotalCount2(Search search) {
		return sqlSession.selectOne("ProductMapper.getTotalCount2", search);
	}

	@Override
	public void updateStock(Product product) {
		sqlSession.update("ProductMapper.updateStock", product);

	}

	@Override
	public List<Product> getNewList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getNewList", search);
	}

}
