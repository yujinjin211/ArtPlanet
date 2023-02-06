package com.artplanet.myapp.dao;

import java.util.List;

import com.artplanet.myapp.model.MainImageVO;

public interface IMainImageRepository {
	
	public List<MainImageVO> getMainImageList(); //index 화면용 메인 이미지

}
