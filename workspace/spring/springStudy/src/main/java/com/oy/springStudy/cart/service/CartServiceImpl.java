package com.oy.springStudy.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.oy.springStudy.cart.model.dao.CartDAO;
import com.oy.springStudy.cart.model.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	CartDAO cartDao;
	
	@Override
	public List<CartDTO> getSelectAll() {
		return cartDao.getSelectAll();
	}

	@Override
	public CartDTO getSelectOne(CartDTO param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setInsert(CartDTO param) {
		return cartDao.setInsert(param);
	}

	@Override
	public int setUpdate(CartDTO param) {
		return cartDao.setUpdate(param);
	}

	@Override
	public int setDelete(CartDTO param) {
		return cartDao.setDelete(param);
	}
	
	@Override
	public int setAllClear() {
		return cartDao.setAllClear();
	}

}
