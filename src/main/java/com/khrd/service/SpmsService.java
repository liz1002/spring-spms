package com.khrd.service;

import java.util.List;

import com.khrd.domain.Criteria;
import com.khrd.domain.SpmsVO;

public interface SpmsService {
	public List<SpmsVO> list(Criteria cri);
	public SpmsVO read(int no);
	public void regist(SpmsVO vo);
	public void modify(SpmsVO vo);	
	public void remove(int no); 
	public int listCount();
}
