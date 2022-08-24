package com.jeonju.mypet.vo;


public class CommentVo {

	
	private int commentID;
	private int subCommentID;
	private int p_idx;
	private int midx;
	private String content;
	private String m_nick;

	public int getCommentID() {
		return commentID;
	}
	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}
	public int getSubCommentID() {
		return subCommentID;
	}
	public void setSubCommentID(int subCommentID) {
		this.subCommentID = subCommentID;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	
}
