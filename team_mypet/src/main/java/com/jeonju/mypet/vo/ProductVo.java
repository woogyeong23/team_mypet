package com.jeonju.mypet.vo;

import java.util.Date;
import java.util.List;

public class ProductVo {

	private int p_idx;
	private int seller_idx;
	private int p_category_idx;
	private String p_name;
	private String p_content;
	private int p_price;
	private int p_discount;
	private int p_disprice;
	private Date p_wday;
	private Date p_modifyday;
	private String p_cancle_info;
	private String p_ingerdient;
	private int p_dvprice;
	private String p_dvcompany;
	private int p_limit_cnt;
	private int p_point;
	private int p_add_dvprice;
	private int p_free_dvprice;
	private int p_size;//0,1,2 소중대
	private int p_status;
	private String p_delyn;
	private String p_stock;
	
	private int sales;
	
	
	//08.08 ver
	
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}


	private int avg_reviews_stars;

	
	//

	private List<Product_ImgVo> product_imgs; 
	
	public List<Product_ImgVo> getProduct_imgs() {
		return product_imgs;
	}
	public void setProduct_imgs(List<Product_ImgVo> product_imgs) {
		this.product_imgs = product_imgs;
	}
	
	
	//소현
	private String m_nick;
	private int p_front_img;
	private String p_ori_filename;
	private String p_sys_filename;
	private String categoryName;
	private String categoryLargeName;
	private String p_category_large;
	
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public int getP_front_img() {
		return p_front_img;
	}
	public void setP_front_img(int p_front_img) {
		this.p_front_img = p_front_img;
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
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryLargeName() {
		return categoryLargeName;
	}
	public void setCategoryLargeName(String categoryLargeName) {
		this.categoryLargeName = categoryLargeName;
	}
	public String getP_category_large() {
		return p_category_large;
	}
	public void setP_category_large(String p_category_large) {
		this.p_category_large = p_category_large;
	}
	//소현

	
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public int getSeller_idx() {
		return seller_idx;
	}
	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}
	public int getP_category_idx() {
		return p_category_idx;
	}
	public void setP_category_idx(int p_category_idx) {
		this.p_category_idx = p_category_idx;
	}
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
	public int getP_discount() {
		return p_discount;
	}
	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}
	public int getP_disprice() {
		return p_disprice;
	}
	public void setP_disprice(int p_disprice) {
		this.p_disprice = p_disprice;
	}
	public Date getP_wday() {
		return p_wday;
	}
	public void setP_wday(Date p_wday) {
		this.p_wday = p_wday;
	}
	public Date getP_modifyday() {
		return p_modifyday;
	}
	public void setP_modifyday(Date p_modifyday) {
		this.p_modifyday = p_modifyday;
	}
	public String getP_cancle_info() {
		return p_cancle_info;
	}
	public void setP_cancle_info(String p_cancle_info) {
		this.p_cancle_info = p_cancle_info;
	}
	public String getP_ingerdient() {
		return p_ingerdient;
	}
	public void setP_ingerdient(String p_ingerdient) {
		this.p_ingerdient = p_ingerdient;
	}
	public int getP_dvprice() {
		return p_dvprice;
	}
	public void setP_dvprice(int p_dvprice) {
		this.p_dvprice = p_dvprice;
	}
	public String getP_dvcompany() {
		return p_dvcompany;
	}
	public void setP_dvcompany(String p_dvcompany) {
		this.p_dvcompany = p_dvcompany;
	}
	public int getP_limit_cnt() {
		return p_limit_cnt;
	}
	public void setP_limit_cnt(int p_limit_cnt) {
		this.p_limit_cnt = p_limit_cnt;
	}
	public int getP_point() {
		return p_point;
	}
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}
	public int getP_add_dvprice() {
		return p_add_dvprice;
	}
	public void setP_add_dvprice(int p_add_dvprice) {
		this.p_add_dvprice = p_add_dvprice;
	}
	public int getP_free_dvprice() {
		return p_free_dvprice;
	}
	public void setP_free_dvprice(int p_free_dvprice) {
		this.p_free_dvprice = p_free_dvprice;
	}
	public int getP_size() {
		return p_size;
	}
	public void setP_size(int p_size) {
		this.p_size = p_size;
	}
	public int getP_status() {
		return p_status;
	}
	public void setP_status(int p_status) {
		this.p_status = p_status;
	}
	public String getP_delyn() {
		return p_delyn;
	}
	public void setP_delyn(String p_delyn) {
		this.p_delyn = p_delyn;
	}
	public String getP_stock() {
		return p_stock;
	}
	public void setP_stock(String p_stock) {
		this.p_stock = p_stock;
	}
	
	
	public int getAvg_reviews_stars() {
		return avg_reviews_stars;
	}
	public void setAvg_reviews_stars(int avg_reviews_stars) {
		this.avg_reviews_stars = avg_reviews_stars;
	}

	
	
	
}
