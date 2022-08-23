package com.jeonju.mypet.vo;

import java.util.Date;
import java.util.List;

public class OrdersVo {

	private int orders_idx;
	private int midx;
	private int p_idx;
	private Date orders_day;
	private int orders_totalprice;
	private int orders_status;
	private String orders_name;
	private String orders_phone;
	private String orders_addr1;
	private String orders_addr2;
	private String orders_addr3;
	private String orders_payment;
	private int orders_dvprice;
	private int orders_point;
	private String orders_dv_request;
	private Date orders_completeday;
	private String m_name;
	private String m_id;
	private String bundleprice;
	
	private int cart_cnt;
    private String p_name;
    private int p_price;
    private double p_discount;
	private int salePrice;
	private int totalPrice;
    private int point;
    private int totalPoint;
    
	
	public String getBundleprice() {
		return bundleprice;
	}
	public void setBundleprice(String bundleprice) {
		this.bundleprice = bundleprice;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
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
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getOrders_addr3() {
		return orders_addr3;
	}
	public void setOrders_addr3(String orders_addr3) {
		this.orders_addr3 = orders_addr3;
	}
	
	
	
	public int getCart_cnt() {
		return cart_cnt;
	}
	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
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
	public double getP_discount() {
		return p_discount;
	}
	public void setP_discount(double p_discount) {
		this.p_discount = p_discount;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.p_price * (1-this.p_discount));
		this.totalPrice = this.salePrice*this.cart_cnt;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point * this.cart_cnt;
	}
	
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [p_idx=" + p_idx + ", cartcnt=" + cart_cnt + ", p_name=" + p_name
				+ ", p_price=" + p_price + ", p_discount=" + p_discount + ", salePrice=" + salePrice
				+ ", totalPrice=" + totalPrice + ", point=" + point + ", totalPoint=" + totalPoint + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}