package com.oy.springStudy.guestBook.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oy.springStudy.guestBook.model.dto.GuestBookDTO;

@Repository
public class GuestBookDAOImpl implements GuestBookDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<GuestBookDTO> getSelectAll() {
		return sqlSession.selectList("guestBook.getSelectAll");
	}

	@Override
	public GuestBookDTO getSelectOne(GuestBookDTO param) {
		return sqlSession.selectOne("guestBook.getSelectOne", param);
	}

	@Override
	public int setInsert(GuestBookDTO param) {
		return sqlSession.insert("guestBook.setInsert", param);
	}

	@Override
	public int setUpdate(GuestBookDTO param) {
		return sqlSession.update("guestBook.setUpdate", param);
	}

	@Override
	public int setDelete(GuestBookDTO param) {
		return sqlSession.delete("guestBook.setDelete", param);
	}

}
