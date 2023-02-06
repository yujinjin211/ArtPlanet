package com.artplanet.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.ICommentRepository;
import com.artplanet.myapp.model.CommentCriteria;
import com.artplanet.myapp.model.CommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class CommentService implements ICommentService {
	
	@Autowired
	ICommentRepository commentRepository;

	@Override
	public int register(CommentVO comment) {
		log.info("register........." + comment);
		return commentRepository.insert(comment);
	}
	
	@Override
	public CommentVO get(int comment_no) {
		log.info("get........." + comment_no);
		return commentRepository.read(comment_no);
	}
	
	@Override
	public int modify(CommentVO comment) {
		log.info("modify........." + comment);
		return commentRepository.update(comment);
	}
	
	@Override
	public int remove(int comment_no) {
		log.info("remove........." + comment_no);
		return commentRepository.delete(comment_no);
	}
	
	@Override
	public List<CommentVO> getList(CommentCriteria cri, int review_no) {
		log.info("get comment list a review........." + review_no);
		return commentRepository.getListWithPaging(cri, review_no);
	}
}
