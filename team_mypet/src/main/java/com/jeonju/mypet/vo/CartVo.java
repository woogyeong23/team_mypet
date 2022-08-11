package com.jeonju.mypet.vo;


public class CartVo {

	private int cart_idx;
	private int midx;
	private int p_idx;
	private String delyn;
	private int cart_cnt;
	private String cart_request;

	//상품
	private String p_name; // join용
	private String p_content;
	

	private int p_price;
	private String m_nick;
	private int p_discount;
	private int p_disprice;
	

	//상품이미지
	private String p_ori_filename;
	private String p_sys_filename;
	
	//추가
	private int salePrice;
	private int totalPrice;
	private int totalPoint;

	
	
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_disprice() {
		return p_disprice;
	}
	public void setP_disprice(int p_disprice) {
		this.p_disprice = p_disprice;
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

	
	
	
	
	
	

	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public int getP_discount() {
		return p_discount;
	}
	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
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
	
	public int getTotalPrice() {
		return totalPrice;
	}
	
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint() {
		this.totalPoint = (int) (this.totalPrice * this.p_discount);
	}
	
	@Override
	public String toString() {
		return "CartVo[cart_idx="+cart_idx+"midx="+midx+"p_idx"+p_idx+"cart_cnt="+cart_cnt+
				"p_name="+p_name+"p_content="+p_content+"p_price="+p_price+
				"totalPrice="+totalPrice+"]";
	}
	
	
	
	
	
}