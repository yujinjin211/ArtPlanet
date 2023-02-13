package com.artplanet.myapp.model;

import lombok.Data;

@Data
public class JoinExhibitionVO {
	
	private Exhibition_InfoVO exhibition;
	private Artist_InfoVO artist;
	private Place_InfoVO place;
	private ThumbnailVO thumbnail;
	private UserLikeExhVO userLikeExh;
	private UserVisitExhVO userVisitExh;

}
