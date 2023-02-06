package com.artplanet.myapp.model;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class ReviewVO {
	
	private int review_no;
	private String id;
	private int exhibition_no;
	private String writer_nickName;
	private String review_title;
	private String review_content;
	private Timestamp writeDate;
	private Timestamp modDate;
	private int readCount;
	private String deleteYn;
	
	private List<ReviewImageVO> imageList;
	
}
