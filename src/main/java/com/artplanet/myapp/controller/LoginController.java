package com.artplanet.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.artplanet.myapp.model.UserInfoVO;
import com.artplanet.myapp.service.IUserInfoService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/user/*")
@Controller
public class LoginController {
	
	
	@Autowired
	IUserInfoService userInfoService;
	
	//로그인
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
		
	//로그인
	@PostMapping("/loginCheck")
	public String loginCheck(UserInfoVO user, HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserInfoVO res = userInfoService.loginCheck(user);
		
		if(res != null) {
			session.setAttribute("user", res);
			return "redirect:/index";
		} else {
			return "redirect:/login";
		}
	}
	
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "user/logout";
	}

}
