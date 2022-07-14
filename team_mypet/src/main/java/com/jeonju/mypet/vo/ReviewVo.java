package com.jeonju.mypet.vo;

import java.util.Date;

public class ReviewVo {

	private int review_idx;
	private int midx;
	private int product_idx;
	private int orders_idx;
	private String review_content;
	private int review_stars;
	private String review_img;
	private Date review_wday;
	private int review_reply_cnt;
	private String delyn;
	private Date review_delday;
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}
	public int getOrders_idx() {
		return orders_idx;
	}
	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_stars() {
		return review_stars;
	}
	public void setReview_stars(int review_stars) {
		this.review_stars = review_stars;
	}
	public String getReview_img() {
		return review_img;
	}
	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}
	public Date getReview_wday() {
		return review_wday;
	}
	public void setReview_wday(Date review_wday) {
		this.review_wday = review_wday;
	}
	public int getReview_reply_cnt() {
		return review_reply_cnt;
	}
	public void setReview_reply_cnt(int review_reply_cnt) {
		this.review_reply_cnt = review_reply_cnt;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public Date getReview_delday() {
		return review_delday;
	}
	public void setReview_delday(Date review_delday) {
		this.review_delday = review_delday;
	}
	
	
}
