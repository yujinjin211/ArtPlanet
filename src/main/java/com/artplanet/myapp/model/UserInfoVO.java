package com.artplanet.myapp.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserInfoVO {
	
	private String id;
	private String name;
	private String password;
	private String nickName;
	private String email;
	private String phoneNumber;
	private String birth;
	private String gender;
	private String userType;
	private Timestamp regDate;
	
}
