package com.model2.mvc.service.review.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDao;

@Repository("reviewDaoImpl")
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public ReviewDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addReview(Review review) throws Exception {
		sqlSession.insert("ReviewMapper.addReview", review);

	}

	@Override
	public Review getReview(int reviewNo) throws Exception {
		return sqlSession.selectOne("ReviewMapper.getReview", reviewNo);
	}

	@Override
	public Map<String, Object> getReviewList(Search search, String prodNo) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		Review review = new Review();

		map.put("endRowNum", search.getEndRowNum() + "");
		map.put("startRowNum", search.getStartRowNum() + "");
		map.put("prodNo", prodNo);

		List<Purchase> list = sqlSession.selectList("ReviewMapper.getReviewList", map);
		map.put("list", list);

		return map;
	}

	@Override
	public void updateReview(Review review) throws Exception {
		sqlSession.update("ReviewMapper.updateReview", review);

	}

	@Override
	public int getTotalCount(Search search) {
		return sqlSession.selectOne("ReviewMapper.getTotalCount", search);
	}

}
