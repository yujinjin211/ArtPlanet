package com.artplanet.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/notice/*")
@Controller
public class NoticeController {

	@RequestMapping("/news")
	public void notice() {
		
	}
	
}
