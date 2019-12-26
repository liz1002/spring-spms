package com.khrd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.Criteria;
import com.khrd.domain.SpmsVO;

@Repository
public class SpmsDAOImpl implements SpmsDAO{
	private final static String namespace="mappers.SpmsMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<SpmsVO> list(Criteria cri) {
		return sqlSession.selectList(namespace + ".list", cri);
	}

	@Override
	public SpmsVO selectByNo(int no) {
		return sqlSession.selectOne(namespace + ".selectByNo", no);
	}

	@Override
	public void insert(SpmsVO vo) {
		sqlSession.insert(namespace + ".insert", vo);
	}

	@Override
	public void update(SpmsVO vo) {
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete(namespace + ".delete", no);
	}

	@Override
	public int listCount() {
		return sqlSession.selectOne(namespace + ".listCount");
	}

}
