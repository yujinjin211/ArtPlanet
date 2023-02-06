package com.artplanet.myapp.mapper;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.artplanet.myapp.model.UserInfoVO;
import com.artplanet.myapp.service.IUserInfoService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private IUserInfoService userInfoService;
	
	@Inject
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testFactory() {
		System.out.println(sqlSessionFactory);
	}
	
	@Test
	public void testSession() {
		try(SqlSession session = sqlSessionFactory.openSession()) {
			System.out.println(session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testLoginCheck() {
		UserInfoVO user = new UserInfoVO();
		user.setId("normar001");
		user.setPassword("Aabc1234!");
		userInfoService.loginCheck(user);
		log.info("회원 아이디 : " + user.toString());
	}

}
