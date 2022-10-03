package com.oy.springStudy.memo.model.dao;

import java.util.List;

import com.oy.springStudy.member.model.dto.MemberDTO;
import com.oy.springStudy.memo.model.dto.MemoDTO;


public interface MemoDAO {
	public List<MemoDTO> getSelectAll();
	public MemoDTO getSelectOne(MemoDTO param);
	public int setInsert(MemoDTO param);
	public int setUpdate(MemoDTO param);
	public int setDelete(MemoDTO param);

}
