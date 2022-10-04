package com.oy.springStudy.member.model.dao;

import java.util.List;

import com.oy.springStudy.member.model.dto.MemberDTO;

public interface MemberDAO {
	public List<MemberDTO> getSelectAll();
	public MemberDTO getSelectOne(MemberDTO param);
	public int setInsert(MemberDTO param);
	public int setUpdate(MemberDTO param);
	public int setDelete(MemberDTO param);
	public int getLogin(MemberDTO param);
}