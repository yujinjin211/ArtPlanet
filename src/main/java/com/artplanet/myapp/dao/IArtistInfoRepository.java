package com.artplanet.myapp.dao;

import com.artplanet.myapp.model.Artist_InfoVO;

public interface IArtistInfoRepository {
	
	public Artist_InfoVO readArtistInfo(int artist_no); //작가 정보 읽기

}
