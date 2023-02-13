package com.artplanet.myapp.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public String loginCheck(UserInfoVO user, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		UserInfoVO res = userInfoService.loginCheck(user);
		
		if(res != null) {
			session.setAttribute("user", res);
			
			return "redirect:/index";
		} else {
			return "redirect:/login";
		}
	}
	
	@PostMapping("rememberId")
	public void rememberId(String id, HttpServletResponse response) {
		log.info("cookie id : " + id);
		
		Cookie cookie = new Cookie("id", id);
		response.addCookie(cookie);
	}
	
	@PostMapping("delete-rememberId")
	public void deleteRememberId(String id, HttpServletResponse response) {
		log.info("cookie id : " + id);
		
		Cookie cookie = new Cookie("id", id);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
	
	//로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "user/logout";
	}

}
