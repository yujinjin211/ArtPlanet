package com.artplanet.myapp.model;

import lombok.Data;

@Data
public class JoinExhibitionThemeVO {
	
	private Exhibition_InfoVO exhibition;
	private Artist_InfoVO artist;
	private Place_InfoVO place;
	private ThumbnailVO thumbnail;
	private ThemeVO theme;
	private ExhibitionThemeVO exhTheme;
	private UserLikeExhVO userLikeExh;

}
