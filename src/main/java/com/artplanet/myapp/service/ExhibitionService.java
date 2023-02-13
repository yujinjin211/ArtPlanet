package com.artplanet.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.IExhibitionInfoRepository;
import com.artplanet.myapp.dao.IThumbnailRepository;
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
import com.artplanet.myapp.model.UserVisitExhVO;
import com.artplanet.myapp.model.WordCloudVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ExhibitionService implements IExhibitionService {

	@Setter(onMethod_ = @Autowired)
	IExhibitionInfoRepository exhibitionInfoRepository;
	
	@Setter(onMethod_ = @Autowired)
	IThumbnailRepository thumbnailRepository;
	
	@Override
	public List<Map<String, Object>> getAllExhibitionNo() {
		log.info("getAllExhibitionNo.........");
		return exhibitionInfoRepository.getAllExhibitionNo();
	}
	
	@Override
	public Exhibition_InfoVO readDetail(int exhibition_no) {
		log.info("readDetail........." + exhibition_no);
		return exhibitionInfoRepository.readDetail(exhibition_no);
	}
	
	@Override
	public List<Exhibition_InfoVO> getExhListWithPaging(ExhCriteria cri) {
		log.info("getExhListWithPaging.........");
		return exhibitionInfoRepository.getExhListWithPaging(cri);
	}
	
	@Override
	public int getTotalCount(ExhCriteria cri) {
		log.info("getTotalCount" + cri);
		log.info(exhibitionInfoRepository.getTotalCount(cri));
		return exhibitionInfoRepository.getTotalCount(cri);
	}
	
	@Override
	public List<ThumbnailVO> getThumbnailList(int exhibition_no) {
		log.info("get Thumbnail List by exhibition_no : " + exhibition_no);
		return thumbnailRepository.findByExhibitionNo(exhibition_no);
	}
	
	@Override
	public ThumbnailVO getThumbnail(int exhibition_no) {
		log.info("get Thumbnail........." + exhibition_no);
		return thumbnailRepository.getThumbnail(exhibition_no);
	}
	
	@Override
	public List<JoinExhibitionVO> getJoinListWithPagingID(ExhCriteria cri, String id) {
		log.info("getJoinListWithPagingID......... pageNum : " + cri.getPageNum() + ", amount : " + cri.getAmount() + ", ID : " + id);
		return exhibitionInfoRepository.getJoinListWithPagingID(cri, id);
	}
	
	@Override
	public List<JoinExhibitionVO> getJoinListWithPaging(ExhCriteria cri) {
		log.info("getJoinListWithPaging......... pageNum : " + cri.getPageNum() + ", amount : " + cri.getAmount());
		return exhibitionInfoRepository.getJoinListWithPaging(cri);
	}
	
	@Override
	public List<JoinExhibitionVO> getRegionWithPaging(ExhCriteria cri, String sido) {
		log.info("cri : " + cri + ", sido : " + sido);
		return exhibitionInfoRepository.getRegionWithPaging(cri, sido);
	}
	
	@Override
	public List<JoinExhibitionVO> getRegionWithPagingID(ExhCriteria cri, String sido, String id) {
		log.info("cri : " + cri + ", sido : " + sido + ", ID : " + id);
		return exhibitionInfoRepository.getRegionWithPagingID(cri, sido, id);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getThemeWithPaging(ExhCriteria cri, String theme_no) {
		log.info("cri : " + cri + ", theme_no : " + theme_no);
		return exhibitionInfoRepository.getThemeWithPaging(cri, theme_no);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getThemeWithPagingID(ExhCriteria cri, String theme_no, String id) {
		log.info("cri : " + cri + ", theme_no : " + theme_no + ", ID : " + id);
		return exhibitionInfoRepository.getThemeWithPagingID(cri, theme_no, id);
	}
	
	@Override
	public List<ThemeVO> getThemeList() {
		log.info("get Theme List.........");
		return exhibitionInfoRepository.getThemeList();
	}
	
	@Override
	public List<JoinExhibitionVO> getMainList() {
		log.info("getMainList.........");
		return exhibitionInfoRepository.getMainList();
	}
	
	@Override
	public List<JoinExhibitionVO> getLikeCount4() {
		log.info("getLikeCount4.........");
		return exhibitionInfoRepository.getLikeCount4();
	}
	
	@Override
	public List<JoinExhibitionVO> getLikeCount4withID(String id) {
		log.info("getLikeCount4 with ID : " + id);
		return exhibitionInfoRepository.getLikeCount4withID(id);
	}
	
	@Override
	public List<WordCloudVO> createWordCloud() {
		log.info("create word cloud.........");
		return exhibitionInfoRepository.createWordCloud();
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getKeywordWithPaging(TrendCriteria cri, String theme_name_kor) {
		log.info("getKeywordWithPaging.........cri : " + cri + ", theme_name_kor : " + theme_name_kor);
		return exhibitionInfoRepository.getKeywordWithPaging(cri, theme_name_kor);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getKeywordWithPagingID(TrendCriteria cri, String theme_name_kor, String id) {
		log.info("getKeywordWithPagingID.........ID : " + id + ", cri : " + cri + ", theme_name_kor : " + theme_name_kor);
		return exhibitionInfoRepository.getKeywordWithPagingID(cri, theme_name_kor, id);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getNotKeywordWithPaging(TrendCriteria cri) {
		log.info("getNotKeywordWithPaging.........cri : " + cri);
		return exhibitionInfoRepository.getNotKeywordWithPaging(cri);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getNotKeywordWithPagingID(TrendCriteria cri, String id) {
		log.info("getNotKeywordWithPagingID.........ID : " + id + ", cri : " + cri);
		return exhibitionInfoRepository.getNotKeywordWithPagingID(cri, id);
	}
	
	@Override
	public int getTotalCount(TrendCriteria cri) {
		log.info("cri : " + cri);
		return exhibitionInfoRepository.getTotalCount(cri);
	}
	
	@Override
	public List<UserLikeExhVO> getLikeExh(String id) {
		log.info("getLikeExh.........");
		return exhibitionInfoRepository.getLikeExh(id);
	}
	
	@Override
	public void insertHeart(int exhibition_no, String id) {
		log.info("insertHeart.........");
		exhibitionInfoRepository.insertHeart(exhibition_no, id);
		exhibitionInfoRepository.upLikeCount(exhibition_no);
	}
	
	@Override
	public void deleteHeart(int exhibition_no, String id) {
		log.info("deleteHeart.........");
		exhibitionInfoRepository.deleteHeart(exhibition_no, id);
		exhibitionInfoRepository.downLikeCount(exhibition_no);
	}
	
	@Override
	public void upLikeCount(int exhibition_no) {
		log.info("Up Like count.........");
		exhibitionInfoRepository.upLikeCount(exhibition_no);
	}
	
	@Override
	public void downLikeCount(int exhibition_no) {
		log.info("Down Like count.........");
		exhibitionInfoRepository.downLikeCount(exhibition_no);
	}
	
	@Override
	public int getTotalCount(LikeListCriteria cri) {
		log.info("cri : " + cri);
		return exhibitionInfoRepository.getTotalCount(cri);
	}
	
	@Override
	public List<JoinExhibitionVO> getLikeListWithPagingID(LikeListCriteria cri, String id) {
		log.info("getLikeListWithPagingID......ID : " + id + ", cri : " + cri);
		return exhibitionInfoRepository.getLikeListWithPagingID(cri, id);
	}
	
	@Override
	public List<UserVisitExhVO> getVisitExh(String id) {
		return exhibitionInfoRepository.getVisitExh(id);
	}
	
	@Override
	public void insertVisit(int exhibition_no, String id) {
		log.info("insertVisit.........");
		exhibitionInfoRepository.insertVisit(exhibition_no, id);
		exhibitionInfoRepository.upVisitCount(exhibition_no);
	}
	
	@Override
	public void deleteVisit(int exhibition_no, String id) {
		log.info("deleteVisit");
		exhibitionInfoRepository.deleteVisit(exhibition_no, id);
		exhibitionInfoRepository.downVisitCount(exhibition_no);
	}
	
	@Override
	public void upVisitCount(int exhibition_no) {
		log.info("upVisitCount.........");
		exhibitionInfoRepository.upVisitCount(exhibition_no);
	}
	
	@Override
	public void downVisitCount(int exhibition_no) {
		log.info("downVisitCount.........");
		exhibitionInfoRepository.downVisitCount(exhibition_no);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getVisitWithDate(TrendCriteria cri, String id, String visitDate) {
		log.info("getVisitWithDate......... ID : " + id + ", visitDate : " + visitDate);
		return exhibitionInfoRepository.getVisitWithDate(cri, id, visitDate);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getVisitExhAllDate(TrendCriteria cri, String id) {
		log.info("getVisitExhAllDate......... ID : " + id + ", cri : " + cri);
		return exhibitionInfoRepository.getVisitExhAllDate(cri, id);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getExhibitionDetail(int exhibition_no) {
		log.info("getExhibitionDetail.........exhibition_no : " + exhibition_no);
		return exhibitionInfoRepository.getExhibitionDetail(exhibition_no);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getExhibitionDetailWithID(int exhibition_no, String id) {
		log.info("getExhibitionDetailWithID.........ID : " + id + ", exhibition_no : " + exhibition_no);
		return exhibitionInfoRepository.getExhibitionDetailWithID(exhibition_no, id);
	}
	
	@Override
	public List<JoinExhibitionThemeVO> getExhibitionMypage(String[] exhibition_no_arr) {
		log.info("getExhibitionMyPage........." + exhibition_no_arr.toString());
		return exhibitionInfoRepository.getExhibitionMypage(exhibition_no_arr);
	}
	
}
