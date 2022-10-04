package com.oy.springStudy.memo.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oy.springStudy.memo.model.dto.MemoDTO;

@Repository
public class MemoDAOImpl implements MemoDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemoDTO> getSelectAll() {
		return sqlSession.selectList("memo.getSelectAll");
	}

	@Override
	public MemoDTO getSelectOne(MemoDTO param) {
		return sqlSession.selectOne("memo.getSelectOne", param);
	}

	@Override
	public int setInsert(MemoDTO param) {
		return sqlSession.insert("memo.setInsert", param);
	}

	@Override
	public int setUpdate(MemoDTO param) {
		return sqlSession.update("memo.setUpdate", param);
	}

	@Override
	public int setDelete(MemoDTO param) {
		return sqlSession.delete("memo.setDelete", param);
	}

}