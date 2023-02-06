package com.artplanet.myapp.service;

import java.util.List;

import com.artplanet.myapp.model.CommentCriteria;
import com.artplanet.myapp.model.CommentVO;

public interface ICommentService {
	
	public int register(CommentVO comment);
	public CommentVO get(int comment_no);
	public int modify(CommentVO comment);
	public int remove(int comment_no);
	public List<CommentVO> getList(CommentCriteria cri, int review_no);
	
}
