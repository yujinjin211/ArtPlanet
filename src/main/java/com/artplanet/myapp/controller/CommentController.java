package com.artplanet.myapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.artplanet.myapp.model.CommentCriteria;
import com.artplanet.myapp.model.CommentVO;
import com.artplanet.myapp.model.Criteria;
import com.artplanet.myapp.model.PageDTO;
import com.artplanet.myapp.service.ICommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	ICommentService commentService;
	
	//댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody CommentVO comment) {
		log.info("CommentVO : " + comment);
		int insertCount = commentService.register(comment);
		log.info("Comment insert count : " + insertCount);
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		//삼항 연산자 처리
	}
	
	//특정 게시물의 댓글 목록 확인
	//ex) http://localhost:8181/comment/pages/58/1
	@GetMapping(value = "/pages/{review_no}/{page}", 
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<CommentVO>> getList(@PathVariable("page") int page, 
													@PathVariable("review_no") int review_no) {
		log.info("getList.........");
		CommentCriteria cri = new CommentCriteria(page, 10);
		log.info("cri : " + cri + " review_no :" + review_no);
		return new ResponseEntity<>(commentService.getList(cri, review_no), HttpStatus.OK);
	}
	
	//댓글조회
	@GetMapping(value = "/{comment_no}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
													MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<CommentVO> get(@PathVariable("comment_no") int comment_no) {
		log.info("get : " + comment_no);
		return new ResponseEntity<>(commentService.get(comment_no), HttpStatus.OK);
	}
	
	//댓글삭제
	@GetMapping(value = "/{comment_no}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("comment_no") int comment_no) {
		log.info("remove : " + comment_no);
		return commentService.remove(comment_no) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글수정
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
					value = "/{comment_no}", consumes = "application/json",
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody CommentVO comment, @PathVariable("comment_no") int comment_no){
		comment.setComment_no(comment_no);
		log.info("comment_no : " + comment_no);
		return commentService.modify(comment) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
