package com.jeonju.mypet.vo;

import java.util.Date;

public class LaunchVo {

	private int launch_idx;
	private int midx;
	private String launch_subject;
	private String launch_content;
	private String launch_writer;
	private Date launch_wday;
	private String launch_filename;
	private int launch_status;
	private String launch_answer;
	public int getLaunch_idx() {
		return launch_idx;
	}
	public void setLaunch_idx(int launch_idx) {
		this.launch_idx = launch_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getLaunch_subject() {
		return launch_subject;
	}
	public void setLaunch_subject(String launch_subject) {
		this.launch_subject = launch_subject;
	}
	public String getLaunch_content() {
		return launch_content;
	}
	public void setLaunch_content(String launch_content) {
		this.launch_content = launch_content;
	}
	public String getLaunch_writer() {
		return launch_writer;
	}
	public void setLaunch_writer(String launch_writer) {
		this.launch_writer = launch_writer;
	}
	public Date getLaunch_wday() {
		return launch_wday;
	}
	public void setLaunch_wday(Date launch_wday) {
		this.launch_wday = launch_wday;
	}
	public String getLaunch_filename() {
		return launch_filename;
	}
	public void setLaunch_filename(String launch_filename) {
		this.launch_filename = launch_filename;
	}
	public int getLaunch_status() {
		return launch_status;
	}
	public void setLaunch_status(int launch_status) {
		this.launch_status = launch_status;
	}
	public String getLaunch_answer() {
		return launch_answer;
	}
	public void setLaunch_answer(String launch_answer) {
		this.launch_answer = launch_answer;
	}
	
}
