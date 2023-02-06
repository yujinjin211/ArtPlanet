package com.artplanet.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.artplanet.myapp.model.CommentCriteria;
import com.artplanet.myapp.model.CommentVO;

public interface ICommentRepository {
	
	public int insert(CommentVO comment);
	public CommentVO read(int comment_no);
	public int delete(int comment_no);
	public int update(CommentVO comment);
	public List<CommentVO> getListWithPaging(CommentCriteria cri, @Param("review_no") int review_no);

}
