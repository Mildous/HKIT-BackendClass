package bookInfo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bookInfo.model.dto.BookInfoDTO;
import config.DB;

public class BookInfoDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String tableName_1 = "bookInfo";
	
	public ArrayList<BookInfoDTO> getSelectAll() {
		ArrayList<BookInfoDTO> list = new ArrayList<BookInfoDTO>();
		conn = DB.dbConn();
		try {
			String sql = "select i.infoNo, i.subject, i.created, (";
			sql += " select author from bookAuthor a where a.authorNo = i.authorNo) author, (";
			sql += " select profile from bookProfile p where p.profileNo = i.profileNo) profile, ";
			sql += " i.regiDate from " + tableName_1 + " i order by infoNo desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BookInfoDTO resultDto = new BookInfoDTO();
				resultDto.setInfoNo(rs.getInt("infoNo"));
				resultDto.setSubject(rs.getString("subject"));
				resultDto.setCreated(rs.getDate("created"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setProfile(rs.getString("profile"));
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
	
	public BookInfoDTO getSelectOne(BookInfoDTO paramDto) {
		BookInfoDTO resultDto = new BookInfoDTO();
		conn = DB.dbConn();
		try {
			String sql = "select i.infoNo, i.subject, i.created, i.authorNo, (";
			sql += " select author from bookAuthor a where a.authorNo = i.authorNo) author, i.profileNo, (";
			sql += " select profile from bookProfile p where p.profileNo = i.profileNo) profile ";
			sql += " from " + tableName_1 + " i where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getInfoNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultDto.setInfoNo(rs.getInt("infoNo"));
				resultDto.setSubject(rs.getString("subject"));
				resultDto.setCreated(rs.getDate("created"));
				resultDto.setAuthorNo(rs.getInt("authorNo"));
				resultDto.setAuthor(rs.getString("author"));
				resultDto.setProfile(rs.getString("profile"));
				resultDto.setProfileNo(rs.getInt("profileNo"));
			}
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return resultDto;
	}
	
	public int setInsert(BookInfoDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "insert into " + tableName_1 + " values(seq_bookInfo.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setDate(2, paramDto.getCreated());
			pstmt.setInt(3, paramDto.getAuthorNo());
			pstmt.setInt(4, paramDto.getProfileNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BookInfoDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "update " + tableName_1 + " set subject = ?, created = ?, authorNo = ?, profileNo = ? where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setDate(2, paramDto.getCreated());
			pstmt.setInt(3, paramDto.getAuthorNo());
			pstmt.setInt(4, paramDto.getProfileNo());
			pstmt.setInt(5, paramDto.getInfoNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BookInfoDTO paramDto) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String sql = "delete from " + tableName_1 + " where infoNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getInfoNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			//e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
}