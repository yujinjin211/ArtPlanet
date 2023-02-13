package com.artplanet.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.artplanet.myapp.dao.INoticeRepository;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeService implements INoticeService {

	@Setter(onMethod_ = @Autowired)
	INoticeRepository noticeRepository;
	
	
}
