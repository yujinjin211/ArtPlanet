package com.artplanet.myapp.dao;

import java.util.List;

import com.artplanet.myapp.model.ThumbnailVO;

public interface IThumbnailRepository {
	
	public List<ThumbnailVO> findByExhibitionNo(int exhibition_no);
	public ThumbnailVO getThumbnail(int exhibition_no);

}
