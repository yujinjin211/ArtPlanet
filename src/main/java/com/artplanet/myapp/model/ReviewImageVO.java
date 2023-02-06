package com.artplanet.myapp.model;

import lombok.Data;

@Data
public class ReviewImageVO {
	
	private int review_no; //예제의 bno에 해당
	
	private String image_fileName; //예제의 fileName에 해당
	private String image_directory; //예제의 uploadPath에 해당
	private String uuid;
	private boolean image;

}
