package com.artplanet.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artplanet.myapp.dao.IReviewImageRepository;
import com.artplanet.myapp.dao.IReviewRepository;
import com.artplanet.myapp.model.Criteria;
import com.artplanet.myapp.model.ReviewImageVO;
import com.artplanet.myapp.model.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewService implements IReviewService {

	@Setter(onMethod_ = @Autowired)
	IReviewRepository reviewRepository;
	
	@Setter(onMethod_ = @Autowired)
	private IReviewImageRepository reviewImageRepository;
	
	@Override
	public List<ReviewVO> getReviewList() {
		log.info("getReviewList.........");
		return reviewRepository.getReviewList();
	}
	
	@Override
	public List<ReviewVO> getListWithPaging(Criteria cri) {
		log.info("getListWithPaging........." + cri);
		log.info(reviewRepository.getListWithPaging(cri));
		return reviewRepository.getListWithPaging(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		log.info("getTotalCount" + cri);
		log.info(reviewRepository.getTotalCount(cri));
		return reviewRepository.getTotalCount(cri);
	}
	
	@Override
	public void insertReview(ReviewVO review) {
		log.info("insertReview........." + review);
		reviewRepository.insertReview(review);
	}
	
	@Transactional
	@Override
	public void insertSelectKey(ReviewVO review) {
		log.info("insertSelectKey........." + review);
		
		reviewRepository.insertSelectKey(review);
		
		if(review.getImageList() == null || review.getImageList().size() <= 0) {
			return;
		}
		review.getImageList().forEach(reviewImage ->{
			reviewImage.setReview_no(review.getReview_no());
			reviewImageRepository.insertReviewImages(reviewImage);
		});
	}
	
	@Override
	public ReviewVO readReview(int review_no) {
		log.info("readReview........." + review_no);
		return reviewRepository.readReview(review_no);
	}
	
	@Override
	public int deleteReview(int review_no) {
		log.info("deleteReview........." + review_no);
		return reviewRepository.deleteReview(review_no);
	}
	
	@Override
	public int updateReivew(ReviewVO review) {
		log.info("updateReview........." + review);
		return reviewRepository.updateReivew(review);
	}
	
	@Override
	public void readCount(int review_no) {
		log.info("readCount........." + review_no);
		reviewRepository.readCount(review_no);
	}
	
	@Override
	public List<ReviewImageVO> getImageList(int review_no) {
		log.info("get Image List by review_no" + review_no);
		return reviewImageRepository.findByExhibitionNo(review_no);
	}
	
	@Override
	public List<ReviewVO> getReviewListWithPagingFindById(Criteria cri, String id) {
		log.info("get review list with paging and find by Id : " + id);
		return reviewRepository.getReviewListWithPagingFindById(cri, id);
	}
	
}
