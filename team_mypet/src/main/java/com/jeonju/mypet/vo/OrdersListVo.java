package com.jeonju.mypet.vo;

public class OrdersListVo {

	
	private int orders_idx;
	private int midx;
	private String orders_name;
	private String orders_addr1;
	private String orders_addr2;
	private String orders_addr3;
	private String orders_phone;
	private int orders_totalprice;
	
	private int detail_idx;
	private int p_idx;
	private int detail_cnt;
	private String detail_completeday;
	private String p_name;
	private String p_sys_filename;
	private String p_price;
	
	
	
	public int getDetail_idx() {
		return detail_idx;
	}
	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public int getDetail_cnt() {
		return detail_cnt;
	}
	public void setDetail_cnt(int detail_cnt) {
		this.detail_cnt = detail_cnt;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_sys_filename() {
		return p_sys_filename;
	}
	public void setP_sys_filename(String p_sys_filename) {
		this.p_sys_filename = p_sys_filename;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public int getOrders_idx() {
		return orders_idx;
	}
	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getOrders_name() {
		return orders_name;
	}
	public void setOrders_name(String orders_name) {
		this.orders_name = orders_name;
	}
	public String getOrders_addr1() {
		return orders_addr1;
	}
	public void setOrders_addr1(String orders_addr1) {
		this.orders_addr1 = orders_addr1;
	}
	public String getOrders_addr2() {
		return orders_addr2;
	}
	public void setOrders_addr2(String orders_addr2) {
		this.orders_addr2 = orders_addr2;
	}
	public String getOrders_addr3() {
		return orders_addr3;
	}
	public void setOrders_addr3(String orders_addr3) {
		this.orders_addr3 = orders_addr3;
	}
	public String getOrders_phone() {
		return orders_phone;
	}
	public void setOrders_phone(String orders_phone) {
		this.orders_phone = orders_phone;
	}
	public int getOrders_totalprice() {
		return orders_totalprice;
	}
	public void setOrders_totalprice(int orders_totalprice) {
		this.orders_totalprice = orders_totalprice;
	}
	public String getOrders_day() {
		return orders_day;
	}
	public void setOrders_day(String orders_day) {
		this.orders_day = orders_day;
	}
	private String orders_day;
	
	
	
	
	
	
}
