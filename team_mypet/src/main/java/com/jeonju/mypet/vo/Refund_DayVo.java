package com.jeonju.mypet.vo;

import java.util.Date;

public class Refund_DayVo {

	private int refund_idx;
	private int detail_idx;
	private int refund_status;
	private Date refund_progressday;
	
	public int getRefund_idx() {
		return refund_idx;
	}
	public void setRefund_idx(int refund_idx) {
		this.refund_idx = refund_idx;
	}
	public int getDetail_idx() {
		return detail_idx;
	}
	public void setDetail_idx(int detail_idx) {
		this.detail_idx = detail_idx;
	}
	public int getRefund_status() {
		return refund_status;
	}
	public void setRefund_status(int refund_status) {
		this.refund_status = refund_status;
	}
	public Date getRefund_progressday() {
		return refund_progressday;
	}
	public void setRefund_progressday(Date refund_progressday) {
		this.refund_progressday = refund_progressday;
	}
	
}
