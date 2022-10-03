package com.oy.springStudy.memo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.oy.springStudy.memo.model.dao.MemoDAO;
import com.oy.springStudy.memo.model.dto.MemoDTO;

@Service
public class MemoServiceImpl implements MemoService {

	@Inject
	MemoDAO memoDao;
	
	@Override
	public List<MemoDTO> getSelectAll() {
		return memoDao.getSelectAll();
	}

	@Override
	public MemoDTO getSelectOne(MemoDTO param) {
		return memoDao.getSelectOne(param);
	}

	@Override
	public int setInsert(MemoDTO param) {
		return memoDao.setInsert(param);
	}

	@Override
	public int setUpdate(MemoDTO param) {
		return memoDao.setUpdate(param);
	}

	@Override
	public int setDelete(MemoDTO param) {
		return memoDao.setDelete(param);
	}
	
	
}
