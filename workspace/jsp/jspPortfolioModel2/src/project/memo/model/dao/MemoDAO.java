package project.memo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.common.DB;
import project.memo.model.dto.MemoDTO;

public class MemoDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getTotalRecord(MemoDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "select count(*) counter from memo where 1 = 1";
			
			if(param.getSearchField().equals("writer")) {
				query += " and writer like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("writer_content")) {
				query += " and (writer like ? or content like ?) ";
			}

			pstmt = conn.prepareStatement(query);
			
			if(param.getSearchField().equals("writer")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("writer_content")) {
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
	
	public ArrayList<MemoDTO> getSelectAll(MemoDTO param) {
		ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from memo where 1 = 1";
			
			if(param.getSearchField().equals("writer")) {
				query += " and writer like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("writer_content")) {
				query += " and (writer like ? or content like ?) ";
			}
			
			query += " order by no desc";
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += query;
			sql += ") A) where rnum >= ? and rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			
			if(param.getSearchField().equals("writer")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("writer_content")) {
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
				MemoDTO dto = new MemoDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
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
	
	public MemoDTO getSelectOne(MemoDTO param) {
		MemoDTO dto = new MemoDTO();
		conn = DB.dbConn();
		try {
			//String query = "select * from memo where no = ?";
			String query = "";
			query += "select * from ( ";
			
			query += "select m.*, ";
			query += "LAG(no) OVER(order by no desc) preNo, ";
			query += "LAG(writer) OVER(order by no desc) preName, ";
			query += "LEAD(no) OVER(order by no desc) nxtNo, ";
			query += "LEAD(writer) OVER(order by no desc) nxtName ";
			
			query += " from memo m  where 1 = 1 ";
			
			if(param.getSearchField().equals("writer")) {
				query += " and writer like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("writer_content")) {
				query += " and (writer like ? or content like ?) ";
			}
			
			query += "order by no desc";
			query += ") where no = ?";
			
			pstmt = conn.prepareStatement(query);
			
			int k = 0;
			if(param.getSearchField().equals("writer")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			
			} else if(param.getSearchField().equals("writer_content")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			
			}
			
			pstmt.setInt(++k, param.getNo());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setPreNo(rs.getInt("preNo"));
				dto.setPreName(rs.getString("preName"));
				dto.setNxtNo(rs.getInt("nxtNo"));
				dto.setNxtName(rs.getString("nxtName"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int setInsert(MemoDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into memo values (seq_memo.nextval, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getWriter());
			pstmt.setString(2, param.getContent());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(MemoDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update memo set content = ? where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getContent());
			pstmt.setInt(2, param.getNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(MemoDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from memo where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}

}
