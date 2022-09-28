package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.model.dto.MemberDTO;
import util.DB;


public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDTO getSelectOne(String id, String passwd) {
		MemberDTO dto = new MemberDTO();
		conn = DB.dbConn();
		try {
			String query = "select * from member where id = ? and passwd = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setChangeDate(rs.getDate("changeDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public MemberDTO getPassMonths(String id) {
		MemberDTO dto = new MemberDTO();
		conn = DB.dbConn();
		try {
			String query = "select id, trunc(months_between(sysdate, changeDate))month from member where id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPassMonth(rs.getInt("month"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int updatePass(String id, String passwd) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update member set passwd = ?, changeDate = sysdate where id = ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}

}
