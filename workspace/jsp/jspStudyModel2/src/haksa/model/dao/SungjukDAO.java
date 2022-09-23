package haksa.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import _common.DB;
import haksa.model.dto.SungjukDTO;

public class SungjukDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<SungjukDTO> getSelectAll() {
		ArrayList<SungjukDTO> list = new ArrayList<SungjukDTO>();
		conn = DB.dbConn();
		try {
			String query = "select sj.*, "
						 + "	(select sihumName from haksaSihum sh where sh.sihumNo = sj.sihumNo) sihumName, "
						 + "	(select name from haksaMember mb where mb.hakbun = sj.hakbun) studentName "
						 + "from haksaSungjuk sj order by sj.sungjukNo desc";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SungjukDTO dto = new SungjukDTO();
				dto.setSungjukNo(rs.getInt("sungjukNo"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				dto.setGrade(rs.getString("grade"));
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setStudentName(rs.getString("studentName"));
				dto.setSihumName(rs.getString("sihumName"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return list;
	}
	
	public SungjukDTO getSelectOne(int sungjukNo) {
		SungjukDTO dto = new SungjukDTO();
		conn = DB.dbConn();
		try {
			String query = "select sj.*, "
					 + "	(select sihumName from haksaSihum sh where sh.sihumNo = sj.sihumNo) sihumName, "
					 + "	(select name from haksaMember mb where mb.hakbun = sj.hakbun) studentName "
					 + "from haksaSungjuk sj where sj.hakbun = ? order by sj.sungjukNo desc";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, sungjukNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setSungjukNo(rs.getInt("sungjukNo"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				dto.setGrade(rs.getString("grade"));
				dto.setHakbun(rs.getInt("hakbun"));
				dto.setSihumNo(rs.getInt("sihumNo"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setStudentName(rs.getString("studentName"));
				dto.setSihumName(rs.getString("sihumName"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	public int setInsert(SungjukDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into haksaSungjuk values (seq_haksaSungjuk.nextval, ?, ?, ?, ?, ?, "
						 + " ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getKor());
			pstmt.setInt(2, param.getEng());
			pstmt.setInt(3, param.getMat());
			pstmt.setInt(4, param.getSci());
			pstmt.setInt(5, param.getHis());
			pstmt.setInt(6, param.getTot());
			pstmt.setDouble(7, param.getAvg());
			pstmt.setString(8, param.getGrade());
			pstmt.setInt(9, param.getHakbun());
			pstmt.setInt(10, param.getSihumNo());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(SungjukDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update haksaSungjuk set "
						 + " kor = ?, eng = ?, mat = ?, sci = ?, his = ?, "
						 + " tot = ?, avg = ?, grade = ? "
						 + " where sungjukNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getKor());
			pstmt.setInt(2, param.getEng());
			pstmt.setInt(3, param.getMat());
			pstmt.setInt(4, param.getSci());
			pstmt.setInt(5, param.getHis());
			pstmt.setInt(6, param.getTot());
			pstmt.setDouble(7, param.getAvg());
			pstmt.setString(8, param.getGrade());
			pstmt.setInt(9, param.getSungjukNo());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(SungjukDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from haksaSungjuk where sungjukNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getSungjukNo());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
