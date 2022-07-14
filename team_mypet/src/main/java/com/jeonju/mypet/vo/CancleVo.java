package com.jeonju.mypet.vo;

import java.util.List;

public class CancleVo {

	private int cancle_idx;
	private int orders_idx;
	private int cancle_status;
	private int cancle_price;
	private String cancle_request;
	private String cancle_reason;
	private int cancle_point;
	private int detail_idx;
	
	private List<Cancle_DayVo> cancle_days; 
	public List<Cancle_DayVo> getCancle_days() {
		return cancle_days;
	}
	public void setCancle_days(List<Cancle_DayVo> cancle_days) {
		this.cancle_days = cancle_days;
	}
	
	
	public int getCancle_idx() {
		return cancle_idx;
	}
	public void setCancle_idx(int cancle_idx) {
		this.cancle_idx = cancle_idx;
	}
	public int getOrders_idx() {
		return orders_idx;
	}
	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
	}
	public int getCancle_status() {
		return cancle_status;
	}
	public void setCancle_status(int cancle_status) {
		this.cancle_status = cancle_status;
	}
	public int getCancle_price() {
		return cancle_price;
	}
	public void setCancle_price(int cancle_price) {
		this.cancle_price = cancle_price;
	}
	public String getCancle_request() {
		return cancle_request;
	}
	public void setCancle_request(String cancle_request) {
		this.cancle_request = cancle_request;
	}
	public String getCancle_reason() {
		return cancle_reason;
	}
	public void setCancle_reason(String cancle_reason) {
		this.cancle_reason = cancle_reason;
	}
	public int getCancle_point() {
		return cancle_point;
	}
	public void setCancle_point(int cancle_point) {
		this.cancle_point = cancle_point;
	}
	public int getDetail_idx() {
		return detail_idx;
	}
	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}
	
}
