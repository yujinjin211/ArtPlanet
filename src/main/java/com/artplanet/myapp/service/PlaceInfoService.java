package com.artplanet.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.IPlaceInfoRepository;
import com.artplanet.myapp.model.Place_InfoVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class PlaceInfoService implements IPlaceInfoService {

	@Setter(onMethod_ = @Autowired)
	IPlaceInfoRepository placeInfoRepository;
	
	@Override
	public Place_InfoVO readPlaceInfo(int place_no) {
		log.info("readPlaceInfo........." + place_no);
		return placeInfoRepository.readPlaceInfo(place_no);
	}
}
