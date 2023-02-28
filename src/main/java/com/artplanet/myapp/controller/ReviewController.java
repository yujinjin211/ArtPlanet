package com.artplanet.myapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.artplanet.myapp.model.Criteria;
import com.artplanet.myapp.model.PageDTO;
import com.artplanet.myapp.model.ReviewImageVO;
import com.artplanet.myapp.model.ReviewJoinExhibitionVO;
import com.artplanet.myapp.model.ReviewVO;
import com.artplanet.myapp.service.ICommentService;
import com.artplanet.myapp.service.IExhibitionService;
import com.artplanet.myapp.service.IReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/review/*")
@Controller
public class ReviewController {
	
	@Autowired
	IReviewService reviewService;
	
	@Autowired
	IExhibitionService exhibitionService;
	
	@Autowired
	ICommentService commentService;
	
	//리뷰 목록 페이지 이동
	@GetMapping("/review")
	public void reviewList(Criteria cri, Model model) {
		int total = reviewService.getTotalCount(cri);
		log.info("total : " + total);
		model.addAttribute("reviewList", reviewService.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//리뷰 작성 페이지 이동
	@GetMapping("/insertReview")
	public String reviewWrite(Model model) {
		List<Map<String, Object>> exhibitionList = exhibitionService.getAllExhibitionNo();
		model.addAttribute("exhibitionList", exhibitionList);
		model.addAttribute("review", new ReviewVO());
		return "review/review-write";
	}
	
	//리뷰 작성
	@PostMapping("/review-write")
	public String reviewWrite(@ModelAttribute("review") ReviewVO review,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) {
		log.info("==================================================");
		log.info("review : " + review);
		if(result.hasErrors()) {
			model.addAttribute("exhibitionList", exhibitionService.getAllExhibitionNo());
			return "review/review-write";
		}
		if(review.getImageList() != null) {
			review.getImageList().forEach(reviewImage -> log.info("reviewImage : " + reviewImage));
		}
		log.info("==================================================");
		try {
			reviewService.insertSelectKey(review);
			
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/review/review-write-success/" + review.getReview_no() ;
	}
	
	//작성한 리뷰 바로 보기
	@RequestMapping("/review-write-success/{review_no}")
	public String reviewSuccess(@PathVariable("review_no") int review_no, Model model) {
		ReviewVO review = reviewService.readReview(review_no);
		model.addAttribute("review", review);
		return "review/review-write-success";
	}
	
	//리뷰 게시글 읽기
	@GetMapping("/review-read")
	public void reivewRead(@RequestParam("review_no") int review_no, Model model) {
		ReviewVO review = reviewService.readReview(review_no);
		reviewService.readCount(review_no); // 조회수 증가
		model.addAttribute("review", review);
	}
	
	//리뷰 삭제
	@PostMapping("/deleteReview")
	@ResponseBody
	public void deleteReview(int review_no, String id) {
		log.info("Delete Review.........");
		reviewService.deleteReview(review_no);
	}
	
	//첨부한 이미지 읽기
	@GetMapping(value = "/getImageList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ReviewImageVO>> getImageList(int review_no) {
		log.info("getImageList : " + review_no);
		return new ResponseEntity<>(reviewService.getImageList(review_no), HttpStatus.OK);
	}
	
	//리뷰 수정
	@RequestMapping("/review-update")
	public void reivewUpdate(int review_no, Model model) {
		log.info("Update Review.........");
		ReviewJoinExhibitionVO reviewContent = reviewService.readReviewJoinExhibition(review_no);
		
		log.info("reviewContent : " + reviewContent);
		
		model.addAttribute("reviewContent", reviewContent);
	}
}
