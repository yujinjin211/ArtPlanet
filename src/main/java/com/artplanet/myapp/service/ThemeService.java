package com.artplanet.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.IThemeRepository;
import com.artplanet.myapp.model.ThemeVO;
import com.artplanet.myapp.model.UserThemeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class ThemeService implements IThemeService {

	@Autowired
	IThemeRepository themeRepository;
	
	@Override
	public List<ThemeVO> getThemeList() {
		log.info("getThemeList.........");
		return themeRepository.getThemeList();
	}
	
	@Override
	public void insertUserTheme(String id, String theme_no) {
		log.info("insertUserTheme......... ID : " + id + ", theme_no : " + theme_no);
		themeRepository.insertUserTheme(id, theme_no);
	}
	
	@Override
	public void deleteUserTheme(String id, String theme_no) {
		log.info("insertUserTheme......... ID : " + id + ", theme_no : " + theme_no);
		themeRepository.deleteUserTheme(id, theme_no);
	}
	
	@Override
	public List<UserThemeVO> getUserThemeList(String id) {
		log.info("getUserThemeList......... ID : " + id);
		return themeRepository.getUserThemeList(id);
	}
}
