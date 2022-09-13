package subBoard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import subBoard.model.dto.SubBoardChkDTO;

public class SubBoardChkDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<SubBoardChkDTO> getSelectAll() {
		ArrayList<SubBoardChkDTO> list = new ArrayList<SubBoardChkDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from boardChk order by boardChkNo desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SubBoardChkDTO dto = new SubBoardChkDTO();
				dto.setBoardChkNo(rs.getInt("boardChkNo"));
				dto.setTbl(rs.getString("tbl"));
				dto.setTblName(rs.getString("tblName"));
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
	
	public SubBoardChkDTO getSelectOne(String tbl) {
		SubBoardChkDTO dto = new SubBoardChkDTO();
		conn = DB.dbConn();
		try {
			String query = "select * from boardChk where tbl = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tbl);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setBoardChkNo(rs.getInt("boardChkNo"));
				dto.setTbl(rs.getString("tbl"));
				dto.setTblName(rs.getString("tblName"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(SubBoardChkDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into boardChk values (seq_boardChk.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getTbl());
			pstmt.setString(2, param.getTblName());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(SubBoardChkDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update boardChk set tbl = ?, tblName = ? where boardChkNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getTbl());
			pstmt.setString(2, param.getTblName());
			pstmt.setInt(3, param.getBoardChkNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(SubBoardChkDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from boardChk where boardChkNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getBoardChkNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
