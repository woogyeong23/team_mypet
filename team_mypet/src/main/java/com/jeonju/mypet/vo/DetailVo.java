package com.jeonju.mypet.vo;

import java.util.List;

public class DetailVo {

	private int detail_idx;
	private int orders_idx;
	private int p_idx;
	private int detail_cnt;
	private String detail_request;
	private String detail_completeday;
	private int fixprice;
	private String p_name;
	private String fixdvprice;
	private List<OrdersVo> orders;
	private int detail_status;
	
	public String getFixdvprice() {
		return fixdvprice;
	}
	public void setFixdvprice(String fixdvprice) {
		this.fixdvprice = fixdvprice;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	private List<Detail_DayVo> detail_days; 
	public List<Detail_DayVo> getDetail_days() {
		return detail_days;
	}
	public void setDetail_days(List<Detail_DayVo> detail_days) {
		this.detail_days = detail_days;
	}
	private List<RefundVo> refunds; 
	public List<RefundVo> getRefunds() {
		return refunds;
	}
	public void setRefunds(List<RefundVo> refunds) {
		this.refunds = refunds;
	}
	private List<CancleVo> cancles; 
	public List<CancleVo> getCancles() {
		return cancles;
	}
	public void setCancles(List<CancleVo> cancles) {
		this.cancles = cancles;
	}
	
	public int getDetail_idx() {
		return detail_idx;
	}
	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}
	public int getOrders_idx() {
		return orders_idx;
	}
	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
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
	public String getDetail_request() {
		return detail_request;
	}
	public void setDetail_request(String detail_request) {
		this.detail_request = detail_request;
	}
	public String getDetail_completeday() {
		return detail_completeday;
	}
	public void setDetail_completeday(String detail_completeday) {
		this.detail_completeday = detail_completeday;
	}
	public int getFixprice() {
		return fixprice;
	}
	public void setFixprice(int fixprice) {
		this.fixprice = fixprice;
	}
	
	public List<OrdersVo> getOrders() {
		return orders;
	}

	public void setOrders(List<OrdersVo> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	public int getDetail_status() {
		return detail_status;
	}
	public void setDetail_status(int detail_status) {
		this.detail_status = detail_status;
	}
	
	
	
	
	
	
}
