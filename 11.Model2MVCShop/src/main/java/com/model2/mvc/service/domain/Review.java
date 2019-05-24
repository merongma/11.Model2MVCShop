package com.model2.mvc.service.domain;

import java.sql.Date;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;

public class Review {

	private User buyer;
	private Product purchaseProd;
	private Purchase purchase;
	private Date reviewDate;
	private int reviewNo;
	private String reviewFile;
	private String reviewDetail;
	private String reviewTitle;
	
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public Product getPurchaseProd() {
		return purchaseProd;
	}
	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}
	public Purchase getPurchase() {
		return purchase;
	}
	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
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
	@Override
	public String toString() {
		return "Review [buyer=" + buyer + ", purchaseProd=" + purchaseProd + ", purchase=" + purchase + ", reviewDate="
				+ reviewDate + ", reviewNo=" + reviewNo + ", reviewFile=" + reviewFile + ", reviewDetail="
				+ reviewDetail + ", reviewTitle=" + reviewTitle + "]";
	}


}