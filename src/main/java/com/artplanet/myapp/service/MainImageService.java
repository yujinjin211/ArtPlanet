package com.artplanet.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.IMainImageRepository;
import com.artplanet.myapp.model.MainImageVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class MainImageService implements IMainImageService {

	@Setter(onMethod_ = @Autowired)
	IMainImageRepository mainImageRepository;
	
	@Override
	public List<MainImageVO> getMainImageList() {
		log.info("getMainImageList.........");
		return mainImageRepository.getMainImageList();
	}
	
}
