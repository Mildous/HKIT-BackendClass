package project.memoMybatis.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import project._mybatisConfig.MybatisManager;
import project.memoMybatis.model.dto.MemoMybatisDTO;

public class MemoMybatisDAO {
	
	String tableName01 = "memo";
	
	public int getTotalRecord(MemoMybatisDTO param) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", param);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.selectOne("memoMybatis.getTotalRecord", map);
		session.close();
		
		return result;
	}
	
	public List<MemoMybatisDTO> getSelectAll(MemoMybatisDTO param) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", param);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		List<MemoMybatisDTO> list = session.selectList("memoMybatis.getSelectAll", map);
		session.close();
		
		return list;
	}
   
	public MemoMybatisDTO getSelectOne(MemoMybatisDTO param) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", param);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		MemoMybatisDTO dto = session.selectOne("memoMybatis.getSelectOne", map);
		session.close();

		return dto;
   }
   
	public int setInsert(MemoMybatisDTO param) {
	Map<String, Object> map = new HashMap<>();
	map.put("dto", param);
	map.put("tableName01", tableName01);
  
	SqlSession session = MybatisManager.getInstance().openSession();
	int result = session.insert("memoMybatis.setInsert", map);
		session.commit();
		session.close();
		return result;
	}
   
	public int setUpdate(MemoMybatisDTO param) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", param);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.update("memoMybatis.setUpdate", map);
		session.commit();
		session.close();
		return result;
	}

	public int setDelete(MemoMybatisDTO param) {
		Map<String, Object> map = new HashMap<>();
		map.put("dto", param);
		map.put("tableName01", tableName01);
		
		SqlSession session = MybatisManager.getInstance().openSession();
		int result = session.delete("memoMybatis.setDelete", map);
		session.commit();
		session.close();
		return result;
	}
}