package com.artplanet.myapp.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {

	private int notice_no;
	private String id;
	private String category;
	private String writer_name;
	private String notice_title;
	private String notice_content;
	private Timestamp writeDate;
	private Timestamp modDate;
	private int readCount;
	private String deleteYn;
	
}
