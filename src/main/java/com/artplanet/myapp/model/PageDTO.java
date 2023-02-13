package com.artplanet.myapp.model;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	private CommentCriteria cri2;
	private ExhCriteria cri3;
	private TrendCriteria cri4;
	private LikeListCriteria cri5;
	
	//기본
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	//댓글
	public PageDTO(CommentCriteria cri, int total) {
		this.cri2 = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	//전시정보
	public PageDTO(ExhCriteria cri, int total) {
		this.cri3 = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 12.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	//트렌드조회
	public PageDTO(TrendCriteria cri, int total) {
		this.cri4 = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 2.0)) * 2;
		this.startPage = this.endPage - 1;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	//마이페이지-관심 전시 목록 조회
	public PageDTO(LikeListCriteria cri, int total) {
		this.cri5 = cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 9.0)) * 5;
		this.startPage = this.endPage - 4;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
