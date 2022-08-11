package com.jeonju.mypet.vo;

import java.sql.Date;

public class CommunityVo {
	private int cm_idx;
	private int midx;
	private String cm_subject;
	private String cm_content;
	private Date cm_wday;
	private String cm_delyn;
	private String cm_img;
	private String cm_writer;
	// 추가
	private String cm_origin_img;
	private String m_profile;
	private int community_like_cnt;
	private int cm_comment_cnt;
	private int cm_view_cnt;
	
	
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
	public String getM_profile() {
		return m_profile;
	}
	public void setM_profile(String m_profile) {
		this.m_profile = m_profile;
	}
	public int getCommunity_like_cnt() {
		return community_like_cnt;
	}
	public void setCommunity_like_cnt(int community_like_cnt) {
		this.community_like_cnt = community_like_cnt;
	}
	public int getCm_comment_cnt() {
		return cm_comment_cnt;
	}
	public void setCm_comment_cnt(int cm_comment_cnt) {
		this.cm_comment_cnt = cm_comment_cnt;
	}
	public int getCm_view_cnt() {
		return cm_view_cnt;
	}
	public void setCm_view_cnt(int cm_view_cnt) {
		this.cm_view_cnt = cm_view_cnt;
	}
	
	
	
	

	
	
	
}
