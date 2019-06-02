package com.model2.mvc.service.domain;

import java.sql.Date;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;

public class Review {

	private User reUser;
	private Product reProduct;
	private Purchase rePurchase;
	private Date reviewDate;
	private int reviewNo;
	private String reviewFile;
	private String reviewDetail;
	private String reviewTitle;
	private String reviewer;
	
	public Review () {
		
	}

	public User getReUser() {
		return reUser;
	}

	public void setReUser(User reUser) {
		this.reUser = reUser;
	}

	public Product getReProduct() {
		return reProduct;
	}

	public void setReProduct(Product reProduct) {
		this.reProduct = reProduct;
	}

	public Purchase getRePurchase() {
		return rePurchase;
	}

	public void setRePurchase(Purchase rePurchase) {
		this.rePurchase = rePurchase;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewFile() {
		return reviewFile;
	}

	public void setReviewFile(String reviewFile) {
		this.reviewFile = reviewFile;
	}

	public String getReviewDetail() {
		return reviewDetail;
	}

	public void setReviewDetail(String reviewDetail) {
		this.reviewDetail = reviewDetail;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewer() {
		return reviewer;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	@Override
	public String toString() {
		return "Review [reUser=" + reUser + ", reProduct=" + reProduct + ", rePurchase=" + rePurchase + ", reviewDate="
				+ reviewDate + ", reviewNo=" + reviewNo + ", reviewFile=" + reviewFile + ", reviewDetail="
				+ reviewDetail + ", reviewTitle=" + reviewTitle + ", reviewer=" + reviewer + "]";
	}
	
}