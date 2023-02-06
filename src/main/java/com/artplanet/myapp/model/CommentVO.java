package com.artplanet.myapp.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {

	private int comment_no; 			//댓글번호
	private int review_no; 				//댓글이 작성된 글번호
	private String comment_id; 			//댓글작성자 아이디
	private String comment_nickName;	//댓글작성자 닉네임
	private String comment_content; 	//댓글내용
	private Timestamp comment_regDate; 	//댓글작성일시
	private int comment_parent; 		//부모댓글
}
