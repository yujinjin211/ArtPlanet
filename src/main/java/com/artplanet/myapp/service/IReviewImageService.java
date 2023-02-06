package com.artplanet.myapp.service;

import java.util.List;

import com.artplanet.myapp.model.ReviewImageVO;

public interface IReviewImageService {
	
	public void insertReviewImages(ReviewImageVO reviewImage);
	public void deleteReviewImages(String uuid);
	public List<ReviewImageVO> findByExhibitionNo(int exhibition_no);

}
