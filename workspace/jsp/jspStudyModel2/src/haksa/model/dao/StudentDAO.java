package haksa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import _common.DB;
import haksa.model.dto.StudentDTO;

public class StudentDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<StudentDTO> getSelectAll() {
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from haksaMember order by hakbun desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setParentPhone(rs.getString("parentPhone"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				dto.setAddr4(rs.getString("addr4"));
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
	
	public StudentDTO getSelectOne(int hakbun) {
		StudentDTO dto = new StudentDTO();
		conn = DB.dbConn();
		try {
			String query = "select * from haksaMember where hakbun = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hakbun);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setParentPhone(rs.getString("parentPhone"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setAddr3(rs.getString("addr3"));
				dto.setAddr4(rs.getString("addr4"));
				dto.setRegiDate(rs.getDate("regiDate"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(StudentDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into haksaMember values (seq_haksaMember.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getName());
			pstmt.setString(2, param.getPhone());
			pstmt.setString(3, param.getParentPhone());
			pstmt.setString(4, param.getAddr1());
			pstmt.setString(5, param.getAddr2());
			pstmt.setString(6, param.getAddr3());
			pstmt.setString(7, param.getAddr4());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(StudentDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update haksaMember set phone = ?, parentPhone = ?, addr1 = ?, addr2 = ?, addr3 = ?, addr4 = ? ";
			query += " where hakbun = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getPhone());
			pstmt.setString(2, param.getParentPhone());
			pstmt.setString(3, param.getAddr1());
			pstmt.setString(4, param.getAddr2());
			pstmt.setString(5, param.getAddr3());
			pstmt.setString(6, param.getAddr4());
			pstmt.setInt(7, param.getHakbun());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(StudentDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from haksaMember where hakbun = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getHakbun());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
