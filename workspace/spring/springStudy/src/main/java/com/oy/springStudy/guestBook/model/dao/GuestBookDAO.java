package com.oy.springStudy.guestBook.model.dao;

import java.util.List;

import com.oy.springStudy.guestBook.model.dto.GuestBookDTO;

public interface GuestBookDAO {
	public List<GuestBookDTO> getSelectAll();
	public GuestBookDTO getSelectOne(GuestBookDTO param);
	public int setInsert(GuestBookDTO param);
	public int setUpdate(GuestBookDTO param);
	public int setDelete(GuestBookDTO param);
}
