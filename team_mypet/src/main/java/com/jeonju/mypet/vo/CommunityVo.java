package com.jeonju.mypet.vo;

import java.sql.Date;

public class CommunityVo {
	private int cm_idx;
	private int midx;
	private String cm_subject;
	private String cm_content;
	private Date cm_wday;
	private int cm_like;
	private String cm_delyn;
	private String cm_img;
	private String cm_writer;
	private String cm_origin_img;
	
	public int getCm_idx() {
		return cm_idx;
	}
	public void setCm_idx(int cm_idx) {
		this.cm_idx = cm_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getCm_subject() {
		return cm_subject;
	}
	public void setCm_subject(String cm_subject) {
		this.cm_subject = cm_subject;
	}
	public String getCm_content() {
		return cm_content;
	}
	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}
	public Date getCm_wday() {
		return cm_wday;
	}
	public void setCm_wday(Date cm_wday) {
		this.cm_wday = cm_wday;
	}
	public int getCm_like() {
		return cm_like;
	}
	public void setCm_like(int cm_like) {
		this.cm_like = cm_like;
	}
	public String getCm_delyn() {
		return cm_delyn;
	}
	public void setCm_delyn(String cm_delyn) {
		this.cm_delyn = cm_delyn;
	}
	public String getCm_img() {
		return cm_img;
	}
	public void setCm_img(String cm_img) {
		this.cm_img = cm_img;
	}
	public String getCm_writer() {
		return cm_writer;
	}
	public void setCm_writer(String cm_writer) {
		this.cm_writer = cm_writer;
	}
	public String getCm_origin_img() {
		return cm_origin_img;
	}
	public void setCm_origin_img(String cm_origin_img) {
		this.cm_origin_img = cm_origin_img;
	}
	
	
}
