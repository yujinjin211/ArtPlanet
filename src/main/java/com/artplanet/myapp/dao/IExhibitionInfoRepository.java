package com.artplanet.myapp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.artplanet.myapp.model.Criteria;
import com.artplanet.myapp.model.ExhCriteria;
import com.artplanet.myapp.model.Exhibition_InfoVO;
import com.artplanet.myapp.model.JoinExhibitionThemeVO;
import com.artplanet.myapp.model.JoinExhibitionVO;
import com.artplanet.myapp.model.LikeListCriteria;
import com.artplanet.myapp.model.PageDTO;
import com.artplanet.myapp.model.ThemeVO;
import com.artplanet.myapp.model.ThumbnailVO;
import com.artplanet.myapp.model.TrendCriteria;
import com.artplanet.myapp.model.UserLikeExhVO;
import com.artplanet.myapp.model.WordCloudVO;

public interface IExhibitionInfoRepository {

	public List<Map<String, Object>> getAllExhibitionNo();	//map 컬렉션 형태로 전시 정보 읽어오기
	public Exhibition_InfoVO readDetail(int exhibition_no);	//전시 상세 정보 읽기
	public List<Exhibition_InfoVO> getExhListWithPaging(ExhCriteria cri);	//페이징 처리 된 전시 정보 읽어오기
	public List<JoinExhibitionVO> getJoinListWithPagingID(@Param("cri") ExhCriteria cri, @Param("id") String id); //페이징 처리 된 조인 전시 정보 읽어오기
	public List<JoinExhibitionVO> getJoinListWithPaging(@Param("cri") ExhCriteria cri); //페이징 처리 된 조인 전시 정보 읽어오기
	public int getTotalCount(ExhCriteria cri); //총 전시 정보 수
	
	public List<ThumbnailVO> getThumbnailList(int exhibition_no);	//썸네일 포스터 이미지 읽기
	public ThumbnailVO getThumbnail(int exhibition_no); //전시 상세 썸네일 이미지 읽기
	
	public List<JoinExhibitionVO> getRegionWithPaging(@Param("cri") ExhCriteria cri, @Param("sido") String sido); //페이징 처리 된 선택 지역 전시 정보 읽어오기
	public List<JoinExhibitionVO> getRegionWithPagingID(@Param("cri") ExhCriteria cri, @Param("sido") String sido, @Param("id") String id); //페이징 처리 된 선택 지역 전시 정보 읽어오기
	
	public List<JoinExhibitionThemeVO> getThemeWithPaging(@Param("cri") ExhCriteria cri, @Param("theme_no") String theme_no); //페이징 처리 된 선택 주제 전시 정보 읽어오기
	public List<JoinExhibitionThemeVO> getThemeWithPagingID(@Param("cri") ExhCriteria cri, @Param("theme_no") String theme_no, @Param("id") String id); //페이징 처리 된 선택 주제 전시 정보 읽어오기
	
	public List<ThemeVO> getThemeList(); //테마 리스트 읽어오기
	
	public List<JoinExhibitionVO> getMainList(); //일정 개수의 최신 전시 정보 읽어오기
	public List<JoinExhibitionVO> getLikeCount4(); //좋아요 수 상위 4개 전시 정보 읽어오기
	public List<JoinExhibitionVO> getLikeCount4withID(String id); //좋아요 수 상위 4개 전시 정보 읽어오기 with ID
	public List<WordCloudVO> createWordCloud(); //워드클라우드용 테마 데이터 읽어오기
	public List<JoinExhibitionThemeVO> getKeywordWithPaging(@Param("cri") TrendCriteria cri, @Param("theme_name_kor") String theme_name_kor);
	public List<JoinExhibitionThemeVO> getKeywordWithPagingID(@Param("cri") TrendCriteria cri, @Param("theme_name_kor") String theme_name_kor, @Param("id") String id);
	public int getTotalCount(TrendCriteria cri); //트렌드 총 전시 정보 수
	
	public List<UserLikeExhVO> getLikeExh(String id); //회원의 좋아요 리스트 읽어오기
	public void insertHeart(@Param("exhibition_no") int exhibition_no, @Param("id") String id); //좋아요 on
	public void deleteHeart(@Param("exhibition_no") int exhibition_no, @Param("id") String id); //좋아요 off
	public void upLikeCount(int exhibition_no); //해당 전시 좋아요 카운트 up
	public void downLikeCount(int exhibition_no); //해당 전시 좋아요 카운트 down
	public int getTotalCount(LikeListCriteria cri); //마이페이지-관심 전시 목록 총 전시 정보 수
	public List<JoinExhibitionVO> getLikeListWithPagingID(@Param("cri") LikeListCriteria cri, @Param("id") String id); //페이징 처리 된 조인 전시 정보 읽어오기
}
