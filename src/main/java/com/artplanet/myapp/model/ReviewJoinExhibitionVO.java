package com.artplanet.myapp.model;

import lombok.Data;

@Data
public class ReviewJoinExhibitionVO {
	
	private Exhibition_InfoVO exhibition;
	private ReviewVO review;
	private ReviewImageVO reviewImage;

}
