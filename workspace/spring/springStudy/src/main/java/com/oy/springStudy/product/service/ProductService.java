package com.oy.springStudy.product.service;

import java.util.List;

import com.oy.springStudy.product.model.dto.ProductDTO;

public interface ProductService {

	public List<ProductDTO> getSelectAll();
	public ProductDTO getSelectOne(ProductDTO param);
	public int setInsert(ProductDTO param);
	public int setUpdate(ProductDTO param);
	public int setDelete(ProductDTO param);
	
}