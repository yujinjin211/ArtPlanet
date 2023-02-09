package com.artplanet.myapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artplanet.myapp.model.ProfileImageVO;
import com.artplanet.myapp.model.UserInfoVO;

public interface IUserInfoService {
	
	public void insertUserInfo(UserInfoVO user); //회원가입
	public List<UserInfoVO> getUserList(); //회원목록 가져오기
	public UserInfoVO readById(String userid); 
	public void updateUserInfo(UserInfoVO user); //회원정보수정
	public void withdrawUser(String id); //회원탈퇴
	public UserInfoVO loginCheck(UserInfoVO user); //로그인
	public UserInfoVO userCheck(UserInfoVO user); //회원 정보 확인
	public List<ProfileImageVO> getProfileImage(String id); //id로 프로필 이미지 읽어오기
}
