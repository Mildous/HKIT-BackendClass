package com.oy.springStudy.product.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oy.springStudy.product.model.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> getSelectAll() {
		return sqlSession.selectList("product.getSelectAll");
	}

	@Override
	public ProductDTO getSelectOne(ProductDTO param) {
		return sqlSession.selectOne("product.getSelectOne", param);
	}

	@Override
	public int setInsert(ProductDTO param) {
		return sqlSession.insert("product.setInsert", param);
	}

	@Override
	public int setUpdate(ProductDTO param) {
		return sqlSession.update("product.setUpdate", param);
	}

	@Override
	public int setDelete(ProductDTO param) {
		return sqlSession.delete("product.setDelete", param);
	}

}
