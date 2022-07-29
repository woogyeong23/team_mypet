package com.jeonju.mypet.vo;

import java.util.Date;
import java.util.List;

public class OrdersVo {

	private int orders_idx;
	private int midx;
	private Date orders_day;
	private int orders_totalprice;
	private int orders_status;
	private String orders_name;
	private String orders_phone;
	private String orders_addr;
	private String orders_detailaddr;
	private String orders_payment;
	private int orders_dvprice;
	private int orders_point;
	private String orders_dv_request;
	private Date orders_completeday;
	
	
	
	private List<DetailVo> details; 
	public List<DetailVo> getDetails() {
		return details;
	}
	public void setDetails(List<DetailVo> details) {
		this.details = details;
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
	public Date getOrders_day() {
		return orders_day;
	}
	public void setOrders_day(Date orders_day) {
		this.orders_day = orders_day;
	}
	public int getOrders_totalprice() {
		return orders_totalprice;
	}
	public void setOrders_totalprice(int orders_totalprice) {
		this.orders_totalprice = orders_totalprice;
	}
	public int getOrders_status() {
		return orders_status;
	}
	public void setOrders_status(int orders_status) {
		this.orders_status = orders_status;
	}
	public String getOrders_name() {
		return orders_name;
	}
	public void setOrders_name(String orders_name) {
		this.orders_name = orders_name;
	}
	public String getOrders_phone() {
		return orders_phone;
	}
	public void setOrders_phone(String orders_phone) {
		this.orders_phone = orders_phone;
	}
	public String getOrders_addr() {
		return orders_addr;
	}
	public void setOrders_addr(String orders_addr) {
		this.orders_addr = orders_addr;
	}
	public String getOrders_detailaddr() {
		return orders_detailaddr;
	}
	public void setOrders_detailaddr(String orders_detailaddr) {
		this.orders_detailaddr = orders_detailaddr;
	}
	public String getOrders_payment() {
		return orders_payment;
	}
	public void setOrders_payment(String orders_payment) {
		this.orders_payment = orders_payment;
	}
	public int getOrders_dvprice() {
		return orders_dvprice;
	}
	public void setOrders_dvprice(int orders_dvprice) {
		this.orders_dvprice = orders_dvprice;
	}
	public int getOrders_point() {
		return orders_point;
	}
	public void setOrders_point(int orders_point) {
		this.orders_point = orders_point;
	}
	public String getOrders_dv_request() {
		return orders_dv_request;
	}
	public void setOrders_dv_request(String orders_dv_request) {
		this.orders_dv_request = orders_dv_request;
	}
	public Date getOrders_completeday() {
		return orders_completeday;
	}
	public void setOrders_completeday(Date orders_completeday) {
		this.orders_completeday = orders_completeday;
	}
	
	
}