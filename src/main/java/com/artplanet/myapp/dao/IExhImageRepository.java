package com.artplanet.myapp.dao;

import java.util.List;

import com.artplanet.myapp.model.ExhibitionImageVO;


public interface IExhImageRepository {
	
	public List<ExhibitionImageVO> getExhImageList(int exhibition_no); //디테일 화면용 메인 이미지

}
