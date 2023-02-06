package com.artplanet.myapp.service;

import com.artplanet.myapp.model.Place_InfoVO;

public interface IPlaceInfoService {
	
	public Place_InfoVO readPlaceInfo(int place_no); //전시 장소 정보 읽기

}
