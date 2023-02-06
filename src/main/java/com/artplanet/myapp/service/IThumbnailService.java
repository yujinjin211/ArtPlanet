package com.artplanet.myapp.service;

import java.util.List;

import com.artplanet.myapp.model.ThumbnailVO;

public interface IThumbnailService {

	public List<ThumbnailVO> findByExhibitionNo(int exhibition_no);
	
}
