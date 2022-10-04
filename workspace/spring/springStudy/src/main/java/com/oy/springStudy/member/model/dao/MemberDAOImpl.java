package com.oy.springStudy.member.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oy.springStudy.member.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> getSelectAll() {
		return sqlSession.selectList("member.getSelectAll");
	}

	@Override
	public MemberDTO getSelectOne(MemberDTO param) {
		return sqlSession.selectOne("member.getSelectOne", param);
	}

	@Override
	public int setInsert(MemberDTO param) {
		return sqlSession.insert("member.setInsert", param);
	}

	@Override
	public int setUpdate(MemberDTO param) {
		return sqlSession.update("member.setUpdate", param);
	}

	@Override
	public int setDelete(MemberDTO param) {
		return sqlSession.delete("member.setDelete", param);
	}
	
	@Override
	public int getLogin(MemberDTO param) {
		int result = 0;
		if(sqlSession.selectOne("member.getLogin", param) != null) {
			return sqlSession.selectOne("member.getLogin", param);
		}
		return result;
	}

}