package com.artplanet.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artplanet.myapp.model.ExhCriteria;
import com.artplanet.myapp.model.JoinExhibitionVO;
import com.artplanet.myapp.model.LikeListCriteria;
import com.artplanet.myapp.model.PageDTO;
import com.artplanet.myapp.model.UserInfoVO;
import com.artplanet.myapp.service.IArtistInfoService;
import com.artplanet.myapp.service.IExhImageService;
import com.artplanet.myapp.service.IExhibitionService;
import com.artplanet.myapp.service.IPlaceInfoService;

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
	public void visitExhibitionList() {
		
	}

}
