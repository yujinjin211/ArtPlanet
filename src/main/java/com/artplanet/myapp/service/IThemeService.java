package com.artplanet.myapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artplanet.myapp.model.ThemeVO;
import com.artplanet.myapp.model.UserThemeVO;

public interface IThemeService {
	
	public List<ThemeVO> getThemeList();
	public void insertUserTheme(@Param("id") String id, @Param("theme_no") String theme_no);
	public void deleteUserTheme(@Param("id") String id, @Param("theme_no") String theme_no);
	public List<UserThemeVO> getUserThemeList(String id);

}
