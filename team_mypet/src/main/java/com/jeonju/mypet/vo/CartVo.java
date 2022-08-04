package com.jeonju.mypet.vo;


public class CartVo {

	private int cart_idx;
	private int midx;
	private int p_idx;
	private String delyn;
	private int cart_cnt;
	private String cart_request;
	private String p_name; // join용
	private String p_content;
	private int p_price;
	private String p_ori_filename;
	private String p_sys_filename;
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_ori_filename() {
		return p_ori_filename;
	}
	public void setP_ori_filename(String p_ori_filename) {
		this.p_ori_filename = p_ori_filename;
	}
	public String getP_sys_filename() {
		return p_sys_filename;
	}
	public void setP_sys_filename(String p_sys_filename) {
		this.p_sys_filename = p_sys_filename;
	}
	
	
	
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}
	public String getCart_request() {
		return cart_request;
	}
	public void setCart_request(String cart_request) {
		this.cart_request = cart_request;
	}
	
	
	
	
	
	
}
