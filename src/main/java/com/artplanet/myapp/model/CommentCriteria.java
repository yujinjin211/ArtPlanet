package com.artplanet.myapp.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentCriteria {

	private int pageNum;
	private int amount;
	
	public CommentCriteria() {
		this(1, 10);
	}
	
	public CommentCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
