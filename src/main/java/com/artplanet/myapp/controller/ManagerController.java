package com.artplanet.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/exh/*")
@Controller
public class ManagerController {

	//전시회 추가 페이지 이동
	@GetMapping("/addExhibition")
	public String addExhibition() {
		return "exh/exhibition-add";
	}
	
	
	
}
