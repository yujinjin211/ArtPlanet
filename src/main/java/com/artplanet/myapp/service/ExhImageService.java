package com.artplanet.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.IExhImageRepository;
import com.artplanet.myapp.model.ExhibitionImageVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class ExhImageService implements IExhImageService {

	@Setter(onMethod_ = @Autowired)
	IExhImageRepository exhImageRepository;
	
	@Override
	public List<ExhibitionImageVO> getExhImageList(int exhibition_no) {
		log.info("getExhImageList........ exhibition_no : " + exhibition_no);
		return exhImageRepository.getExhImageList(exhibition_no);
	}
	
}
