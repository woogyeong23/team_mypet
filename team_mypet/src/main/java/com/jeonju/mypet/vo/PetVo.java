package com.jeonju.mypet.vo;

import java.util.Date;

public class PetVo {

	private int pet_idx;
	private int midx;
	private String pet_name;
	private String pet_type;
	private String pet_breed;
	private int pet_age;
	private String pet_gender;
	private String pet_delyn;
	private Date pet_deldate;
	public int getPet_idx() {
		return pet_idx;
	}
	public void setPet_idx(int pet_idx) {
		this.pet_idx = pet_idx;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_type() {
		return pet_type;
	}
	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}
	public String getPet_breed() {
		return pet_breed;
	}
	public void setPet_breed(String pet_breed) {
		this.pet_breed = pet_breed;
	}
	public int getPet_age() {
		return pet_age;
	}
	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}
	public String getPet_gender() {
		return pet_gender;
	}
	public void setPet_gender(String pet_gender) {
		this.pet_gender = pet_gender;
	}
	public String getPet_delyn() {
		return pet_delyn;
	}
	public void setPet_delyn(String pet_delyn) {
		this.pet_delyn = pet_delyn;
	}
	public Date getPet_deldate() {
		return pet_deldate;
	}
	public void setPet_deldate(Date pet_deldate) {
		this.pet_deldate = pet_deldate;
	}
	
}
