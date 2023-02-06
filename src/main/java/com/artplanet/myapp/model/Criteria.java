package com.artplanet.myapp.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { 
	//Criteria의 용도는 pageNum과 amount값을 같이 전달하는 용도, 생성자를 통해 기본값을 1페이지, 10개로 지정하여 처리한다.
	
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
