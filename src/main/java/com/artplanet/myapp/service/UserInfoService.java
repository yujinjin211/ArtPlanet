package com.artplanet.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artplanet.myapp.dao.IUserInfoRepository;
import com.artplanet.myapp.model.UserInfoVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserInfoService implements IUserInfoService {

	@Autowired
	@Setter(onMethod_ = @Autowired)
//	@Qualifier("IUserInfoRepository")
	IUserInfoRepository userInfoRepository;
	
	@Override
	public List<UserInfoVO> getUserList() {
		log.info("getUserList..........");
		return userInfoRepository.getUserList();
	}
	
	@Override
	public UserInfoVO readById(String userid) {
		log.info("readById........." + userid);
		return userInfoRepository.readById(userid);
	}
	
	@Transactional
	@Override
	public void insertUserInfo(UserInfoVO user) {
		log.info("insertUserInfo........." + user);
		userInfoRepository.insertUserInfo(user);
	}
	
	@Override
	public void updateUserInfo(UserInfoVO user) {
		log.info("updateUserInfo........." + user);
		userInfoRepository.updateUserInfo(user);
	}
	
	@Override
	public void withdrawUser(String id) {
		log.info("withdrawUser........." + id);
		userInfoRepository.withdrawUser(id);
	}
	
	@Override
	public UserInfoVO loginCheck(UserInfoVO user) {
		log.info("loginCheck........." + user);
		return userInfoRepository.loginCheck(user);
	}
	
	@Override
	public UserInfoVO userCheck(UserInfoVO user) {
		log.info("userCheck........." + user);
		return userInfoRepository.userCheck(user);
	}
}
