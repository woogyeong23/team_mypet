package com.jeonju.mypet.vo;

import java.util.Date;

public class ReviewVo {

	private int review_idx;
	private int midx;
	private int p_idx;
	private int orders_idx;
	private String review_content;
	private int review_stars;
	private String review_img;
	private Date review_wday;
	private int review_reply_cnt;
	private String delyn;
	private Date review_delday;
	private int p_disprice;
	
	
	//소현
	private String p_sys_filename;
	private int pet_idx;
	private String pet_name;
	private String pet_type;
	private String pet_breed;
	private int pet_age;
	private String m_nick;
	private String review_ori_img;
	
	private int avg_reviews_stars;
	private String review_nick;
	
	public int getAvg_reviews_stars() {
		return avg_reviews_stars;
	}
	public void setAvg_reviews_stars(int avg_reviews_stars) {
		this.avg_reviews_stars = avg_reviews_stars;
	}
	

	public String getP_sys_filename() {
		return p_sys_filename;
	}
	public void setP_sys_filename(String p_sys_filename) {
		this.p_sys_filename = p_sys_filename;
	}

	public int getPet_idx() {
		return pet_idx;
	}
	public void setPet_idx(int pet_idx) {
		this.pet_idx = pet_idx;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_breed() {
		return pet_breed;
	}
	public void setPet_breed(String pet_breed) {
		this.pet_breed = pet_breed;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}

	public String getReview_nick() {
		return review_nick;
	}
	public void setReview_nick(String review_nick) {
		this.review_nick = review_nick;
	}
	

	//소현
	
    //  test 22.7.29

	private String p_name;
	//
	
	// test 22.08.05
	private int p_category_idx;
	//
	
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
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	
	//   test 22.7.29
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	// test 22.08.05
	public int getP_category_idx() {
		return p_category_idx;
	}
	public void setP_category_idx(int p_category_idx) {
		this.p_category_idx = p_category_idx;
	}
	//
	public int getP_disprice() {
		return p_disprice;
	}
	public void setP_disprice(int p_disprice) {
		this.p_disprice = p_disprice;
	}
	//test 22.08.17
	private String m_profile;
	
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public String getReview_ori_img() {
		return review_ori_img;
	}
	public void setReview_ori_img(String review_ori_img) {
		this.review_ori_img = review_ori_img;
	}
	

}
