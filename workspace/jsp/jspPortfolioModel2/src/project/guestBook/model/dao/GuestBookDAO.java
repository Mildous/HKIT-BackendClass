package project.guestBook.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.common.DB;
import project.guestBook.model.dto.GuestBookDTO;

public class GuestBookDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getTotalRecord(GuestBookDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "select count(*) counter from guestBook where 1 = 1";
			
			if(param.getSearchField().equals("name")) {
				query += " and name like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("name_content")) {
				query += " and (name like ? or content like ?) ";
			}

			pstmt = conn.prepareStatement(query);
			
			if(param.getSearchField().equals("name")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("name_content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setString(2, '%' + param.getSearchWord() + '%');
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("counter");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public ArrayList<GuestBookDTO> getSelectAll(GuestBookDTO param) {
		ArrayList<GuestBookDTO> list = new ArrayList<GuestBookDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from guestBook where 1 = 1";
			
			if(param.getSearchField().equals("name")) {
				query += " and name like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("name_content")) {
				query += " and (name like ? or content like ?) ";
			}
			
			query += " order by no desc";
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += query;
			sql += ") A) where rnum >= ? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			if(param.getSearchField().equals("name")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("name_content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setString(2, '%' + param.getSearchWord() + '%');
				pstmt.setInt(3, param.getStartRecord());
				pstmt.setInt(4, param.getLastRecord());
			} else {
				pstmt.setInt(1, param.getStartRecord());
				pstmt.setInt(2, param.getLastRecord());
			}
			
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
	
	public GuestBookDTO getSelectOne(GuestBookDTO param) {
		GuestBookDTO dto = new GuestBookDTO();
		conn = DB.dbConn();
		try {
			//String query = "select * from guestBook where no = ?";
			String query = "";
			query += "select * from ( ";
			
			query += "select m.*, ";
			query += "LAG(no) OVER(order by no desc) preNo, ";
			query += "LAG(name) OVER(order by no desc) preName, ";
			query += "LEAD(no) OVER(order by no desc) nxtNo, ";
			query += "LEAD(name) OVER(order by no desc) nxtName ";
			
			query += " from guestBook m  where 1 = 1 ";
			
			if(param.getSearchField().equals("name")) {
				query += " and name like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("name_content")) {
				query += " and (name like ? or content like ?) ";
			}
			
			query += "order by no desc";
			query += ") where no = ?";
			
			pstmt = conn.prepareStatement(query);
			
			int k = 0;
			if(param.getSearchField().equals("name")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			
			} else if(param.getSearchField().equals("name_content")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			
			}
			
			pstmt.setInt(++k, param.getNo());
			
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
	
	public int setInsert(GuestBookDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into guestBook values (seq_guestBook.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getName());
			pstmt.setString(2, param.getEmail());
			pstmt.setString(3, param.getPasswd());
			pstmt.setString(4, param.getContent());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(GuestBookDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update guestBook set email = ?, content = ? where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getEmail());
			pstmt.setString(2, param.getContent());
			pstmt.setInt(3, param.getNo());
			pstmt.setString(4, param.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(GuestBookDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from guestBook where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNo());
			pstmt.setString(2, param.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
