package com.artplanet.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.IArtistInfoRepository;
import com.artplanet.myapp.model.Artist_InfoVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class ArtistInfoService implements IArtistInfoService {

	@Setter(onMethod_ = @Autowired)
	IArtistInfoRepository artistInfoRepository;
	
	@Override
	public Artist_InfoVO readArtistInfo(int artist_no) {
		log.info("readArtistInfo........." + artist_no);
		return artistInfoRepository.readArtistInfo(artist_no);
	}
}
