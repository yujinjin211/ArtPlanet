package com.artplanet.myapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artplanet.myapp.model.Criteria;
import com.artplanet.myapp.model.ReviewImageVO;
import com.artplanet.myapp.model.ReviewVO;

public interface IReviewService {

	public List<ReviewVO> getReviewList(); 					//리뷰 목록 가져오기
	public List<ReviewVO> getListWithPaging(Criteria cri); 	//페이징 처리한 목록
	public int getTotalCount(Criteria cri); 				//전체 게시글 수 구하기
	public void insertReview(ReviewVO review); 				//리뷰작성(insert만 처리)
	public void insertSelectKey(ReviewVO review); 			//리뷰작성(insert실행 후 PK값까지 알아야할때)
	public ReviewVO readReview(int review_no); 				//리뷰 읽기
	public int deleteReview(int review_no); 				//리뷰 삭제(delete가 아닌 deleteYn의 값을 n으로 바꾸는 작업)
	public int updateReivew(ReviewVO review); 				//리뷰 수정
	public void readCount(int review_no); 					//조회수 증가
	public List<ReviewImageVO> getImageList(int review_no);	//첨부한 이미지 읽기
	
	public List<ReviewVO> getReviewListWithPagingFindById(@Param("cri") Criteria cri, @Param("id") String id); //페이징 처리된 특정 회원의 리뷰 목록 가져오기
	
}
