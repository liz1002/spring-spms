package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.Criteria;
import com.khrd.domain.SpmsVO;

public interface SpmsDAO {
	public List<SpmsVO> list(Criteria cri);
	public SpmsVO selectByNo(int no);
	public void insert(SpmsVO vo);
	public void update(SpmsVO vo);	
	public void delete(int no); 
	public int listCount();
}
