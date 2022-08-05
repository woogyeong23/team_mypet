package com.jeonju.mypet.vo;


public class CartVo {

	private int cart_idx;
	private int midx;
	private int p_idx;
	private String delyn;
	private int cart_cnt;	//상품수량
	private String cart_request; //요구사항
	
	//소현
	private String p_name;
	private int p_point;
	private int p_price;
	private int p_dvprice;
	private int p_disprice;
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_point() {
		return p_point;
	}
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_dvprice() {
		return p_dvprice;
	}
	public void setP_dvprice(int p_dvprice) {
		this.p_dvprice = p_dvprice;
	}
	public int getP_disprice() {
		return p_disprice;
	}
	public void setP_disprice(int p_disprice) {
		this.p_disprice = p_disprice;
	}
	
	
	//소현끝
	
	
	
	
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
