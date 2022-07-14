package com.jeonju.mypet.vo;

public class Criteria {//리스트 화면에 몇개를 보여줄 건가 + 페이지 값 담기

	private int page;			//페이지 번호
	private int perPageNum;		//화면에 리스트 출력 개수
	
	public Criteria () 
	{
		this.page=1;
		this.perPageNum=15;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		
		if( page <= 1 )
		{
			this.page=1;
			return;
		}
		
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	
	
	
}
