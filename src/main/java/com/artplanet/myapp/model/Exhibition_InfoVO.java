package com.artplanet.myapp.model;

import java.util.Date;

import lombok.Data;

@Data
public class Exhibition_InfoVO {
	
	private int exhibition_no;
	private int place_no;
	private int artist_no;
	private String title;
	private String realm;
	private String price;
	private Date startDate;
	private Date endDate;
	private String intro;
	private int likeCount;
	private String endYn;
	
}
