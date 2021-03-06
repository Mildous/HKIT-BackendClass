package guestbook.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DB;

public class GuestBookDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<GuestBookDTO> getSelectAll() {
		ArrayList<GuestBookDTO> list = new ArrayList<GuestBookDTO>();
		try {
			conn = DB.dbConn();
			
			String sql = "select no, writer, subject, regiDate from guestbook order by no desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GuestBookDTO dto = new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
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
		try {
			conn = DB.dbConn();
			
			String sql = "select * from guestbook where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegiDate(rs.getDate("regiDate"));
				
			} else {
			System.out.println("없는 번호입니다..");
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
		try {
			conn = DB.dbConn();
			
			String sql = "insert into guestbook values (seq_guestbook.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paramDto.getWriter());
			pstmt.setString(2, paramDto.getSubject());
			pstmt.setString(3, paramDto.getContent());
			pstmt.setString(4, paramDto.getPasswd());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public boolean checkPw(GuestBookDTO paramDto) {
		boolean pwChecker = false;
		try {
			conn = DB.dbConn();
			String sql = "select passwd from guestbook where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(paramDto.getPasswd().equals(rs.getString("passwd"))) {
					pwChecker = true;
				} else {
					System.out.println("비밀번호가 틀렸습니다..");
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return pwChecker;
	}
	
	public int setUpdate(GuestBookDTO paramDto) {
		GuestBookDTO dto = new GuestBookDTO();
		int result = 0;
		try {
			conn = DB.dbConn();

			String sql = "update guestbook set subject = ?, content = ? where no = ?";
			pstmt = conn.prepareStatement(sql);
				
			pstmt.setString(1, paramDto.getSubject());
			pstmt.setString(2, paramDto.getContent());
			pstmt.setInt(3, paramDto.getNo());
								
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
		try {
			conn = DB.dbConn();
			
			String sql = "delete from guestbook where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paramDto.getNo());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
