package com.jeonju.mypet.vo;

import java.sql.Date;

public class Commu_CommentVo {
	private int cc_idx;
	private String cc_content;
	private String cc_writer;
	private Date cc_wday;
	private String cc_delyn;
	private int cc_like;
	private int cm_idx;
	private int cc_origin;
	private int cc_depth;
	private int cc_level;
	
	public int getCc_idx() {
		return cc_idx;
	}
	public void setCc_idx(int cc_idx) {
		this.cc_idx = cc_idx;
	}
	public String getCc_content() {
		return cc_content;
	}
	public void setCc_content(String cc_content) {
		this.cc_content = cc_content;
	}
	public String getCc_writer() {
		return cc_writer;
	}
	public void setCc_writer(String cc_writer) {
		this.cc_writer = cc_writer;
	}
	public Date getCc_wday() {
		return cc_wday;
	}
	public void setCc_wday(Date cc_wday) {
		this.cc_wday = cc_wday;
	}
	public String getCc_delyn() {
		return cc_delyn;
	}
	public void setCc_delyn(String cc_delyn) {
		this.cc_delyn = cc_delyn;
	}
	public int getCc_like() {
		return cc_like;
	}
	public void setCc_like(int cc_like) {
		this.cc_like = cc_like;
	}
	public int getCm_idx() {
		return cm_idx;
	}
	public void setCm_idx(int cm_idx) {
		this.cm_idx = cm_idx;
	}
	public int getCc_origin() {
		return cc_origin;
	}
	public void setCc_origin(int cc_origin) {
		this.cc_origin = cc_origin;
	}
	public int getCc_depth() {
		return cc_depth;
	}
	public void setCc_depth(int cc_depth) {
		this.cc_depth = cc_depth;
	}
	public int getCc_level() {
		return cc_level;
	}
	public void setCc_level(int cc_level) {
		this.cc_level = cc_level;
	}
	
	

	
	
}
