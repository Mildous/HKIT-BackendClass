package haksa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import _common.DB;
import haksa.model.dto.SihumDTO;

public class SihumDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<SihumDTO> getSelectAll() {
		ArrayList<SihumDTO> list = new ArrayList<SihumDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from haksaSihum order by sihumNo desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SihumDTO dto = new SihumDTO();
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setSihumName(rs.getString("sihumName"));
				dto.setSihumDate(rs.getDate("sihumDate"));
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
	
	public SihumDTO getSelectOne(int sihumNo) {
		SihumDTO dto = new SihumDTO();
		conn = DB.dbConn();
		try {
			String query = "select * from haksaSihum where sihumNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sihumNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setSihumName(rs.getString("sihumName"));
				dto.setSihumDate(rs.getDate("sihumDate"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(SihumDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into haksaSihum values (seq_haksaSihum.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getSihumName());
			pstmt.setDate(2, param.getSihumDate());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(SihumDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update haksaSihum set sihumName = ?, sihumDate = ? ";
			query += " where sihumNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getSihumName());
			pstmt.setDate(2, param.getSihumDate());
			pstmt.setInt(3, param.getSihumNo());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(SihumDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from haksaSihum where sihumNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getSihumNo());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
