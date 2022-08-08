package com.jeonju.mypet.vo;

import java.util.Date;

public class BoardVo {

	private int bidx;
	private int midx;
	private int board_name;
	private String board_subject;
	private String board_content;
	private String board_writer;
	private Date board_wday;
	private int board_origin_bidx;
	private int board_depth;
	private int borad_level_;
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getBoard_name() {
		return board_name;
	}
	public void setBoard_name(int board_name) {
		this.board_name = board_name;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public Date getBoard_wday() {
		return board_wday;
	}
	public void setBoard_wday(Date board_wday) {
		this.board_wday = board_wday;
	}
	public int getBoard_origin_bidx() {
		return board_origin_bidx;
	}
	public void setBoard_origin_bidx(int board_origin_bidx) {
		this.board_origin_bidx = board_origin_bidx;
	}
	public int getBoard_depth() {
		return board_depth;
	}
	public void setBoard_depth(int board_depth) {
		this.board_depth = board_depth;
	}
	public int getBorad_level_() {
		return borad_level_;
	}
	public void setBorad_level_(int borad_level_) {
		this.borad_level_ = borad_level_;
	}
	public String getBord_front_image() {
		return bord_front_image;
	}
	public void setBord_front_image(String bord_front_image) {
		this.bord_front_image = bord_front_image;
	}
	public String getBoard_delyn() {
		return board_delyn;
	}
	public void setBoard_delyn(String board_delyn) {
		this.board_delyn = board_delyn;
	}
	public String getBoard_delday() {
		return board_delday;
	}
	public void setBoard_delday(String board_delday) {
		this.board_delday = board_delday;
	}
	private String bord_front_image;
	private String board_delyn;
	private String board_delday;
	
}