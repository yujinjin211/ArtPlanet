package com.artplanet.myapp.model;

import java.util.Date;

import lombok.Data;

@Data
public class UserVisitExhVO {

	private String id;
	private int exhibition_no;
	private int visitNo;
	private Date visitDate;
}
