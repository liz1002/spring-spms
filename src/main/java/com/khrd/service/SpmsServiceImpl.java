package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.Criteria;
import com.khrd.domain.SpmsVO;
import com.khrd.persistence.SpmsDAO;

@Service
public class SpmsServiceImpl implements SpmsService{

	@Autowired
	private SpmsDAO dao;

	@Override
	public List<SpmsVO> list(Criteria cri) {
		return dao.list(cri);
	}

	@Override
	public SpmsVO read(int no) {
		return dao.selectByNo(no);
	}

	@Override
	public void regist(SpmsVO vo) {
		dao.insert(vo);
	}

	@Override
	public void modify(SpmsVO vo) {
		dao.update(vo);
	}

	@Override
	public void remove(int no) {
		dao.delete(no);
	}

	@Override
	public int listCount() {
		return dao.listCount();
	}

}
