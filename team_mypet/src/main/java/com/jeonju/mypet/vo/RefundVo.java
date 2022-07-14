package com.jeonju.mypet.vo;

import java.util.List;

public class RefundVo {

	private int refund_idx;
	private int orders_idx;
	private int refund_status;
	private int refund_price;
	private int refund_point;
	private int refund_dv;
	private String refund_name;
	private String refund_phone;
	private String refund_addr;
	private String refund_detailaddr;
	private String refund_reason;
	private String refund_request;
	private int detail_idx;
	
	private List<Refunds_DayVo> refunds_days; 
	public List<Refunds_DayVo> getRefunds_days() {
		return refunds_days;
	}
	public void setRefunds_days(List<Refunds_DayVo> refunds_days) {
		this.refunds_days = refunds_days;
	}
	
	
	public int getRefund_idx() {
		return refund_idx;
	}
	public void setRefund_idx(int refund_idx) {
		this.refund_idx = refund_idx;
	}
	public int getOrders_idx() {
		return orders_idx;
	}
	public void setOrders_idx(int orders_idx) {
		this.orders_idx = orders_idx;
	}
	public int getRefund_status() {
		return refund_status;
	}
	public void setRefund_status(int refund_status) {
		this.refund_status = refund_status;
	}
	public int getRefund_price() {
		return refund_price;
	}
	public void setRefund_price(int refund_price) {
		this.refund_price = refund_price;
	}
	public int getRefund_point() {
		return refund_point;
	}
	public void setRefund_point(int refund_point) {
		this.refund_point = refund_point;
	}
	public int getRefund_dv() {
		return refund_dv;
	}
	public void setRefund_dv(int refund_dv) {
		this.refund_dv = refund_dv;
	}
	public String getRefund_name() {
		return refund_name;
	}
	public void setRefund_name(String refund_name) {
		this.refund_name = refund_name;
	}
	public String getRefund_phone() {
		return refund_phone;
	}
	public void setRefund_phone(String refund_phone) {
		this.refund_phone = refund_phone;
	}
	public String getRefund_addr() {
		return refund_addr;
	}
	public void setRefund_addr(String refund_addr) {
		this.refund_addr = refund_addr;
	}
	public String getRefund_detailaddr() {
		return refund_detailaddr;
	}
	public void setRefund_detailaddr(String refund_detailaddr) {
		this.refund_detailaddr = refund_detailaddr;
	}
	public String getRefund_reason() {
		return refund_reason;
	}
	public void setRefund_reason(String refund_reason) {
		this.refund_reason = refund_reason;
	}
	public String getRefund_request() {
		return refund_request;
	}
	public void setRefund_request(String refund_request) {
		this.refund_request = refund_request;
	}
	public int getDetail_idx() {
		return detail_idx;
	}
	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}
	
}
