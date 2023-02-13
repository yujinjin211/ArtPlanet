package com.artplanet.myapp.controller;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.UserException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.artplanet.myapp.model.Artist_InfoVO;
import com.artplanet.myapp.model.ExhCriteria;
import com.artplanet.myapp.model.ExhibitionImageVO;
import com.artplanet.myapp.model.ExhibitionThemeVO;
import com.artplanet.myapp.model.Exhibition_InfoVO;
import com.artplanet.myapp.model.JoinExhibitionThemeVO;
import com.artplanet.myapp.model.JoinExhibitionVO;
import com.artplanet.myapp.model.PageDTO;
import com.artplanet.myapp.model.Place_InfoVO;
import com.artplanet.myapp.model.ReviewImageVO;
import com.artplanet.myapp.model.ThemeVO;
import com.artplanet.myapp.model.ThumbnailVO;
import com.artplanet.myapp.model.TrendCriteria;
import com.artplanet.myapp.model.UserInfoVO;
import com.artplanet.myapp.model.UserLikeExhVO;
import com.artplanet.myapp.model.UserVisitExhVO;
import com.artplanet.myapp.model.WordCloudVO;
import com.artplanet.myapp.service.IArtistInfoService;
import com.artplanet.myapp.service.IExhImageService;
import com.artplanet.myapp.service.IExhibitionService;
import com.artplanet.myapp.service.IPlaceInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RequestMapping("/exhibition/*")
@Controller
public class ExhibitionController {

	@Autowired
	IExhibitionService exhibitionService;
	
	@Autowired
	IArtistInfoService artistInfoService;
	
	@Autowired
	IPlaceInfoService placeInfoService;
	
	@Autowired
	IExhImageService exhImageService;
	
	//지역별 전시정보 목록 조회
	@GetMapping("/region-exhibition")
	public void regionExhibition(ExhCriteria cri, Model model, HttpSession session) {
		int total = exhibitionService.getTotalCount(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		
		//비회원일때
		if(session.getAttribute("user") == null) {
			List<JoinExhibitionVO> exhList = exhibitionService.getJoinListWithPaging(cri);
			model.addAttribute("exhList", exhList);
		} else { //회원일때
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			log.info("user info : " + userInfo.getId());
			List<JoinExhibitionVO> exhList = exhibitionService.getJoinListWithPagingID(cri, userInfo.getId());
			model.addAttribute("exhList", exhList);
		}
	}
	
	//주제별 전시정보 목록 조회
	@GetMapping("/theme-exhibition")
	public void themeExhibition(ExhCriteria cri, Model model, HttpSession session) {
		int total = exhibitionService.getTotalCount(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		List<ThemeVO> themeList = exhibitionService.getThemeList();
		model.addAttribute("themeList", themeList);
		
		//비회원일때
		if(session.getAttribute("user") == null) {
			List<JoinExhibitionVO> exhList = exhibitionService.getJoinListWithPaging(cri);
			model.addAttribute("exhList", exhList);
		} else { //회원일때
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			log.info("user info : " + userInfo.getId());
			List<JoinExhibitionVO> exhList = exhibitionService.getJoinListWithPagingID(cri, userInfo.getId());
			model.addAttribute("exhList", exhList);
		}
	}
	
	//현재위치별 전시정보 목록 조회
	@GetMapping("/location-exhibition")
	public void locationExhibition(ExhCriteria cri, Model model, HttpSession session) {
		int total = exhibitionService.getTotalCount(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		List<ThemeVO> themeList = exhibitionService.getThemeList();
		model.addAttribute("themeList", themeList);
		
		//비회원일때
		if(session.getAttribute("user") == null) {
			List<JoinExhibitionVO> exhList = exhibitionService.getJoinListWithPaging(cri);
			model.addAttribute("exhList", exhList);
		} else { //회원일때
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			log.info("user info : " + userInfo.getId());
			List<JoinExhibitionVO> exhList = exhibitionService.getJoinListWithPagingID(cri, userInfo.getId());
			model.addAttribute("exhList", exhList);
		}
	}
	
	//트렌드별 전시정보 목록 조회
	@GetMapping("/trend-exhibition")
	public void trendExhibition(TrendCriteria cri, String theme_name_kor, Model model, HttpSession session) {
		int total = exhibitionService.getTotalCount(cri);
		log.info("total : " + total);
		
		PageDTO pageMaker = new PageDTO(cri, total);
		log.info("pageMaker : " + pageMaker );
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("likeList", exhibitionService.getLikeCount4());
		
		//비회원일때
		if(session.getAttribute("user") == null) {
			List<JoinExhibitionVO> likeList = exhibitionService.getLikeCount4();
			model.addAttribute("likeList", likeList);
			if(theme_name_kor != null) {
				log.info("theme_name_kor != null");
				List<JoinExhibitionThemeVO> exhList = exhibitionService.getKeywordWithPaging(cri, theme_name_kor);
				log.info(exhList);
				model.addAttribute("exhList", exhList);
			}
			//비회원이고 theme_name_kor 검색 조건이 없을 때
			log.info("theme_name_kor == null");
			List<JoinExhibitionThemeVO> exhList = exhibitionService.getNotKeywordWithPaging(cri);
			log.info(exhList);
			model.addAttribute("exhList", exhList);
			
		} else { //회원일때
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			log.info("user info : " + userInfo.getId());
			List<JoinExhibitionVO> likeList = exhibitionService.getLikeCount4withID(userInfo.getId());
			model.addAttribute("likeList", likeList);
			if(theme_name_kor != null) {
				log.info("theme_name_kor != null");
				List<JoinExhibitionThemeVO> exhList = exhibitionService.getKeywordWithPagingID(cri, theme_name_kor, userInfo.getId());
				log.info(exhList);
				model.addAttribute("exhList", exhList);
			}
			//theme_name_kor 검색 조건이 없을 때
			log.info("theme_name_kor == null");
			List<JoinExhibitionThemeVO> exhList = exhibitionService.getNotKeywordWithPagingID(cri, userInfo.getId());
			model.addAttribute("exhList", exhList);
		}
		List<WordCloudVO> jsonList = exhibitionService.createWordCloud();
		model.addAttribute("jsonList", jsonList);
	}
	
	//전시 상세 조회
	@GetMapping("/exhibition-detail")
	public String detailExhibition(int exhibition_no, Model model, HttpSession session){
		Exhibition_InfoVO exhibition = exhibitionService.readDetail(exhibition_no);
		log.info("exhibition detail : " + exhibition);
		
		List<ExhibitionImageVO> exhImageList = exhImageService.getExhImageList(exhibition_no);
		log.info("exhImageList : " + exhImageList);
		
		model.addAttribute("exhibition_no", exhibition_no);
		model.addAttribute("detail", exhibition);
		model.addAttribute("exhImageList", exhImageList);
		
		if(session.getAttribute("user") != null) {
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			List<JoinExhibitionThemeVO> exhList = exhibitionService.getExhibitionDetailWithID(exhibition_no, userInfo.getId());
			log.info("exhList : " + exhList);
			model.addAttribute("exhList", exhList);
			
		} else {
			List<JoinExhibitionThemeVO> exhList = exhibitionService.getExhibitionDetail(exhibition_no);
			log.info("exhList : " + exhList);
			model.addAttribute("exhList", exhList);
		}
		
		return "exhibition/exhibition-detail";
	}
	
	//JSON 작가 정보 읽기
	@GetMapping(value = "/getArtistInfo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Artist_InfoVO> getArtistInfo(int artist_no) {
		log.info("getArtistInfo : " + artist_no);
		
		return new ResponseEntity<>(artistInfoService.readArtistInfo(artist_no), HttpStatus.OK);
	}
	
	//JSON 장소 정보 읽기
	@GetMapping(value = "/getPlaceInfo", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Place_InfoVO> getPlaceInfo(int place_no) {
		log.info("getPlaceInfo : " + place_no);
		return new ResponseEntity<>(placeInfoService.readPlaceInfo(place_no), HttpStatus.OK);
	}
	
	//첨부한 이미지 읽기
	@GetMapping(value = "/getThumbnail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<ThumbnailVO> getThumbnail(int exhibition_no) {
		log.info("getThumbnail : " + exhibition_no);
		return new ResponseEntity<>(exhibitionService.getThumbnail(exhibition_no), HttpStatus.OK);
	}
	
	//지역 셀렉트박스 선택 Ajax
	@PostMapping(value = "/region-exhibition")
	@ResponseBody
	public ResponseEntity<List<JoinExhibitionVO>> getRegionExhibitionList(ExhCriteria cri, String sido, HttpSession session) {
		log.info("sido : " + sido);
		
		//비회원일때
		if(session.getAttribute("user") == null) {
			return new ResponseEntity<>(exhibitionService.getRegionWithPaging(cri, sido), HttpStatus.OK);
		} else { //회원일때
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			String id = userInfo.getId();
			log.info("user info : " + id);
			return new ResponseEntity<>(exhibitionService.getRegionWithPagingID(cri, sido, id), HttpStatus.OK);
		}
	}
	
	//주제 셀렉트박스 선택 Ajax
	@PostMapping(value = "/theme-exhibition")
	@ResponseBody
	public ResponseEntity<List<JoinExhibitionThemeVO>> getThemeExhibitionList(ExhCriteria cri, String theme_no, HttpSession session) {
		log.info("theme_no : " + theme_no);
		
		//비회원일때
		if(session.getAttribute("user") == null) {
			return new ResponseEntity<>(exhibitionService.getThemeWithPaging(cri, theme_no), HttpStatus.OK);
		} else { //회원일때
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			String id = userInfo.getId();
			log.info("user info : " + id);
			return new ResponseEntity<>(exhibitionService.getThemeWithPagingID(cri, theme_no, id), HttpStatus.OK);
		}
	}
	
	//워드클라우드 키워드 선택 Ajax
	@PostMapping(value = "/KeyWordExhibition")
	@ResponseBody
	public ResponseEntity<List<JoinExhibitionThemeVO>> getKeywordExhibitionList(TrendCriteria cri, String theme_name_kor, HttpSession session) {
		log.info("theme_name_kor : " + theme_name_kor);
		
		//비회원일때
		if(session.getAttribute("user") == null) {
			return new ResponseEntity<>(exhibitionService.getKeywordWithPaging(cri, theme_name_kor), HttpStatus.OK);
		} else { //회원일때
			UserInfoVO userInfo = (UserInfoVO)session.getAttribute("user");
			String id = userInfo.getId();
			log.info("user info : " + id);
			return new ResponseEntity<>(exhibitionService.getKeywordWithPagingID(cri, theme_name_kor, id), HttpStatus.OK);
		}
	}
	
	//좋아요
	@PostMapping("/insertHeart")
	@ResponseBody
	public ResponseEntity<List<UserLikeExhVO>> insertHeart(int exhibition_no, String id) {
		log.info("insertHeart.........");
		exhibitionService.insertHeart(exhibition_no, id);
		return new ResponseEntity<>(exhibitionService.getLikeExh(id), HttpStatus.OK);
	}
	
	@PostMapping("/deleteHeart")
	@ResponseBody
	public ResponseEntity<List<UserLikeExhVO>> deleteHeart(int exhibition_no, String id) {
		log.info("deleteHeart.........");
		exhibitionService.deleteHeart(exhibition_no, id);
		return new ResponseEntity<>(exhibitionService.getLikeExh(id), HttpStatus.OK);
	}
	
	//다녀왔어요
	@PostMapping("/insertVisit")
	@ResponseBody
	public ResponseEntity<List<UserVisitExhVO>> insertVisit(int exhibition_no, String id) {
		log.info("insertVisit.........");
		exhibitionService.insertVisit(exhibition_no, id);
		return new ResponseEntity<>(exhibitionService.getVisitExh(id), HttpStatus.OK);
	}
	
	@PostMapping("/deleteVisit")
	@ResponseBody
	public ResponseEntity<List<UserVisitExhVO>> deleteVisit(int exhibition_no, String id) {
		log.info("insertVisit.........");
		exhibitionService.deleteVisit(exhibition_no, id);
		return new ResponseEntity<>(exhibitionService.getVisitExh(id), HttpStatus.OK);
	}
	
	@PostMapping("/selectVisit")
	@ResponseBody
	public ResponseEntity<List<JoinExhibitionThemeVO>> selectVisit(TrendCriteria cri, String visitDate, String id) {
		log.info("selectVisit.........");
		return new ResponseEntity<>(exhibitionService.getVisitWithDate(cri, id, visitDate), HttpStatus.OK);
	}
	
	
}
