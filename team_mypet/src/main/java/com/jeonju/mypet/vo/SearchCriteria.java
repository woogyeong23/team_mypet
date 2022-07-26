package com.jeonju.mypet.vo;

public class SearchCriteria extends Criteria{

	private String searchType;
	private String keyword;
	private String startday;
	private String endday;
	public SearchCriteria()
	{
		this.searchType="";
		this.keyword="";
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStartday() {
		return startday;
	}

	public void setStartday(String startday) {
		this.startday = startday;
	}

	public String getEndday() {
		return endday;
	}

	public void setEndday(String endday) {
		this.endday = endday;
	}

	
	
}
