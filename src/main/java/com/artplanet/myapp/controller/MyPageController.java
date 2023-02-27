package com.artplanet.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artplanet.myapp.model.Criteria;
import com.artplanet.myapp.model.ExhCriteria;
import com.artplanet.myapp.model.JoinExhibitionThemeVO;
import com.artplanet.myapp.model.JoinExhibitionVO;
import com.artplanet.myapp.model.LikeListCriteria;
import com.artplanet.myapp.model.PageDTO;
import com.artplanet.myapp.model.ReviewVO;
import com.artplanet.myapp.model.TrendCriteria;
import com.artplanet.myapp.model.UserInfoVO;
import com.artplanet.myapp.service.IArtistInfoService;
import com.artplanet.myapp.service.IExhImageService;
import com.artplanet.myapp.service.IExhibitionService;
import com.artplanet.myapp.service.IPlaceInfoService;
import com.artplanet.myapp.service.IReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/mypage/*")
@Controller
public class MyPageController {
	
	@Autowired
	IExhibitionService exhibitionService;
	
	@Autowired
	IArtistInfoService artistInfoService;
	
	@Autowired
	IPlaceInfoService placeInfoService;
	
	@Autowired
	IExhImageService exhImageService;
	
	@Autowired
	IReviewService reviewService;
	
	@GetMapping("/like-exhibition-list")
	public void likeExhibitionList(LikeListCriteria cri, Model model, HttpSession session) {
		log.info("like-exhibition-list.........");
		
		int total = exhibitionService.getTotalCount(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
		log.info("user info : " + userInfo.getId());
		List<JoinExhibitionVO> exhList = exhibitionService.getLikeListWithPagingID(cri, userInfo.getId());
		model.addAttribute("exhList", exhList);
		
	}
	
	@RequestMapping("/visit-exhibition-list")
	public void visitExhibitionList(TrendCriteria cri, Model model, HttpSession session) {
		log.info("visit-Exhibition-List.........");
		
		int total = exhibitionService.getTotalCount(cri);
		log.info("total : " + total);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		log.info("pageMaker : " + pageMaker );
		model.addAttribute("pageMaker", pageMaker);
		
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
		log.info("user info : " + userInfo.getId());
		
		List<JoinExhibitionThemeVO> exhList = exhibitionService.getVisitExhAllDate(cri, userInfo.getId());
		model.addAttribute("exhList", exhList);
	}
	
	@GetMapping("/my-review-list")
	public void myReviewList(Criteria cri, Model model, HttpSession session) {
		log.info("my-review-list.........");
		
		int total = reviewService.getTotalCount(cri);
		log.info("total : " + total);

		PageDTO pageMaker = new PageDTO(cri, total);
		log.info("pageMaker : " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
		log.info("user info : " + userInfo.getId());
		
		List<ReviewVO> reviewList = reviewService.getReviewListWithPagingFindById(cri, userInfo.getId());
		model.addAttribute("reviewList", reviewList);
		
	}
	
}
