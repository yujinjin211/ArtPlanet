package com.artplanet.myapp.service;

import com.artplanet.myapp.model.Artist_InfoVO;

public interface IArtistInfoService {
	
	public Artist_InfoVO readArtistInfo(int artist_no); //작가 정보 읽기

}
