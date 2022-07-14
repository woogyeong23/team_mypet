package com.jeonju.mypet.vo;

import java.util.Date;

public class Review_ReplyVo {

	private int review_reply_idx;
	private int review_idx;
	private String review_reply_content;
	private Date review_reply_wday;
	private Date review_reply_deleteday;
	private String review_reply_delyn;
	private Date review_deldate;
	public int getReview_reply_idx() {
		return review_reply_idx;
	}
	public void setReview_reply_idx(int review_reply_idx) {
		this.review_reply_idx = review_reply_idx;
	}
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getReview_reply_content() {
		return review_reply_content;
	}
	public void setReview_reply_content(String review_reply_content) {
		this.review_reply_content = review_reply_content;
	}
	public Date getReview_reply_wday() {
		return review_reply_wday;
	}
	public void setReview_reply_wday(Date review_reply_wday) {
		this.review_reply_wday = review_reply_wday;
	}
	public Date getReview_reply_deleteday() {
		return review_reply_deleteday;
	}
	public void setReview_reply_deleteday(Date review_reply_deleteday) {
		this.review_reply_deleteday = review_reply_deleteday;
	}
	public String getReview_reply_delyn() {
		return review_reply_delyn;
	}
	public void setReview_reply_delyn(String review_reply_delyn) {
		this.review_reply_delyn = review_reply_delyn;
	}
	public Date getReview_deldate() {
		return review_deldate;
	}
	public void setReview_deldate(Date review_deldate) {
		this.review_deldate = review_deldate;
	}
}
