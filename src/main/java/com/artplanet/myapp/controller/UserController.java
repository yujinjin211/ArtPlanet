package com.artplanet.myapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.artplanet.myapp.model.UserInfoVO;
import com.artplanet.myapp.service.IUserInfoService;

@RequestMapping("/user/*")
@Controller
public class UserController {
	
	@Autowired
	IUserInfoService userInfoService;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/register")
	public String register() {
		return "user/register";
	}
	
	//회원 타입별 회원가입 페이지 이동(일반회원:normar, 운영자회원:manager)
	@GetMapping(value="/joinNormar")
	public String joinNormar(Model model) {
		model.addAttribute("user", new UserInfoVO());
		return "user/normar-register-form";
	}
	
	@PostMapping(value="/joinNormar")
	public String joinNormar(@ModelAttribute("user") UserInfoVO user, @RequestParam String email1, @RequestParam String email2,
			Model model, RedirectAttributes redirectAttributes) {
		try {
			user.setEmail(email1 + "@" + email2);
			userInfoService.insertUserInfo(user);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/user/join-success/" + user.getId();
	}
	
	@GetMapping(value="/joinManager")
	public String joinManager(Model model) {
		model.addAttribute("user", new UserInfoVO());
		return "user/manager-register-form";
	}
	
	@PostMapping(value="/joinManager")
	public String joinManager(@ModelAttribute("user") UserInfoVO user, @RequestParam String email1, @RequestParam String email2,
			Model model, RedirectAttributes redirectAttributes) {
		try {
			user.setEmail(email1 + "@" + email2);
			userInfoService.insertUserInfo(user);
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", e.getMessage());
		}
		return "redirect:/user/join-success/" + user.getId();
	}
	
	//회원가입성공 후 성공페이지 이동
	@RequestMapping(value = "/join-success/{id}")
	public String joinSuccess(@PathVariable String id, Model model) {
		UserInfoVO user = userInfoService.readById(id);
		model.addAttribute("user", user);
		return "user/join-success";
	}
	
	//마이페이지 이동
	//일반회원
	@RequestMapping(value = "/normar-mypage")
	public String normarMypage() {
		return "user/normar-mypage";
	}
	//운영자회원
	@RequestMapping(value = "/manager-mypage")
	public String managerMypage() {
		return "user/manager-mypage";
	}
	
	//회원정보 확인 후 회원정보 수정으로 페이지 이동
	@RequestMapping(value = "/userConfirm")
	public String userCheck() {
		return "user/editProfile-pwCheck";
	}
	
	//회원정보수정
	@PostMapping(value = "/userCheck")
	public String userCheck(UserInfoVO user, Model model) {
		UserInfoVO userInfo = userInfoService.userCheck(user);
		System.out.println(userInfo.getNickName());
		if(userInfo != null) {
			String email = userInfo.getEmail();
			String splitEmail[] = email.split("@");
			String email1 = null;
			String email2 = null;
			if(splitEmail != null && splitEmail.length >= 2) {
				email1 = splitEmail[0];
				email2 = splitEmail[1];
			}
			model.addAttribute("email1", email1);
			model.addAttribute("email2", email2);
			return "user/edit-profile";
		}
		return "redirect:/user/userCheck";
	}
	
	@PostMapping(value = "/updateUser")
	public String updateUser(UserInfoVO user, @RequestParam String email1, @RequestParam String email2, Model model) {
		user.setEmail(email1 + "@" + email2);
		userInfoService.updateUserInfo(user);
		model.addAttribute(user);
		return "user/edit-profile-success";
	}
	
	//회원탈퇴
	@PostMapping(value = "/withDrawUser")
	public void withDrawUser(UserInfoVO user) {
		String id = user.getId();
		userInfoService.withdrawUser(id);
	}

}
