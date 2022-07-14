package com.jeonju.mypet.vo;


public class ChatVo {

	private int chat_idx;
	private int chatRoom_idx;
	private int midx;
	private int seller_idx;
	private String chat_content;
	private String chat_img;
	private String chat_sendtime;
	private String chat_yn;
	public int getChat_idx() {
		return chat_idx;
	}
	public void setChat_idx(int chat_idx) {
		this.chat_idx = chat_idx;
	}
	public int getChatRoom_idx() {
		return chatRoom_idx;
	}
	public void setChatRoom_idx(int chatRoom_idx) {
		this.chatRoom_idx = chatRoom_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getSeller_idx() {
		return seller_idx;
	}
	public void setSeller_idx(int seller_idx) {
		this.seller_idx = seller_idx;
	}
	public String getChat_content() {
		return chat_content;
	}
	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}
	public String getChat_img() {
		return chat_img;
	}
	public void setChat_img(String chat_img) {
		this.chat_img = chat_img;
	}
	public String getChat_sendtime() {
		return chat_sendtime;
	}
	public void setChat_sendtime(String chat_sendtime) {
		this.chat_sendtime = chat_sendtime;
	}
	public String getChat_yn() {
		return chat_yn;
	}
	public void setChat_yn(String chat_yn) {
		this.chat_yn = chat_yn;
	}
	
}
