package haksaSihum.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import haksaSihum.model.dto.HaksaSihumDTO;

public class HaksaSihumDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String table_1 = "haksaSihum";
	
	public ArrayList<HaksaSihumDTO> getSelectAll() {
		ArrayList<HaksaSihumDTO> list = new ArrayList<HaksaSihumDTO>();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + table_1 + " order by sihumNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HaksaSihumDTO resultDto = new HaksaSihumDTO();
				resultDto.setSihumNo(rs.getInt("sihumNo"));
				resultDto.setSihumName(rs.getString("sihumName"));
				resultDto.setSihumDate(rs.getDate("sihumDate"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
				list.add(resultDto);
			}
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public HaksaSihumDTO getSelectOne(HaksaSihumDTO paramDto) {
		HaksaSihumDTO resultDto = new HaksaSihumDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from " + table_1 + " where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSihumNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setSihumNo(rs.getInt("sihumNo"));
				resultDto.setSihumName(rs.getString("sihumName"));
				resultDto.setSihumDate(rs.getDate("sihumDate"));
				resultDto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return resultDto;
	}
	
	public int setInsert(HaksaSihumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into " + table_1 + " values(seq_haksaSihum.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSihumName());
			pstmt.setDate(2, paramDto.getSihumDate());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(HaksaSihumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update " + table_1 + " set sihumDate = ? where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setDate(1, paramDto.getSihumDate());
			pstmt.setInt(2, paramDto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(HaksaSihumDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from " + table_1 + " where sihumNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getSihumNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}