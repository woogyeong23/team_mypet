package com.jeonju.mypet.vo;


public class Product_ImgVo {

	private int p_front_img;
	private int p_idx;
	private String p_ori_filename;
	private String p_sys_filename;
	
	//te
	private int seller_idx;
	//

	public int getP_front_img() {
		return p_front_img;
	}
	public void setP_front_img(int p_front_img) {
		this.p_front_img = p_front_img;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
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
	
	public int getSeller_idx() {
		return seller_idx;
	}
	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}
	
	
	
}
