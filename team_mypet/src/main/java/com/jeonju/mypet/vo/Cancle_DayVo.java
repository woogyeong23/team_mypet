package com.jeonju.mypet.vo;

import java.util.Date;

public class Cancle_DayVo {

	private int cancle_idx;
	private int detail_idx;
	private int cancle_status;
	private Date cancle_progressday;
	public int getCancle_idx() {
		return cancle_idx;
	}
	public void setCancle_idx(int cancle_idx) {
		this.cancle_idx = cancle_idx;
	}
	public int getDetail_idx() {
		return detail_idx;
	}
	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}
	public int getCancle_status() {
		return cancle_status;
	}
	public void setCancle_status(int cancle_status) {
		this.cancle_status = cancle_status;
	}
	public Date getCancle_progressday() {
		return cancle_progressday;
	}
	public void setCancle_progressday(Date cancle_progressday) {
		this.cancle_progressday = cancle_progressday;
	}
	
}
