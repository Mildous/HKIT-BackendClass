package guestbook.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import guestbook.model.dto.GuestBookDTO;

public class GuestBookDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<GuestBookDTO> getSelectAll() {
		ArrayList<GuestBookDTO> list = new ArrayList<>();
		conn = DB.dbConn();
		try {
			String sql = "select * from guestBook order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GuestBookDTO dto = new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
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
	
	public GuestBookDTO getSelectOne(GuestBookDTO paramDto) {
		GuestBookDTO dto = new GuestBookDTO();
		conn = DB.dbConn();
		try {
			String sql = "select * from guestBook where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
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
	
	public int setInsert(GuestBookDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into guestBook values (seq_guestBook.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getName());
			pstmt.setString(2, paramDto.getEmail());
			pstmt.setString(3, paramDto.getPasswd());
			pstmt.setString(4, paramDto.getContent());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(GuestBookDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update guestBook set content = ? where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getContent());
			pstmt.setInt(2, paramDto.getNo());
			pstmt.setString(3, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(GuestBookDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from guestBook where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			pstmt.setString(2, paramDto.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}
