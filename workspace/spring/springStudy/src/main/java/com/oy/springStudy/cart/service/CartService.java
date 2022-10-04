package com.oy.springStudy.cart.service;

import java.util.List;

import com.oy.springStudy.cart.model.dto.CartDTO;

public interface CartService {
	
	public List<CartDTO> getSelectAll();
	public CartDTO getSelectOne(CartDTO param);
	public int setInsert(CartDTO param);
	public int setUpdate(CartDTO param);
	public int setDelete(CartDTO param);
	public int setAllClear();
}
