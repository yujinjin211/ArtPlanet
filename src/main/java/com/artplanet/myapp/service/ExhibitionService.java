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
import com.artplanet.myapp.model.PageDTO;
import com.artplanet.myapp.model.ThemeVO;
import com.artplanet.myapp.model.ThumbnailVO;
import com.artplanet.myapp.model.UserLikeExhVO;

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
	public List<UserLikeExhVO> getLikeExh(String id) {
		log.info("getLikeExh.........");
		return exhibitionInfoRepository.getLikeExh(id);
	}
	
	@Override
	public void insertHeart(int exhibition_no, String id) {
		log.info("insertHeart.........");
		exhibitionInfoRepository.insertHeart(exhibition_no, id);
	}
	
	@Override
	public void deleteHeart(int exhibition_no, String id) {
		log.info("deleteHeart.........");
		exhibitionInfoRepository.deleteHeart(exhibition_no, id);
	}
}
