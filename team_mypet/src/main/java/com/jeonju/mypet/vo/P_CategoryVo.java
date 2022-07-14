package com.jeonju.mypet.vo;

import java.util.List;

public class P_CategoryVo {

	private int p_category_idx;
	private int p_category_large;
	private int p_category_small;
	
	private List<ProductVo> products; 
	public List<ProductVo> getProducts() {
		return products;
	}
	public void setProducts(List<ProductVo> products) {
		this.products = products;
	}
	
	
	public int getP_category_idx() {
		return p_category_idx;
	}
	public void setP_category_idx(int p_category_idx) {
		this.p_category_idx = p_category_idx;
	}
	public int getP_category_large() {
		return p_category_large;
	}
	public void setP_category_large(int p_category_large) {
		this.p_category_large = p_category_large;
	}
	public int getP_category_small() {
		return p_category_small;
	}
	public void setP_category_small(int p_category_small) {
		this.p_category_small = p_category_small;
	}
	
}
