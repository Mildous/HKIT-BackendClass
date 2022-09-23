package project.memo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.common.DB;
import project.memo.model.dto.MemoDTO;

public class MemoDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<MemoDTO> getSelectAll() {
		ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from memo order by no desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemoDTO dto = new MemoDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegiDate(rs.getDate("regiDate"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public MemoDTO getSelectOne(MemoDTO param) {
		MemoDTO dto = new MemoDTO();
		conn = DB.dbConn();
		try {
			String query = "select * from memo where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int setInsert(MemoDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into memo values (seq_memo.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getWriter());
			pstmt.setString(2, param.getContent());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(MemoDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update memo set content = ? where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getContent());
			pstmt.setInt(2, param.getNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(MemoDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from memo where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
