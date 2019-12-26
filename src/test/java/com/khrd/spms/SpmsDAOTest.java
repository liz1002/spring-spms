package com.khrd.spms;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.Criteria;
import com.khrd.domain.SpmsVO;
import com.khrd.persistence.SpmsDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SpmsDAOTest {
	@Autowired
	private SpmsDAO dao;
	
//	@Test
	public void testInsert() {
		dao.insert(new SpmsVO(0, "프로젝트명", "프로젝트내용", new Date(2019-1900,10,23), new Date(2019-1900,11,30), "진행중"));
	}
	
//	@Test
	public void testList() {
		dao.list(new Criteria(2, 5));
	}
	
//	@Test
	public void testSelectByNo() {
		dao.selectByNo(1);
	}
	
//	@Test
	public void testListCount() {
		dao.listCount();
	}
	
	@Test
	public void testUpdate(){
		dao.update(new SpmsVO(11, "프로젝트 수정 테스트", "프로젝트 수정 테스트입니다", new Date(), new Date(), "진행중"));
	}
	
//	@Test
	public void testDelete(){
		dao.delete(11);
	}
	
	
}
