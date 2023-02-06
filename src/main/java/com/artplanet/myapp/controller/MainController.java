package com.artplanet.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artplanet.myapp.dao.IExhibitionInfoRepository;
import com.artplanet.myapp.model.JoinExhibitionVO;
import com.artplanet.myapp.model.MainImageVO;
import com.artplanet.myapp.service.IExhibitionService;
import com.artplanet.myapp.service.IMainImageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/")
@Controller
public class MainController {
	
	@Autowired
	IMainImageService mainImageService;
	
	@Autowired
	IExhibitionService exhibitionService;
	
	// 메인 페이지로 이동
//	@RequestMapping("/index")
//	public String mainPage() {
//		return "index";
//	}
	
	@GetMapping("/index")
	public void mainPage(Model model) {
		log.info("index.........");
		List<MainImageVO> mainList = mainImageService.getMainImageList();
		List<JoinExhibitionVO> exhibitionList = exhibitionService.getMainList();
		model.addAttribute("mainList", mainList);
		model.addAttribute("exhibitionList", exhibitionList);
	}
	
}
