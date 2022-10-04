package com.oy.springStudy.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.oy.springStudy.product.model.dao.ProductDAO;
import com.oy.springStudy.product.model.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO productDao;
	
	@Override
	public List<ProductDTO> getSelectAll() {
		return productDao.getSelectAll();
	}

	@Override
	public ProductDTO getSelectOne(ProductDTO param) {
		return productDao.getSelectOne(param);
	}

	@Override
	public int setInsert(ProductDTO param) {
		return productDao.setInsert(param);
	}

	@Override
	public int setUpdate(ProductDTO param) {
		return productDao.setUpdate(param);
	}

	@Override
	public int setDelete(ProductDTO param) {
		return productDao.setDelete(param);
	}
}