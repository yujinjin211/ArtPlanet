package com.artplanet.myapp.dao;

import java.util.List;

import com.artplanet.myapp.model.ReviewImageVO;

public interface IReviewImageRepository {

	public void insertReviewImages(ReviewImageVO reviewImage);
	public void deleteReviewImages(String uuid);
	public List<ReviewImageVO> findByExhibitionNo(int review_no);
}
