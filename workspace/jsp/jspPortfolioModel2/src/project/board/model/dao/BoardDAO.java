package project.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import project.common.DB;
import project.board.model.dto.BoardDTO;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getTotalRecord(BoardDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "select count(*) counter from board where 1 = 1";
			
			if(param.getSearchField().equals("subject")) {
				query += " and subject like ? ";
			} else if(param.getSearchField().equals("writer")) {
				query += " and writer like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("all")) {
				query += " and (subject like ? or writer like ? or content like ?) ";
			}
			
			query += " order by noticeNo desc, refNo desc, levelNo asc ";
			
			pstmt = conn.prepareStatement(query);
			
			if(param.getSearchField().equals("subject")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("writer")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("all")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setString(2, '%' + param.getSearchWord() + '%');
				pstmt.setString(3, '%' + param.getSearchWord() + '%');
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
	
	public ArrayList<BoardDTO> getSelectAll(BoardDTO param) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		conn = DB.dbConn();
		try {
			String query = "select * from board where 1 = 1";
			
			if(param.getSearchField().equals("subject")) {
				query += " and subject like ? ";
			} else if(param.getSearchField().equals("writer")) {
				query += " and writer like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("all")) {
				query += " and (subject like ? or writer like ? or content like ?) ";
			}
			
			query += "	order by noticeNo desc, refNo desc, levelNo asc ) A ";
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += query;
			sql += ") A) where rnum between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			if(param.getSearchField().equals("subject")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("writer")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setInt(2, param.getStartRecord());
				pstmt.setInt(3, param.getLastRecord());
			} else if(param.getSearchField().equals("all")) {
				pstmt.setString(1, '%' + param.getSearchWord() + '%');
				pstmt.setString(2, '%' + param.getSearchWord() + '%');
				pstmt.setString(3, '%' + param.getSearchWord() + '%');
				pstmt.setInt(4, param.getStartRecord());
				pstmt.setInt(5, param.getLastRecord());
			} else {
				pstmt.setInt(1, param.getStartRecord());
				pstmt.setInt(2, param.getLastRecord());
			}
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	public BoardDTO getSelectOne(BoardDTO param) {
		BoardDTO dto = new BoardDTO();
		conn = DB.dbConn();
		try {
			//String query = "select * from board where no = ?";
			String query = "";
			query += "select * from ( ";
			
			query += "select b.*, ";
			query += "LAG(no) OVER(order by no desc) preNo, ";
			query += "LAG(name) OVER(order by no desc) preName, ";
			query += "LEAD(no) OVER(order by no desc) nxtNo, ";
			query += "LEAD(name) OVER(order by no desc) nxtName ";
			
			query += " from board b  where 1 = 1 ";
			
			if(param.getSearchField().equals("subject")) {
				query += " and subject like ? ";
			} else if(param.getSearchField().equals("writer")) {
				query += " and writer like ? ";
			} else if(param.getSearchField().equals("content")) {
				query += " and content like ? ";
			} else if(param.getSearchField().equals("all")) {
				query += " and (subject like ? or writer like ? or content like ?) ";
			}
			
			query += " order by noticeNo desc, refNo desc, levelNo asc ";
			query += ") where no = ?";
			
			pstmt = conn.prepareStatement(query);
			
			int k = 0;
			if(param.getSearchField().equals("subject")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("writer")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("content")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			} else if(param.getSearchField().equals("all")) {
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
				pstmt.setString(++k, '%' + param.getSearchWord() + '%');
			}
			
			pstmt.setInt(++k, param.getNo());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setNum(rs.getInt("num"));
				dto.setTbl(rs.getString("tbl"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setRefNo(rs.getInt("refNo"));
				dto.setStepNo(rs.getInt("stepNo"));
				dto.setLevelNo(rs.getInt("levelNo"));
				dto.setParentNo(rs.getInt("parentNo"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSecretGubun(rs.getString("secretGubun"));
				dto.setRegiDate(rs.getDate("regiDate"));
				dto.setAttachInfo(rs.getString("attachInfo"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	public int setInsert(BoardDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "insert into board values (seq_board.nextval, "
					 + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
					 + "?, ?, ?, ?, ?, ?, sysdate, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNum());
			pstmt.setString(2, param.getTbl());
			pstmt.setString(3, param.getWriter());
			pstmt.setString(4, param.getSubject());
			pstmt.setString(5, param.getContent());
			pstmt.setString(6, param.getEmail());
			pstmt.setString(7, param.getPasswd());
			pstmt.setInt(8, param.getRefNo());
			pstmt.setInt(9, param.getStepNo());
			pstmt.setInt(10, param.getLevelNo());
			pstmt.setInt(11, param.getParentNo());
			pstmt.setInt(12, param.getHit());
			pstmt.setString(13, param.getIp());
			pstmt.setInt(14, param.getMemberNo());
			pstmt.setInt(15, param.getNoticeNo());
			pstmt.setString(16, param.getSecretGubun());
			pstmt.setString(17, param.getAttachInfo());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setUpdate(BoardDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "update board set "
					 + "subject = ?, "
					 + "content = ?, "
					 + "email = ?, "
					 + "noticeNo = ?, "
					 + "secretGubun = ?, "
					 + "attachInfo = ? "
					 + "where no = ? and passwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, param.getSubject());
			pstmt.setString(2, param.getContent());
			pstmt.setString(3, param.getEmail());
			pstmt.setInt(4, param.getNoticeNo());
			pstmt.setString(5, param.getSecretGubun());
			pstmt.setString(6, param.getAttachInfo());
			pstmt.setInt(7, param.getNo());
			pstmt.setString(8, param.getPasswd());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int setDelete(BoardDTO param) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "delete from board where no = ? and passwd = ?";
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
	
	public int getMaxNumRefNo(String gubun) {
		int result = 0;
		conn = DB.dbConn();
		try {
			String query = "select nvl(max(" + gubun + "), 0) maxValue from board";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("maxValue");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public void setUpdateRelevel(BoardDTO param) {
		conn = DB.dbConn();
		try {
			String query = "update board set levelNo = (levelNo + 1) where refNo = ? and levelNo > ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getRefNo());
			pstmt.setInt(2, param.getLevelNo());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
	}
	
	public void setUpdateHit(BoardDTO param) {
		conn = DB.dbConn();
		try {
			String query = "update board set hit = (hit + 1) where no = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, param.getNo());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DB.dbConnClose(rs, pstmt, conn);
		}
	}

}
